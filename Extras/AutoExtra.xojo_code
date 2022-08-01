#tag Module
Protected Module AutoExtra
	#tag Method, Flags = &h0
		Function ArrayElementType(Extends pAuto As Auto) As integer
		  Using Xojo.Introspection
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t.ArrayElementType
		  case GetTypeInfo(Integer), GetTypeInfo(Int32)
		    Return 3
		  case GetTypeInfo(Double)
		    Return 5
		  Case GetTypeInfo(Text)
		    Return 37
		  Case GetTypeInfo(Currency)
		    Return 6
		  Case GetTypeInfo(Boolean)
		    Return 11
		    'Case GetTypeInfo(Array)
		    'Return 4096
		    'Case GetTypeInfo(Color)
		    'return 16
		  Case GetTypeInfo(Object)
		    Return 9
		  End Select
		  
		  
		  if pAuto isa DateTime then return 17
		  if t.IsClass then Return 10
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoDoubleValue(Extends pAuto As Auto) As Double
		  if pAuto = nil then
		    Return 0
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.StringValue.DoubleValue
		  case 5 // Double
		    Return pAuto
		  Case 37 // text
		    Return pAuto.StringValue.DoubleValue
		  Case 6 // Currency
		    Return pAuto.StringValue.DoubleValue
		    
		  Case 11 // Boolean
		    if pAuto.BooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return 0
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(Extends pAuto As Auto) As Boolean
		  if pAuto = nil then
		    Return false
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    dim i as integer = pAuto.IntegerValue
		    Return i.BooleanValue
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText.IntegerValue.BooleanValue
		  Case 37 // text
		    dim t as text = pAuto
		    
		    Return t = "true" or t = "TRUE" or t = "True" or t="1"
		    
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToText.IntegerValue.BooleanValue
		    
		  Case 11 // Boolean
		    Return pAuto
		  Case 9 // Object
		    Return false
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function CurrencyValue(Extends pAuto As Auto) As Currency
		  if pAuto = nil then
		    Return 0
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.StringValue.CurrencyValue
		  case 5 // Double
		    dim c as Currency = pAuto
		    Return c
		  Case 37 // text
		    Return pAuto.StringValue.CurrencyValue
		  Case 6 // Currency
		    Return pAuto
		    
		  Case 11 // Boolean
		    if pAuto.BooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return 0
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function DateTimeValue(Extends pAuto As Auto) As DateTime
		  if pAuto = nil then
		    Return DateTime.Now
		  end if
		  
		  Select case pAuto.Type
		  Case 37 // text
		    if pAuto.StringValue.Length>9 then
		      Return DateTime.FromString(pAuto.StringValue)
		    else
		      Return DateTime.Now
		    end if
		  Case 17
		    Return pAuto
		  case 10
		    #if TargetIOS
		      Dim d as date
		    #else
		      dim d as new date
		    #endif
		    d = pAuto
		    Return DateTime.FromString(d.SQLDateTime)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends pAuto As Auto) As Integer
		  if pAuto = nil then
		    Return 0
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText.IntegerValue
		  Case 37 // text
		    Return pAuto.StringValue.IntegerValue
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToText.IntegerValue
		    
		  Case 11 // Boolean
		    if pAuto.BooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return -1
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValueNilMinusOne(Extends pAuto As Auto) As Integer
		  if pAuto = nil then
		    Return -1
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText.IntegerValue
		  Case 37 // text
		    Return pAuto.StringValue.IntegerValue
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToText.IntegerValue
		    
		  Case 11 // Boolean
		    if pAuto.BooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return -1
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsArray(Extends pAuto As Auto) As Boolean
		  Return Helpers.isArray(pAuto)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsNull(Extends pAuto As Auto) As Boolean
		  Using Xojo.Introspection
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer), GetTypeInfo(Int32)
		    return pAuto = nil
		  case GetTypeInfo(Double)
		    return pAuto = nil
		  Case GetTypeInfo(Text)
		    return pAuto = nil
		  Case GetTypeInfo(Currency)
		    return pAuto = Nil
		  Case GetTypeInfo(Boolean)
		    return pAuto
		  Case GetTypeInfo(Object)
		    Dim pObj as Object
		    pObj = pAuto
		    Return pObj = nil
		  else
		    Return pAuto = nil
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isNumeric(Extends pAuto As Auto) As Boolean
		  Return xojo.Introspection.GetType(pAuto) = GetTypeInfo(Integer) OR _
		  xojo.Introspection.GetType(pAuto) = GetTypeInfo(Currency) OR _
		  xojo.Introspection.GetType(pAuto) = GetTypeInfo(Double)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringValue(Extends pAuto As Auto) As String
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.IntegerValueNilMinusOne.ToString
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToString
		  Case 37 // text
		    Return pAuto
		  Case 8 // String
		    Return pAuto
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToString
		    
		  Case 11 // Boolean
		    Return pAuto.BooleanValue.ToString
		    
		  Case 9 // Object
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Extends pAuto As Auto) As Text
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.IntegerValue.ToText
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText
		  Case 37 // text
		    Return pAuto
		  case 8 // String
		    #if not TargetIOS
		      dim s as string = pAuto
		      Return s.DefineEncoding(Encodings.UTF8).ToText
		    #endif
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToText
		    
		  Case 11 // Boolean
		    Return pAuto.BooleanValue.TextValue
		    
		  Case 9 // Object
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Type(Extends pAuto As Auto) As integer
		  Using Xojo.Introspection
		  if pAuto=nil then Return 0
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer), GetTypeInfo(Int32), GetTypeInfo(UInteger)
		    Return 3
		  case GetTypeInfo(Double)
		    Return 5
		  Case GetTypeInfo(Text)
		    Return 37
		  Case GetTypeInfo(String)
		    Return 8
		  Case GetTypeInfo(Currency)
		    Return 6
		  Case GetTypeInfo(Boolean)
		    Return 11
		    
		    'Case GetTypeInfo(Array)
		    'Return 4096
		    'Case GetTypeInfo(Color)
		    'return 16
		  Case GetTypeInfo(Object)
		    Return 9
		    
		  End Select
		  
		  
		  if pAuto.IsArray then Return 4096
		  if pAuto isa DateTime then return 17
		  if pAuto IsA Dictionary then Return 12
		  if t.IsClass then Return 10
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function Type(Extends pAuto As Auto) As integer
		  Using Xojo.Introspection
		  if pAuto=nil then Return 0
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer), GetTypeInfo(Int32)
		    Return 3
		  case GetTypeInfo(Double)
		    Return 5
		  Case GetTypeInfo(Text)
		    Return 37
		  Case GetTypeInfo(Currency)
		    Return 6
		  Case GetTypeInfo(Boolean)
		    Return 11
		    
		    'Case GetTypeInfo(Array)
		    'Return 4096
		    'Case GetTypeInfo(Color)
		    'return 16
		  Case GetTypeInfo(Object)
		    Return 9
		    
		  End Select
		  
		  if pAuto isa DateTime then return 17
		  if t.IsClass then Return 10
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function TypeText(Extends pAuto As Auto) As Text
		  Using Xojo.Introspection
		  if pAuto=nil then Return "NULL"
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer)
		    Return "Integer"
		  case GetTypeInfo(Int32)
		    Return "Integer32"
		  case GetTypeInfo(Double)
		    Return "Double"
		  Case GetTypeInfo(Text)
		    Return "Text"
		  Case GetTypeInfo(String)
		    Return "String"
		  Case GetTypeInfo(Currency)
		    Return "Currency"
		  Case GetTypeInfo(Boolean)
		    Return "Boolean"
		    
		    'Case GetTypeInfo(Array)
		    'Return 4096
		    'Case GetTypeInfo(Color)
		    'return 16
		  Case GetTypeInfo(Object)
		    Return "Object"
		    
		  End Select
		  
		  if pAuto isa DateTime then return "XojoDate"
		  if t.IsClass then Return "Class"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function TypeText(Extends pAuto As Auto) As Text
		  Using Xojo.Introspection
		  if pAuto=nil then Return "NULL"
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer)
		    Return "Integer"
		  case GetTypeInfo(Int32)
		    Return "Integer32"
		  case GetTypeInfo(Double)
		    Return "Double"
		  Case GetTypeInfo(Text)
		    Return "Text"
		  Case GetTypeInfo(Currency)
		    Return "Currency"
		  Case GetTypeInfo(Boolean)
		    Return "Boolean"
		    
		    'Case GetTypeInfo(Array)
		    'Return 4096
		    'Case GetTypeInfo(Color)
		    'return 16
		  Case GetTypeInfo(Object)
		    Return "Object"
		    
		  End Select
		  
		  if pAuto isa DateTime then return "XojoDate"
		  if t.IsClass then Return "Class"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function VariantAuto(Extends pVariant As Variant) As Auto
		  Dim dType As Integer = VarType(pVariant)
		  Dim a As Auto
		  
		  Select case dType
		    
		  case 0 //    TypeNil
		    return nil  
		  case 2, 3 //   TypeInt32
		    a = pVariant.IntegerValue
		  case 4, 5 //   TypeSingle
		    a = pVariant.DoubleValue
		  case 6 //   TypeCurrency
		    a = pVariant.CurrencyValue
		  case 7 //   TypeDate
		    a = pVariant.DateValue
		  case 8 //   TypeString
		    a = pVariant.StringValue
		  case 9 //   TypeObject
		    a = pVariant.ObjectValue
		  case 11 //   TypeBoolean
		    a = pVariant.BooleanValue
		  case 16 //   TypeColor
		    a = pVariant.ColorValue
		  case 37 //   TypeText
		    a = pVariant.StringValue
		  else
		    a = nil
		    
		  End Select
		  Return a
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
