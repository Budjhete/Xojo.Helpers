#tag Class
Protected Class ZipResource
Inherits FolderItem
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // Prevent the utilisation of this constructor
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(fi as FolderItem)
		  Super.Constructor(fi)
		  
		  System.Log(System.LogLevelInformation, "Création de la resource " + Me.ShellPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Path As String, pathMode As Integer = 0)
		  Super.Constructor(Path, pathMode)
		  
		  System.Log(System.LogLevelInformation, "New resource temporary created at " + Me.ShellPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if mAutoRelease then
		    Release()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsReleased() As Boolean
		  return not Me.Exists()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(fi as FolderItem) As ZipResource
		  dim resource  as new ZipResource(fi)
		  
		  resource.mAutoRelease = true
		  
		  return resource
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(archive as ZipArchive) As ZipResource
		  dim name as String = RandomString(10)
		  dim destination as FolderItem = SpecialFolder.Temporary.Child(name)
		  
		  archive.ExtractAll(destination)
		  
		  return Open(destination)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(entry as ZipEntry) As ZipResource
		  dim name as String = RandomString(10) + "-" + entry.Name
		  dim destination as FolderItem = SpecialFolder.Temporary
		  dim fi as FolderItem
		  
		  entry.ExtractTo(destination, name)
		  
		  fi = destination.Child(name)
		  
		  if fi.Exists then
		    return Open(fi)
		  end
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  // La resource a déjà été relachée!
		  if IsReleased() then
		    return
		  end
		  
		  System.Log(System.LogLevelInformation, "Temporary resource released at " + Me.ShellPath)
		  
		  Me.RecursiveDelete()
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAutoRelease
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAutoRelease = value
			End Set
		#tag EndSetter
		AutoRelease As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAutoRelease As Boolean = false
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AbsolutePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alias"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoRelease"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Directory"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Exists"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtensionVisible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Group"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReadable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsWriteable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
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
			Name="Length"
			Group="Behavior"
			Type="Uint64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Locked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacCreator"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacDirID"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacVRefNum"
			Group="Behavior"
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
			Name="NativePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Owner"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResourceForkLength"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShellPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URLPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
