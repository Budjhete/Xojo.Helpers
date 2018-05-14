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

	#tag Method, Flags = &h0
		Function Decimal(Extends x As Double, decimalsCount as Integer = 2) As String
		  dim frac as String = "0"
		  frac = frac.Repeat(decimalsCount)
		  
		  return Format(x, "#0."+frac+";-#0."+frac+";0."+frac).Replace(",", ".").Replace(" ", ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExactMoneyValue(Extends pCurrency As Currency, pUnit As String = "") As String
		  If Len(pUnit) > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return Format(pCurrency, "-###,##0.00#####" + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pCurrency As Currency, pFormat As String) As String
		  Return Format(pCurrency, pFormat)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pDouble As Double, pFormat As String) As String
		  Return Format(pDouble, pFormat)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends pBoolean As Boolean) As Integer
		  If pBoolean Then
		    Return 1
		  Else
		    Return 0
		  End If
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
		Function MoneyValue(Extends pCurrency As Currency, pUnit As String = "") As String
		  If Len(pUnit) > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return Format(pCurrency, MoneyFormatPref + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pDouble As Double, pUnit As String = "") As String
		  If Len(pUnit) > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return Format(pDouble, MoneyFormatPref + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pInteger As Integer, pUnit As String = "") As String
		  If Len(pUnit) > 1 Then
		    pUnit = " " + pUnit
		  End If
		  
		  Return Format(pInteger, MoneyFormatPref + pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentValue(Extends pCurrency As Currency) As String
		  // @deprecated les pourcentages sont des Double, pas des Currency
		  Return Format(pCurrency, "-0.00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentValue(Extends pDouble As Double) As String
		  Return Format(pDouble, "-0.00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PercentValue(Extends pInteger As Integer) As String
		  Return Format(pInteger, "-#")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuantityValue(Extends pDouble As Double) As String
		  Dim pInteger As Integer = pDouble
		  
		  If pDouble = pInteger Then
		    Return Format(pDouble, "-0")
		  End If
		  
		  Return Format(pDouble, "-0.####")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Round(Extends pCurrency As Currency, pPrecision As Integer) As Double
		  dim pExponent as Double = Pow(10, pPrecision)
		  
		  Return Round(pCurrency * pExponent) / pExponent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Round(Extends pDouble As Double, pPrecision As Integer) As Double
		  dim pExponent as Double = Pow(10, pPrecision)
		  
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

	#tag Method, Flags = &h0
		Function StringValue(Extends pBoolean As Boolean) As String
		  If pBoolean Then
		    Return "True"
		  Else
		    Return "False"
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Extends pDouble As Double) As String
		  Return Str(pDouble)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Extends pInteger As Integer) As String
		  Return Str(pInteger)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValueNoZero(Extends pInteger As Integer) As String
		  if pInteger = 0 then Return ""
		  Return Str(pInteger)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValueOuiNon(Extends pBoolean As Boolean) As String
		  If pBoolean Then
		    Return "Oui"
		  Else
		    Return "Non"
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValueOuiNonAverifier(Extends pInteger As Integer) As String
		  Select case pInteger
		  case 1
		    return "Non"
		  case 2
		    return "Oui"
		  case 3
		    Return "À vérifier"
		  else
		    Return "À vérifier"
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XSLValue(Extends pCurrency As Currency) As String
		  Return Str(pCurrency, "-#0.00")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XSLValue(Extends pDouble As Double) As String
		  Return Str(pDouble, "-#0.00")
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Use pDecimale to asjust from a DB or a FILE how much decimal you need, the ajustment are live
			  'dim pDecimale as String = Company.Current.SystemDecimales
			  '
			  'if pDecimale = "" then
			  'pDecimale = "-###,##0.00"
			  'end if
			  return "-###,##0.00"
			End Get
		#tag EndGetter
		MoneyFormatPref As string
	#tag EndComputedProperty


	#tag Constant, Name = MoneyFormat, Type = String, Dynamic = False, Default = \"-###\x2C##0.00##", Scope = Public
	#tag EndConstant

	#tag Constant, Name = QuantityFormat, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MoneyFormatPref"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
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
