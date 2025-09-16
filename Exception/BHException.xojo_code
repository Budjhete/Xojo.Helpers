#tag Class
Protected Class BHException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Function Classname() As String
		  Return Introspection.GetType(Me).FullName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(message as String)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(message as String, variables as Dictionary)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub Constructor(message as String, errorNumber as Integer, variables as Dictionary)
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

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
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
		Sub Constructor(message as String, errorNumber as Integer, location as String, variables as Dictionary)
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

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
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

	#tag Method, Flags = &h0, CompatibilityFlags = false
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
		Sub Constructor(message as String, location as String, variables as Dictionary)
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

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
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
		  ErrorBox(title,ex.ToText())
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  // Convert the exception to Text
		  return ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub SetMessage(message as String)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  
		  Me.ErrorMessage = message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub SetMessage(message as String, variables as Dictionary)
		  
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  for each variable as DictionaryEntry in variables
		    message = message.ReplaceAll(variable.Key.StringValue, variable.Value.StringValue)
		  next
		  
		  Me.ErrorMessage = message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub SetMessage(message as String, variables() as Pair)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  for each variable as Pair in variables
		    message = message.ReplaceAll(variable.Left.StringValue, variable.Right.StringValue)
		  next
		  
		  Me.ErrorMessage = message
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
		Function ToText() As String
		  // Return a text representation of the exception using the following format:
		  //      Classname [ code ]: Message ~ Location
		  dim FullMessage as String = Classname
		  
		  if ErrorNumber <> 0 then
		    FullMessage = FullMessage + " [" + ErrorNumber.ToString + "]"
		  end
		  
		  FullMessage = FullMessage + ": " + ErrorMessage
		  
		  if Location <> "" then
		    FullMessage = FullMessage + " ~ " + Location
		  end
		  
		  return FullMessage
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

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
			Name="Location"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
