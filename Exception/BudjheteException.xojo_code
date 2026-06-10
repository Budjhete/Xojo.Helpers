#tag Class
Protected Class BudjheteException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Function Code() As Integer
		  return mCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String)
		  Me.ErrorMessage = message
		  
		  DebugLog(self.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer)
		  Me.ErrorMessage = message
		  mCode = code
		  
		  DebugLog(self.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String)
		  Me.ErrorMessage = message
		  mCode = code
		  mLocation = location
		  
		  DebugLog(ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HumanReadableCode(code as Integer) As String
		  If code = E_UNDEFINED Then
		    return "Undefined"
		  ElseIf code = E_ERROR Then
		    return "Error"
		  ElseIf code = E_WARNING Then
		    return "Warning"
		  ElseIf code = E_PARSE Then
		    return "Parse error"
		  ElseIf code = E_NOTICE Then
		    return "Notice"
		  ElseIf code = E_USER_ERROR Then
		    return "User error"
		  ElseIf code = E_USER_WARNING Then
		    return "User warning"
		  ElseIf code = E_USER_NOTICE Then
		    return "User notice"
		  ElseIf code = E_STRICT Then
		    return "Strict"
		  ElseIf code = E_RECOVERABLE_ERROR Then
		    return "Recoverable error"
		  ElseIf code = E_DEPRECATED Then
		    return "Deprecated"
		  ElseIf code = E_USER_DEPRECATED Then
		    return "User deprecated"
		  End If
		  
		  return "Multiple"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Location() As String
		  return mLocation
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCode As Integer = E_UNDEFINED
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLocation As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="ErrorMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
