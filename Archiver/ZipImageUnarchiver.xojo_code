#tag Class
Protected Class ZipImageUnarchiver
Inherits Unarchiver
	#tag Method, Flags = &h0
		Sub Run(thread as Thread)
		  dim zip as ZipArchive = ZipArchive.Open(archive_, false)
		  zip.ExtractAll(destination_)
		  zip.Close()
		  
		  archive_.Delete()
		  
		  RaiseEvent Finish
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Fail()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Finish()
	#tag EndHook


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
End Class
#tag EndClass
