#tag Class
Protected Class AbstractException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String)
		  Me.LevelCode = level
		  Me.ErrorMessage = message
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer)
		  Me.LevelCode = level
		  Me.ErrorMessage = message
		  Me.Code = code
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, line as Integer)
		  Me.LevelCode = level
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Line = line
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, location as String)
		  Me.LevelCode = level
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Location = location
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, location as String, line as Integer)
		  Me.LevelCode = level
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Location = location
		  Me.Line = line
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String)
		  Me.ErrorMessage = message
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer)
		  Me.ErrorMessage = message
		  Me.Code = code
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, line as Integer)
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Line = line
		  
		  mPrevious = Me
		  System.DebugLog( Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String)
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Location = location
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String, line as Integer)
		  Me.ErrorMessage = message
		  Me.Code = code
		  Me.Location = location
		  Me.Line = line
		  
		  mPrevious = Me
		  System.DebugLog(Me.ErrorMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub HandleBasic(e as AbstractException)
		  dim FullMessage as String
		  
		  if e.ErrorMessage <> "" then
		    FullMessage = e.ErrorMessage
		  else
		    FullMessage = e.Type()
		  end
		  
		  if e.Code > 0 then
		    FullMessage = FullMessage + " ["+e.Code.ToText+"]"
		  end
		  
		  ErrorBox FullMessage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Shared Sub HandleCrash(e as AbstractException)
		  dim frm as new FenetreCrashReporter(e)
		  frm.Show()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Shared Sub HandleDetailed(e as AbstractException)
		  ErrorBox(e.toText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function HumanReadableLevel(level as Integer) As String
		  select case level
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
		  
		  return "Unknown"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Level() As String
		  // Retourne le level de l'exception sous sont format lisible (texte)
		  //
		  // @return Le level de l'exception au format texte.
		  
		  return HumanReadableLevel(LevelCode)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Previous() As AbstractException
		  return mPrevious
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ToText() As String
		  // Affiche tout le détail de l'exception disponible au format texte
		  
		  dim FullMessage as String = Type()
		  
		  if Code > 0 and LevelCode <> 0 then
		    FullMessage = FullMessage + " [" + Level + " " + Code.ToText+"]"
		  elseif Code > 0 then
		    FullMessage = FullMessage + " [" + Code.ToText + "]"
		  elseif LevelCode > 0 then
		    FullMessage = FullMessage + " [" + Level + "]"
		  end
		  
		  
		  if FullMessage <> "" then
		    FullMessage = FullMessage + ": " + ErrorMessage
		  end
		  
		  FullMessage = FullMessage + " ~ "
		  
		  if Location <> "" then
		    FullMessage = FullMessage + Location
		  else
		    dim call_stack() as String
		    
		    #if TargetIOS then
		      for Each st as StackFrame in Me.CallStack
		        call_stack.Append(st.Name)
		      next
		    #else
		      call_stack() = Me.Stack()
		      
		    #endif
		    if call_stack.Ubound >= 0 then
		      FullMessage = FullMessage + call_stack(0)
		    else
		      FullMessage = FullMessage + "unknown-location"
		    end
		  end
		  
		  if Line >= 0 then
		    FullMessage = FullMessage + "," + Line.ToText
		  end
		  
		  return FullMessage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As String
		  // Retourne le type de la classe principale (son nom) de l'exception
		  return Xojo.Introspection.GetType(Me).Name
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ErrorNumber
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ErrorNumber = value
			End Set
		#tag EndSetter
		Code As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LevelCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Line As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Location As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mPrevious As AbstractException = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Code"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="LevelCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Line"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
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
