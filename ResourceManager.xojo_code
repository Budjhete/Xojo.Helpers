#tag Class
Protected Class ResourceManager
	#tag Method, Flags = &h0
		Sub Destructor()
		  mTaxes = nil
		  mTemplates = nil
		End Sub
	#tag EndMethod

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
		Function Relauncher() As FolderItem
		  #if TargetMacOS
		    return Item("relaunch-osx.bdjres")
		  #elseif TargetWin32
		    return Item("relaunch-windows.bdjres")
		  #else ' TargetLinux
		    return Item("relaunch-linux.bdjres")
		  #endif
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
		Function Taxes() As ZipResource
		  if mTaxes = nil then
		    dim zip as ZipArchive
		    
		    try
		      zip = ZipArchive.Open(Item("Taxes.bdjres"))
		      mTaxes = zip.Open()
		    finally
		      zip.Close()
		    end
		  end
		  
		  return mTaxes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Template(name as String) As FolderItem
		  dim fi, child as FolderItem
		  
		  fi = Templates()
		  
		  if fi.Child(name).Exists then
		    return fi.Child(name)
		  end
		  
		  for i as Integer = 1 to fi.Count
		    child = fi.Item(i)
		    
		    if child.Directory then
		      return child
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TemplateCheque(name as String) As FolderItem
		  dim fi, child as FolderItem
		  
		  fi = Templates().Child("Cheques")
		  
		  if fi.Child(name).Exists then
		    return fi.Child(name)
		  end
		  
		  for i as Integer = 1 to fi.Count
		    child = fi.Item(i)
		    
		    if child.Directory then
		      return child
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Templates() As ZipResource
		  if mTemplates = nil then
		    dim zip as ZipArchive
		    
		    try
		      zip = ZipArchive.Open(Item("Templates.bdjres"))
		      mTemplates = zip.Open()
		    finally
		      zip.Close()
		    end
		  end
		  
		  return mTemplates
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As ResourceManager
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTaxes As ZipResource
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTemplates As ZipResource
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
