#tag Class
Protected Class ZipFileEntry
	#tag Property, Flags = &h0
		Comment As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CompressedSize As Uint32
	#tag EndProperty

	#tag Property, Flags = &h0
		Crc32 As Uint32
	#tag EndProperty

	#tag Property, Flags = &h0
		Filename As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FileOffset As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		FileSize As Uint32
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderOffset As Uint32
	#tag EndProperty

	#tag Property, Flags = &h0
		HeaderSize As Uint32
	#tag EndProperty

	#tag Property, Flags = &h0
		ModifyTime As Date
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompressedSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Crc32"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Filename"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint32"
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
End Class
#tag EndClass
