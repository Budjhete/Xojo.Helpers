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
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompressedSize"
			Group="Behavior"
			Type="Uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Crc32"
			Group="Behavior"
			Type="Uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Filename"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileOffset"
			Group="Behavior"
			Type="UInt32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileSize"
			Group="Behavior"
			Type="Uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderOffset"
			Group="Behavior"
			Type="Uint32"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderSize"
			Group="Behavior"
			Type="Uint32"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
