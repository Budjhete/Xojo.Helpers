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
		  Me.Message = message
		  
		  System.Log(System.LogLevelERROR, self.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer)
		  Me.Message = message
		  mCode = code
		  
		  System.Log(System.LogLevelERROR, self.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String)
		  Me.Message = message
		  mCode = code
		  mLocation = location
		  
		  System.Log(System.LogLevelERROR, self.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HumanReadableCode(code as Integer) As String
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
		Function Location() As String
		  return mLocation
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mCode As Integer = E_UNDEFINED
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLocation As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Reason"
			Group="Behavior"
			Type="Text"
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
