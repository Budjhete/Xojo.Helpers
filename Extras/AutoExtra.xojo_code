#tag Module
Protected Module AutoExtra
	#tag Method, Flags = &h0
		Function ArrayElementType(Extends pAuto As Auto) As integer
		  Using Xojo.Introspection
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t.ArrayElementType
		  case GetTypeInfo(Integer)
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
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoBooleanValue(Extends pAuto As Auto) As Boolean
		  Dim v as Boolean
		  v = pAuto
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function AutoCurrencyValue(Extends pAuto As Auto) As Currency
		  Dim v as Currency
		  v = pAuto
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoDateValue(Extends pAuto As Auto) As Xojo.Core.Date
		  Dim v as Xojo.Core.Date
		  v = Xojo.Core.date.FromText(pAuto)
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoDoubleValue(Extends pAuto As Auto) As Double
		  Dim v as Double
		  v = pAuto
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoIntegerValue(Extends pAuto As Auto) As Integer
		  Dim v as integer
		  v = pAuto
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function AutoStringValue(Extends pAuto As Auto) As String
		  Dim v as Text
		  v = pAuto
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoTextValue(Extends pAuto As Auto) As Text
		  Dim v as Text
		  v = pAuto
		  Return v
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

	#tag Method, Flags = &h0
		Function Type(Extends pAuto As Auto) As integer
		  Using Xojo.Introspection
		  dim t as TypeInfo = GetType(pAuto)
		  
		  Select case t
		  case GetTypeInfo(Integer)
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
