#tag Class
Protected Class ResourceManager
	#tag Method, Flags = &h0
		Function Folder() As FolderItem
		  #if TargetLinux
		    return App.ExecutableFile.Parent.Child("Resources")
		  #elseif TargetWindows
		    return App.ExecutableFile.Parent.Child(App.ApplicationNameMBS).Child(App.ApplicationNameMBS + " Resources")
		  #else
		    return App.ExecutableFile.Parent.Parent.Child("Resources")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Folder(FolderName as String) As FolderItem
		  return SpecialFolder.Resource(FolderName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Instance() As ResourceManager
		  if mInstance = nil then
		    mInstance = new ResourceManager
		  end
		  
		  return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(path as String) As FolderItem
		  dim fi as FolderItem = GetResourceFolder()
		  
		  dim chunks() as String = path.Split("/")
		  for i as Integer = 0 to UBound(chunks)
		    if not fi.Exists then
		      return nil
		    end
		    
		    fi = fi.Child(chunks(i))
		  next
		  
		  return fi
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Libraries(name as String) As FolderItem
		  return Item("Libraries/"+name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQL() As FolderItem
		  return Item("Sql")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQL(name as String) As FolderItem
		  if name.EndsWith(".sql") then
		    return Item("Sql/"+name)
		  else
		    return Item("Sql/"+name+".sql")
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TmpFolder() As FolderItem
		  if mtmpfolder=nil then
		    mtmpfolder = new FolderItem
		    dim name as String = RandomString(10)
		    SpecialFolder.Temporary.Child(name).CreateAsFolderIfNotExist
		    mtmpfolder = SpecialFolder.Temporary.Child(name)
		  end if
		  return mtmpfolder
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As ResourceManager
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared mtmpfolder As FolderItem
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
