#tag Class
Protected Class BHException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Function Classname() As Text
		  // Return the name of the class of the current exception
		  return Xojo.Introspection.GetType(Me).Fullname
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(message as Text)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Constructor(message as Text, errorNumber as Integer, ParamArray variables as Pair)
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
		Sub Constructor(message as Text, errorNumber as Integer, location as Text, ParamArray variables as Pair)
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

	#tag Method, Flags = &h1000
		Sub Constructor(message as Text, errorNumber as Integer, location as Text, variables as Xojo.Core.Dictionary)
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

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub Constructor(message as Text, errorNumber as Integer, variables as Xojo.Core.Dictionary)
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

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Sub Constructor(message as Text, ParamArray variables as Pair)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Constructor(message as Text, location as Text, ParamArray variables as Pair)
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

	#tag Method, Flags = &h1000
		Sub Constructor(message as Text, location as Text, variables as Xojo.Core.Dictionary)
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
		Sub Constructor(message as Text, variables as Xojo.Core.Dictionary)
		  // Generic constructor for an exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  SetMessage(message, variables)
		  SetPrevious()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPrevious() As BHException
		  // Return the exception raised before the current exception
		  return mPrevious
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Handle(ex as BHException, title as Text = "Une exception n'a pas été gérée")
		  // Generic method to handle a BHException
		  //
		  // @param ex: The exception to handle
		  // @param title: Message box title
		  ErrorBox(title,ex.toText())
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Text
		  // Convert the exception to Text
		  return ToText()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub SetMessage(message as Text)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  
		  Me.ErrorMessage = message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub SetMessage(message as Text, variables() as Pair)
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  for each variable as Pair in variables
		    message = message.ReplaceAll(variable.Left.TextValue, variable.Right.TextValue)
		  next
		  
		  Me.ErrorMessage = message
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub SetMessage(message as Text, variables as Xojo.Core.Dictionary)
		  Using Xojo.Core
		  // Set the message of the exception
		  //
		  // @param message: Message of the exception
		  // @param variables: Variables that will be replaced in message
		  for each variable as DictionaryEntry in variables
		    message = message.ReplaceAll(variable.Key.AutoTextValue, variable.Value.AutoTextValue)
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
		Function ToText() As Text
		  // Return a text representation of the exception using the following format:
		  //      Classname [ code ]: Message ~ Location
		  dim FullMessage as Text = Classname
		  
		  if ErrorNumber <> 0 then
		    FullMessage = FullMessage + " [" + ErrorNumber.ToText + "]"
		  end
		  
		  FullMessage = FullMessage + ": " + ErrorMessage
		  
		  if Location <> "" then
		    FullMessage = FullMessage + " ~ " + Location
		  end
		  
		  return FullMessage
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorMessage As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Location As Text
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
			Type="Text"
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
		#tag ViewProperty
			Name="ErrorMessage"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
