#tag Class
Protected Class Validation
	#tag Method, Flags = &h0
		Function checkValue(value as String) As Boolean
		  if RuleDate and not Valid.Validdate(value) then
		    return false
		  end
		  
		  if RuleDigit and not Valid.digit(value) then
		    return false
		  end
		  
		  if RuleEmail and not Valid.email(value) then
		    return false
		  end
		  
		  if RuleExactLength > 0 and not Valid.ExactLength(value, RuleExactLength) then
		    return false
		  end
		  
		  if RuleMaxLength > 0 and not Valid.MaxLength(value, RuleMaxLength) then
		    return false
		  end
		  
		  if RuleMinLength > 0 and not Valid.ExactLength(value, RuleMinLength) then
		    return false
		  end
		  
		  if RuleNotEmpty and Valid.Empty(value) then
		    return false
		  end
		  
		  if RuleNumeric and not Valid.numeric(value) then
		    return false
		  end
		  
		  if RulePhone and not Valid.phone(value) then
		    return false
		  end
		  
		  if RuleRegex <> "" and not Valid.ValidRegex(value, RuleRegex) then
		    return false
		  end
		  
		  if RuleURL and not Valid.url(value) then
		    return false
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data as Dictionary)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		RuleDate As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleDigit As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleEmail As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleExactLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleMaxLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleMinLength As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleNotEmpty As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleNumeric As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RulePhone As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleRegex As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RuleURL As Boolean = false
	#tag EndProperty


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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleDate"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleDigit"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleEmail"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleExactLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleMaxLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleMinLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleNotEmpty"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleNumeric"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RulePhone"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleRegex"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RuleURL"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
End Class
#tag EndClass
