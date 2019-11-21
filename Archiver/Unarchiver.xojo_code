#tag Class
Protected Class Unarchiver
	#tag Method, Flags = &h0
		Sub Constructor(archive as FolderItem, destination as FolderItem)
		  archive_ = archive
		  destination_ = destination
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Run(thread as Thread)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  if thread_ <> nil then
		    return
		  end
		  
		  thread_ = new Thread
		  AddHandler thread_.Run, AddressOf Run
		  thread_.Run
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected archive_ As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected destination_ As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private thread_ As Thread = nil
	#tag EndProperty


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
