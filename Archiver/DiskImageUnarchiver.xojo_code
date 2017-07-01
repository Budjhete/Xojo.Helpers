#tag Class
Protected Class DiskImageUnarchiver
Inherits Unarchiver
	#tag Method, Flags = &h1
		Protected Sub Run(thread as Thread)
		  dim s as new Shell
		  dim archivePath as String = archive_.ShellPath
		  dim mountPoint as String = "/Volumes/"+RandomString(10)
		  
		  ' On mount l'archive
		  dim args as String = "attach $1 -mountpoint $2 -noverify -nobrowse -noautoopen"
		  args = args.AssignVars(archivePath, mountPoint)
		  s.Execute("/usr/bin/hdiutil", args)
		  
		  
		  ' On copie le contenu
		  dim volume as FolderItem = GetFolderItem(mountPoint, FolderItem.PathTypeShell)
		  
		  For i as Integer = 1 to volume.Count
		    dim item as FolderItem = Volume.Item(i)
		    if item.IsReadable and item.Name <> "Applications" then
		      item.CopyFileTo(destination_)
		    end
		  Next
		  
		  ' On démonte l'archive
		  args = "detach $1 -force"
		  args = args.AssignVars(mountPoint)
		  s.Execute("/usr/bin/hdiutil", args)
		  
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
