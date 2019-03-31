#tag Class
Protected Class ResourceManager
	#tag Method, Flags = &h0
		Function Folder() As FolderItem
		  #if TargetLinux
		    return App.ExecutableFile.Parent.Child("Resources")
		  #elseif TargetWin32
		    return App.ExecutableFile.Parent.Child("Resources")
		  #else
		    return App.ExecutableFile.Parent.Parent.Child("Resources")
		  #endif
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
		Function Item(path as Text) As Xojo.IO.FolderItem
		  dim fi as Xojo.IO.FolderItem = GetResourceFolder()
		  
		  dim chunks() as Text = path.Split("/")
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
		Function Libraries(name as Text) As Xojo.IO.FolderItem
		  return Item("Libraries/"+name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQL() As Xojo.IO.FolderItem
		  return Item("Sql")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQL(name as Text) As Xojo.IO.FolderItem
		  if name.EndsWith(".sql") then
		    return Item("Sql/"+name)
		  else
		    return Item("Sql/"+name+".sql")
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As ResourceManager
	#tag EndProperty


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
