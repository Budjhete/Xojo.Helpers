#tag Module
Protected Module NextCloudModule
	#tag Method, Flags = &h0
		Function URLDecode(Extends s As String) As String
		  // Decodes percent-encoded strings. Safe for full paths too.
		  // Nextcloud href can contain "+" sometimes; treat as space.
		  Var t As String = s.ReplaceAll("+", "%20")
		  Try
		    Return DecodeURLComponent(t)
		  Catch
		    // If DecodeURLComponent fails, return raw
		    Return s
		  End Try
		End Function
	#tag EndMethod


	#tag Structure, Name = NcFolderEntry, Flags = &h0
		Name as String * 120
		RemotePath as String * 400
	#tag EndStructure


	#tag Enum, Name = NcError, Type = Integer, Flags = &h0
		Ok
		  InvalidArgument
		  NetworkError
		  AuthError
		ParseError
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
