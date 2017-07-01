#tag Class
Protected Class BHException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Function Classname() As String
		  // Return the name of the class of the current exception
		  return Introspection.GetType(Me).Fullname
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, errorNumber as Integer, ParamArray variables as Pair)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param errorNumber: Error code
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		  
		  Me.ErrorNumber = errorNumber
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, errorNumber as Integer, location as String, ParamArray variables as Pair)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param errorNumber: Error code
		  // @param location: Location where the exception occur
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		  
		  Me.ErrorNumber = errorNumber
		  Me.Location = location
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(message as String, ParamArray variables as Pair)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, location as String, ParamArray variables as Pair)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param location: Location where the exception occur
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		  
		  Me.Location = location
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPrevious() As BHException
		  // Return the exception raised before the current exception
		  return mPrevious
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Handle(ex as BHException, title as String = "Une exception n'a pas été gérée")
		  // Generic method to handle a BHException
		  //
		  // @param ex: The exception to handle
		  // @param title: Message box title
		  MsgBox(title + EndOfLine + EndOfLine + ex.Text())
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  // Convert the exception to String
		  return Text()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMessage(message as String, variables() as Pair)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  for each variable as Pair in variables
		    message = message.ReplaceAll(variable.Left.StringValue, variable.Right.StringValue)
		  next
		  
		  Me.Message = message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMessage(message as String, ParamArray variables as Pair)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetPrevious()
		  // Set the previous exception
		  mPrevious = mCurrent
		  mCurrent = Me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  // Return a text representation of the exception using the following format:
		  //      Classname [ code ]: Message ~ Location
		  dim text as String = Classname
		  
		  if ErrorNumber <> 0 then
		    text = text + " [" + Str(ErrorNumber) + "]"
		  end
		  
		  text = text + ": " + Message
		  
		  if Location <> "" then
		    text = text + " ~ " + Location
		  end
		  
		  return text
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Location As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mCurrent As BHException
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrevious As BHException
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
			Name="Location"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
