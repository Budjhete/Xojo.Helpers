#tag Class
Protected Class AbstractException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String)
		  Me.LevelCode = level
		  Me.Message = message
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer)
		  Me.LevelCode = level
		  Me.Message = message
		  Me.Code = code
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, line as Integer)
		  Me.LevelCode = level
		  Me.Message = message
		  Me.Code = code
		  Me.Line = line
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, location as String)
		  Me.LevelCode = level
		  Me.Message = message
		  Me.Code = code
		  Me.Location = location
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(level as Integer, message as String, code as Integer, location as String, line as Integer)
		  Me.LevelCode = level
		  Me.Message = message
		  Me.Code = code
		  Me.Location = location
		  Me.Line = line
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String)
		  Me.Message = message
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer)
		  Me.Message = message
		  Me.Code = code
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, line as Integer)
		  Me.Message = message
		  Me.Code = code
		  Me.Line = line
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String)
		  Me.Message = message
		  Me.Code = code
		  Me.Location = location
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(message as String, code as Integer, location as String, line as Integer)
		  Me.Message = message
		  Me.Code = code
		  Me.Location = location
		  Me.Line = line
		  
		  mPrevious = Me
		  System.Log(System.LogLevelERROR, Me.Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub HandleBasic(e as AbstractException)
		  dim text as String
		  
		  if e.Message <> "" then
		    text = e.Message
		  else
		    text = e.Type()
		  end
		  
		  if e.Code > 0 then
		    text = text + " ["+Str(e.Code)+"]"
		  end
		  
		  MsgBox text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Shared Sub HandleCrash(e as AbstractException)
		  dim frm as new FenetreCrashReporter(e)
		  frm.Show()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub HandleDetailed(e as AbstractException)
		  MsgBox e.Text()
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

	#tag Method, Flags = &h0
		Function Text() As String
		  // Affiche tout le détail de l'exception disponible au format texte
		  
		  dim text as String = Type()
		  
		  if Code > 0 and LevelCode <> 0 then
		    text = text + " [" + Level + " " + Str(Code)+"]"
		  elseif Code > 0 then
		    text = text + " [" + Str(Code) + "]"
		  elseif LevelCode > 0 then
		    text = text + " [" + Level + "]"
		  end
		  
		  
		  if Message <> "" then
		    text = text + ": " + Message
		  end
		  
		  text = text + " ~ "
		  
		  if Location <> "" then
		    text = text + Location
		  else
		    dim call_stack() as String = Me.Stack()
		    
		    if call_stack.Ubound >= 0 then
		      text = text + call_stack(0)
		    else
		      text = text + "unknown-location"
		    end
		  end
		  
		  if Line >= 0 then
		    text = text + "," + Str(Line)
		  end
		  
		  return text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As String
		  // Retourne le type de la classe principale (son nom) de l'exception
		  return Introspection.GetType(Me).Name
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
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="LevelCode"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Line"
			Group="Behavior"
			InitialValue="-1"
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
