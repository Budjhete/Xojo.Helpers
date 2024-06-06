#tag Module
Protected Module ColorExtra
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target64Bit))
		Function ToText(extends c as Color) As String
		  Dim tHexRed, tHexGreen, tHexBlue, tHexAlpha As String
		  
		  tHexRed = "00" + c.Red.ToHex
		  tHexGreen = "00" + c.Green.ToHex
		  tHexBlue = "00" + c.Blue.ToHex
		  tHexAlpha= "00" + c.Alpha.ToHex
		  
		  Dim hexColor As String = tHexRed.Right(2) + _
		  tHexGreen.Right(2) + _
		  tHexBlue.Right(2) +  _
		  tHexAlpha.Right(2) 
		  
		  return hexColor
		End Function
	#tag EndMethod


End Module
#tag EndModule
