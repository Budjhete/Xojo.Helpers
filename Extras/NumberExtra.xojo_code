#tag Module
Protected Module NumberExtra
	#tag Method, Flags = &h0
		Function Between(Extends value as Double, min as Double, max as Double) As Boolean
		  return (value > min and value <max)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Between(Extends value as Integer, min as Integer, max as Integer) As Boolean
		  return (value > min and value <max)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function BooleanValue(Extends pInt As Integer) As Boolean
		  
		  Dim pVariant As Variant = pInt
		  
		  Return pVariant.BooleanValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function BooleanValue(Extends pInt As Integer) As Boolean
		  
		  Dim pVariant As Auto = pInt
		  
		  Return pVariant
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Decimal(Extends x as Double, decimalsCount as Integer = 2) As Text
		  dim frac as Text = "0"
		  frac = frac.Repeat(decimalsCount)
		  
		  return x.ToText(Xojo.Core.Locale.Current, "#0."+frac+";-#0."+frac+";0."+frac).Replace(",", ".").Replace(" ", ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExactMoneyValue(Extends pCurrency As Currency, pUnit As Text = "") As Text
		  If pUnit.Length > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return pCurrency.Format("##0.00#####" + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pCurrency As Currency, pFormat As Text) As Text
		  Dim pDouble as Double = Double.FromText(pCurrency.ToText)
		  Return pDouble.ToText(Xojo.Core.Locale.Raw, pFormat)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pDouble As Double, pFormat As Text) As Text
		  Return pDouble.ToText(Xojo.Core.Locale.Current, pFormat)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function limit(Extends number as Double, min as Double, max as Double) As Double
		  return Min(max, Max(min, number))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function limit(Extends number as Integer, min as Integer, max as Integer) As Integer
		  return Min(max, Max(min, number))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyRound(value as Double) As Double
		  // @deprecated
		  Return value.Round(2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pCurrency As Currency, pFormat As Text = "#0.00", pUnit As Text = "") As Text
		  If pUnit.Length > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return pCurrency.Format(pFormat + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pDouble As Double, pFormat As Text = "#0.00", pUnit As Text = "") As Text
		  If pUnit.Length > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return pDouble.ToText(Xojo.core.Locale.Raw, pFormat + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pInteger As Integer, pFormat As Text = "#0.00", pUnit As Text = "") As Text
		  If pUnit.Length > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  
		  
		  Return pInteger.ToText(Xojo.Core.Locale.Raw, pFormat) + pUnit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentValue(Extends pCurrency As Currency) As Text
		  Using Xojo.Core
		  // @deprecated les pourcentages sont des Double, pas des Currency
		  //Return Format(pCurrency, "-0.00")
		  
		  Return pCurrency.ToText() // Locale.Raw
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function PercentValue(Extends pDouble As Double) As Text
		  //Return Format(pDouble, "-0.00")
		  
		  Return pDouble.ToText(Xojo.Core.Locale.Raw)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentValue(Extends pInteger As Integer) As Text
		  //Return Format(pInteger, "-#")
		  
		  Return pInteger.ToText(Xojo.Core.Locale.Raw)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function POSvalue(Extends pCurrency as Currency, pLenth as Integer, pFormat as string = "-#0.00") As String
		  Dim t as string = Str(pCurrency, pFormat)
		  
		  dim L as integer = t.Len
		  Dim LL as integer
		  
		  if L < pLenth AND L < 10 then LL = pLenth - L
		  
		  for i as integer = 0 to LL
		    t =  " " + t
		  next
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuantityValue(Extends pDouble As Double) As Text
		  Using Xojo.Core
		  
		  Dim pInteger As Integer = pDouble
		  
		  If pDouble = pInteger Then
		    Return pDouble.ToText(Locale.Current, "-0")
		  End If
		  
		  Return pDouble.ToText(Locale.Current, "-0.####")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Round(Extends pCurrency As Currency, pPrecision As Integer) As Double
		  dim pExponent as Double = (10 ^ pPrecision)
		  
		  Return Round(pCurrency * pExponent) / pExponent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Round(Extends pDouble As Double, pPrecision As Integer) As Double
		  dim pExponent as Double = (10 ^ pPrecision)
		  
		  Return Round(pDouble * pExponent) / pExponent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLValue(Extends pBoolean As Boolean) As Integer
		  If pBoolean Then
		    Return 1
		  Else
		    Return 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringValue(Extends pDouble As Double) As String
		  Return pDouble.ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringValue(Extends pInteger As Integer) As String
		  Return pInteger.ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringValue(Extends pInteger as Integer, pLength as Integer) As String
		  dim formatstring as Text
		  for i as Integer = 1 to pLength
		    formatstring = formatstring + "0"
		  next
		  Return pInteger.ToText(Xojo.Core.Locale.Raw, formatstring) //formatstring
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Extends pDouble As Double) As Text
		  Return pDouble.ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Extends pInteger As Integer) As Text
		  Return pInteger.ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Extends pInteger as Integer, pLength as Integer) As Text
		  dim formatstring as Text
		  for i as Integer = 1 to pLength
		    formatstring = formatstring + "0"
		  next
		  Return pInteger.ToText(Xojo.Core.Locale.Raw, formatstring) //formatstring
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XSLValue(Extends pCurrency As Currency) As Text
		  Return Str(pCurrency, "-#0.00").ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XSLValue(Extends pDouble As Double) As Text
		  Return Str(pDouble, "-#0.00").ToText
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Use pDecimale to asjust from a DB or a FILE how much decimal you need, the ajustment are live
			  dim pDecimale as Integer = App.SystemDecimales // add this variable string or method string in APP.
			  dim pFormat as Text = "-###"+App.SeparateurNombre+"##0"+App.SeparateurDecimalNombre+"00"
			  
			  Dim i As Integer
			  
			  For i = 2 To pDecimale - 1
			    pFormat = pFormat + "0"
			  next
			  
			  return pFormat
			End Get
		#tag EndGetter
		MoneyFormatPref As Text
	#tag EndComputedProperty


	#tag Constant, Name = MoneyFormat, Type = Text, Dynamic = False, Default = \"-###\x2C##0.00##", Scope = Public
	#tag EndConstant

	#tag Constant, Name = QuantityFormat, Type = Text, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MoneyFormatPref"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
