#tag Class
Protected Class BudjheteException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Function Code() As Integer
		  return mCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as Text)
		  Me.ErrorMessage = message
		  
		  System.DebugLog(self.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as Text, code as Integer)
		  Me.ErrorMessage = message
		  mCode = code
		  
		  System.DebugLog(self.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as Text, code as Integer, location as Text)
		  Me.ErrorMessage = message
		  mCode = code
		  mLocation = location
		  
		  System.DebugLog(ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HumanReadableCode(code as Integer) As Text
		  select case code
		  case E_UNDEFINED
		    return "Undefined"
		  case E_ERROR
		    return "Error"
		  case E_WARNING
		    return "Warning"
		  case E_PARSE
		    return "Parse error"
		  case E_NOTICE
		    return "Notice"
		  case E_USER_ERROR
		    return "User error"
		  case E_USER_WARNING
		    return "User warning"
		  case E_USER_NOTICE
		    return "User notice"
		  case E_STRICT
		    return "Strict"
		  case E_RECOVERABLE_ERROR
		    return "Recoverable error"
		  case E_DEPRECATED
		    return "Deprecated"
		  case E_USER_DEPRECATED
		    return "User deprecated"
		  end
		  
		  return "Multiple"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Location() As Text
		  return mLocation
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorMessage As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCode As Integer = E_UNDEFINED
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLocation As Text
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
			Name="Reason"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
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
			Type="Text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
