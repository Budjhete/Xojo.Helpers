#tag Module
Protected Module Valid
	#tag Method, Flags = &h0
		Function Alpha(value as Text) As Boolean
		  return ValidRegex(value, "^[A-Za-zÇçŒœÄËÏÖÜäëïöüÀÈÌÒÙàèìòùÂÊÎÔÛâêîôûÁÉÍÓÚáéíóú]++$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlphaDash(value as String) As Boolean
		  // Not implemented yet
		  Raise New RuntimeException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlphaNumeric(value as Text) As Boolean
		  return ValidRegex(value, "^[A-Za-z0-9ÇçŒœÄËÏÖÜäëïöüÀÈÌÒÙàèìòùÂÊÎÔÛâêîôûÁÉÍÓÚáéíóú]+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlphaNumericDash(value as Text) As Boolean
		  return ValidRegex(value, "^[,.A-Za-z0-9_ÇçŒœÄËÏÖÜäëïöüÀÈÌÒÙàèìòùÂÊÎÔÛâêîôûÁÉÍÓÚáéíóú_-]+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Decimal(value as Text, decimals as Integer = 0, digits as Integer = 0) As Boolean
		  dim decimals_mask, digits_mask as Text
		  
		  if decimals > 0 then
		    decimals_mask = "{"+decimals.ToText+"}"
		  else
		    decimals_mask = "+"
		  end
		  
		  
		  if digits > 0 then
		    digits_mask = "{"+digits.ToText+"}"
		  else
		    digits_mask = "+"
		  end
		  
		  return ValidRegex(value, "^[+-]?[0-9]"+digits_mask+"[\.,][0-9]"+decimals_mask+"$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Digit(value as Text) As Boolean
		  return ValidRegex(value, "^[0-9]++$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Email(value as Text) As Boolean
		  Return ValidRegex(value, "^[0-9A-Za-z._%+-]+@[0-9A-Za-z.-]+\.[A-Za-z]{2,6}$")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Empty(pString As String) As Boolean
		  Return pString = ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(value as String, required as String) As Boolean
		  return (value = required)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExactLength(value as Text, length as Integer) As Boolean
		  Return value.Length = length
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxLength(value as String, max_length as Integer) As Boolean
		  Return (value.Len <= max_length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinLength(value as String, min_length as Integer) As Boolean
		  Return (value.Len >= min_length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotEmpty(pString as String) As Boolean
		  Return (pString.Trim) <> ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotNull(pValue As Variant) As Boolean
		  Return  pValue <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Numeric(value as Text) As Boolean
		  Return ValidRegex(value, "^-?+(?=.*[0-9])[0-9]*+[\.,]?+[0-9]*+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumericDash(value as Text) As Boolean
		  return ValidRegex(value, "^[,.0-9_-]+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Phone(value as Text) As Boolean
		  // Garder les chiffres seulement : preg_replace('/\D+/', '', $number);
		  Dim numbers As Text = value.ReplaceAllRegExp("\D+", "")
		  
		  Return ((Valid.ExactLength(numbers, 7) Or Valid.ExactLength(numbers, 10) Or Valid.ExactLength(numbers, 11) Or Valid.ExactLength(numbers, 14) Or Valid.ExactLength(numbers, 15)) And Valid.Digit(numbers) And Not value.Test("[a-zA-Z]"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Positive(value as Text) As Boolean
		  Return ValidRegex(value, "^(?=.*[0-9])[0-9]*+[\.,]?+[0-9]*+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Range(value as Integer, min as Integer, max as Integer) As Boolean
		  return (value >= min and value <= max)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL(value as Text) As Boolean
		  Return ValidRegex(value, "^([a-zA-Z]+://)?([a-zA-Z0-9]+\.)+[a-zA-Z]+(:[0-9]+)?/?.*$")
		  
		  // Regex de Kohana, un peu trop intense pour nos besoins : http://kohanaframework.org/3.2/guide/api/Valid#url
		  // Return Regex(value, "^[-a-z0-9+.]++://(?:[-a-z0-9$_.+!*\'(),;?&=%]++(?::[-a-z0-9$_.+!*\'(),;?&=%]++)?@)?(?:\d{1,3}+(?:\.\d{1,3}+){3}+|((?!-)[-a-z0-9]{1,63}+(?<!-)(?:\.(?!-)[-a-z0-9]{1,63}+(?<!-)){0,126}+))(?::\d{1,5}+)?(?:/.*)?$", "iDx")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValidDate(value as Text) As Boolean
		  // @See : http://www.regular-expressions.info/dates.html
		  Return ValidRegex(value, "^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValidRegex(value As Text, expression As Text, params As Text = "") As Boolean
		  return value.test(expression, params)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ZipCode(value As Text) As Boolean
		  // @See : http://swiki.fromdev.com/2009/04/handy-regular-expressions-zippostal.html
		  Return ValidRegex(value, "(^([0-9]{5})$)|(^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\d{1}[A-Za-z]{1} *\d{1}[A-Za-z]{1}\d{1}$)")
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
