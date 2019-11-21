#tag Module
Protected Module Keys
	#tag Method, Flags = &h1
		Protected Function IsEntrer(char As Integer) As Boolean
		  return (char = EOT Or char = CR)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function IsEntrer(char As String) As Boolean
		  return IsEntrer(char.Asc)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsEntrer(char As Text) As Boolean
		  return IsEntrer(char.Asc)
		End Function
	#tag EndMethod


	#tag Constant, Name = CR, Type = Double, Dynamic = False, Default = \"13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELETE, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DOWN, Type = Double, Dynamic = False, Default = \"31", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ENTER, Type = Double, Dynamic = False, Default = \"13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EOT, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ESC, Type = Double, Dynamic = False, Default = \"27", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FWD_DELETE, Type = Double, Dynamic = False, Default = \"127", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GOTO_END, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOME, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LEFT, Type = Double, Dynamic = False, Default = \"28", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGE_DOWN, Type = Double, Dynamic = False, Default = \"12", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGE_UP, Type = Double, Dynamic = False, Default = \"11", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RIGHT, Type = Double, Dynamic = False, Default = \"29", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TAB, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UP, Type = Double, Dynamic = False, Default = \"30", Scope = Protected
	#tag EndConstant


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
