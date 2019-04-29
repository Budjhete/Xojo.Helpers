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
		  
		  
		  if pAuto isa Xojo.Core.Date then return 17
		  if t.IsClass then Return 10
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoBooleanValue(Extends pAuto As Auto) As Boolean
		  if pAuto = nil then
		    Return false
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    dim i as integer = pAuto.AutoIntegerValue
		    Return i.BooleanValue
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText.IntegerValue.BooleanValue
		  Case 37 // text
		    dim t as text = pAuto
		    
		    Return t = "true" or t = "TRUE" or t = "True"
		    
		  Case 6 // Currency
		    Return pAuto.AutoCurrencyValue.ToText.IntegerValue.BooleanValue
		    
		  Case 11 // Boolean
		    Return pAuto
		  Case 9 // Object
		    Return false
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function AutoCurrencyValue(Extends pAuto As Auto) As Currency
		  if pAuto = nil then
		    Return 0
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.AutoTextValue.CurrencyValue
		  case 5 // Double
		    dim c as Currency = pAuto
		    Return c
		  Case 37 // text
		    Return pAuto.AutoTextValue.CurrencyValue
		  Case 6 // Currency
		    Return pAuto
		    
		  Case 11 // Boolean
		    if pAuto.AutoBooleanValue then
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
		Function AutoDateValue(Extends pAuto As Auto) As Xojo.Core.Date
		  if pAuto = nil then
		    Return Xojo.Core.Date.Now
		  end if
		  
		  Select case pAuto.Type
		  Case 37 // text
		    Return Xojo.Core.date.FromText(pAuto.AutoTextValue)
		  Case 17
		    Return pAuto
		  case 10
		    #if TargetIOS
		      Dim d as date
		    #else
		      dim d as new date
		    #endif
		    d = pAuto
		    Return Xojo.Core.date.FromText(d.SQLDateTime.ToText)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoDoubleValue(Extends pAuto As Auto) As Double
		  if pAuto = nil then
		    Return 0
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.AutoTextValue.DoubleValue
		  case 5 // Double
		    Return pAuto
		  Case 37 // text
		    Return pAuto.AutoTextValue.DoubleValue
		  Case 6 // Currency
		    Return pAuto.AutoTextValue.DoubleValue
		    
		  Case 11 // Boolean
		    if pAuto.AutoBooleanValue then
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
		Function AutoIntegerValue(Extends pAuto As Auto) As Integer
		  if pAuto = nil then
		    Return -1
		  end if
		  
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText.IntegerValue
		  Case 37 // text
		    Return pAuto.AutoTextValue.IntegerValue
		  Case 6 // Currency
		    Return pAuto.AutoCurrencyValue.ToText.IntegerValue
		    
		  Case 11 // Boolean
		    if pAuto.AutoBooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return -1
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function AutoStringValue(Extends pAuto As Auto) As String
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.AutoIntegerValue.ToText
		  case 5 // Double
		    Return pAuto.AutoDoubleValue.ToText
		  Case 37 // text
		    Return pAuto
		  Case 8 // String
		    Return pAuto
		  Case 6 // Currency
		    Return pAuto.AutoCurrencyValue.ToText
		    
		  Case 11 // Boolean
		    Return pAuto.AutoBooleanValue.TextValue
		    
		  Case 9 // Object
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoTextValue(Extends pAuto As Auto) As Text
		  Select case pAuto.Type
		  case 3 // integer
		    Return pAuto.AutoIntegerValue.ToText
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
		    Return pAuto.AutoCurrencyValue.ToText
		    
		  Case 11 // Boolean
		    Return pAuto.AutoBooleanValue.TextValue
		    
		  Case 9 // Object
		    Return ""
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
		  case GetTypeInfo(Integer)
		    return pAuto = 0
		  case GetTypeInfo(Double)
		    return pAuto = 0
		  Case GetTypeInfo(Text)
		    return pAuto = ""
		  Case GetTypeInfo(Currency)
		    return pAuto = 0
		  Case GetTypeInfo(Boolean)
		    return pAuto
		  Case GetTypeInfo(Object)
		    Dim pObj as Object
		    pObj = pAuto
		    Return pObj = nil
		  else
		    Return true
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
		  
		  if pAuto isa Xojo.Core.Date then return 17
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
		  
		  if pAuto isa Xojo.Core.Date then return 17
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
		  
		  if pAuto isa Xojo.Core.Date then return "XojoDate"
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
		  
		  if pAuto isa Xojo.Core.Date then return "XojoDate"
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
		    a = pVariant.TextValue
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
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
