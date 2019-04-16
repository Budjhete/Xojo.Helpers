#tag Module
Protected Module FolderItemExtra
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function BaseName(Extends fi as FolderItem) As Text
		  dim pos as Integer = fi.Name.InStrReverse(".")
		  
		  if pos = 0 then
		    return fi.Name.ToText
		  end
		  
		  return fi.Name.Left(pos-1).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseName(Extends fi as Xojo.IO.FolderItem) As Text
		  Using Xojo.IO
		  dim pos as Integer = fi.Name.InStrReverse(".")
		  
		  if pos = 0 then
		    return fi.Name
		  end
		  
		  return fi.Name.Left(pos-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function CountVisible(extends folder as FolderItem) As Integer
		  Dim count As Integer = folder.Count
		  dim realCount as integer = 0
		  For i As Integer = 1 To Count
		    Dim child As FolderItem = folder.TrueItem(i)
		    If child.Visible Then realCount = realCount + 1
		  Next
		  
		  Return realCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub CreateAsFolderIfNotExist(Extends fi as Xojo.IO.FolderItem)
		  Using Xojo.IO
		  if fi.Exists then return
		  fi.CreateAsFolder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extension(Extends fi as FolderItem) As String
		  dim pos as Integer = fi.Name.InStrReverse(".")
		  
		  if pos = 0 then
		    return ""
		  end
		  
		  return fi.Name.Mid(pos+1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extension(Extends fi as Xojo.IO.FolderItem) As Text
		  dim pos as Integer = fi.Name.InStrReverse(".")
		  
		  if pos = 0 then
		    return ""
		  end
		  
		  return fi.Name.Mid(pos+1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function OldFolderItem(Extends fi as Xojo.IO.FolderItem) As FolderItem
		  Return New FolderItem(fi.Path, FolderItem.PathTypeNative)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function RealType(extends folder as Xojo.IO.FolderItem) As FileType
		  If Folder.Name.EndsWith(DocumentsTypes.Pdf.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.Pdf
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Rtf.Extensions.ToText.Split(";"))Then
		    Return DocumentsTypes.RTF
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Zip.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.Zip
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.ApplicationMsword.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.ApplicationMsWord
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.ApplicationVndMsExcel.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.ApplicationVndMsExcel
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.TextHtml.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.TextHtml
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Png.Extensions.ToText.Split(";")) Then
		    Return DocumentsTypes.Png
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Jpeg.Extensions.Split(";").ToText) Then
		    Return DocumentsTypes.Jpeg
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RecursiveDelete(extends folder as FolderItem)
		  Dim fi As FolderItem
		  
		  For i As Integer = folder.count DownTo 1
		    fi = folder.Item(i)
		    
		    If fi.Directory Then
		      fi.RecursiveDelete()
		    Else
		      #If TargetLinux
		        fi.Delete
		      #Else
		        fi.MoveFileTo SpecialFolder.Trash
		      #Endif
		      
		      
		    End If
		  Next
		  #If TargetLinux
		    folder.Delete
		  #Else
		    folder.MoveFileTo SpecialFolder.Trash
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub RecursiveDelete(extends folder as Xojo.Io.FolderItem)
		  Dim fi As Xojo.Io.FolderItem
		  
		  For Each f As Xojo.Io.FolderItem In folder.Children
		    fi = f
		    
		    If fi.IsFolder Then
		      fi.RecursiveDelete()
		    Else
		      #If TargetLinux
		        fi.Delete
		      #Else
		        fi.MoveTo(New Xojo.IO.FolderItem(SpecialFolder.Trash.NativePath.ToText))
		      #Endif
		      
		      
		    End If
		  Next
		  #If TargetLinux
		    folder.Delete
		  #Else
		    folder.MoveTo(New Xojo.IO.FolderItem(SpecialFolder.Trash.NativePath.ToText))
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RecursivePermissions(extends folder as FolderItem, permissions as Integer)
		  folder.Permissions = permissions
		  
		  for i as Integer = 1 to folder.Count
		    folder.Item(i).RecursivePermissions(permissions)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RecursivePermissions(extends folder as Xojo.IO.FolderItem, permissions as Integer)
		  Dim d as FolderItem = folder.oldFolderItem
		  d.Permissions = permissions
		  
		  for each Item as Xojo.IO.FolderItem in folder.Children
		    Item.RecursivePermissions(permissions)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function RelativeTo(Extends fi as Xojo.IO.FolderItem, path as Text) As Xojo.IO.FolderItem
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function TrueItem(Extends fi as Xojo.IO.FolderItem, pIndex as Integer) As Xojo.IO.FolderItem
		  // Base 1
		  
		  Dim i as integer = 1
		  for Each ffi as Xojo.IO.FolderItem in fi.Children(false)
		    
		    if i = pIndex then
		      if ffi.Exists OR NOT ffi.IsFolder then
		        Return ffi
		      else
		        i = i + 1
		      end
		    else
		      i = i + 1
		    end
		  next
		  
		  return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UniqueFolderItem(extends parent as Xojo.IO.FolderItem, basename as Text, suffixe as Text = "") As Xojo.IO.FolderItem
		  return parent.Child(parent.UniqueFolderItemName(basename, suffixe))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UniqueFolderItemName(extends parent as FolderItem, basename as Text, suffixe as Text = "") As Text
		  dim i as Integer
		  dim f as string
		  try
		    i = 1
		    dim file as FolderItem = parent.Child(basename+suffixe)
		    f = file.NativePath
		    i = 2
		    Dim fileNumber As Integer = 1
		    i = 3
		    ' On crée un fichier unique
		    while file.Exists()
		      i = i+1
		      file = parent.Child(basename + "-"+Str(fileNumber)+suffixe)
		      fileNumber = fileNumber + 1
		      
		      if fileNumber = 100 then
		        i = i + 100
		        Raise new BHApplicationException(kImpossibleDeGenererUnFichierUnique)
		      end
		    wend
		    i = i + 1000
		    return file.Name.ToText
		    
		  Catch err as NilObjectException
		    dim s as string = "Crash à unique folder à l'étape : " + str(i) + EndOfLine + _
		    "dossier : " + parent.NativePath  + EndOfLine + _
		    "file : " + f  + EndOfLine + _
		    "basename : " + basename + EndOfLine + _
		    "suffix : " + suffixe
		    
		    Raise new BHApplicationException(s.totext)
		    System.DebugLog s
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UniqueFolderItemName(extends parent as Xojo.IO.FolderItem, basename as Text, suffixe as Text = "") As Text
		  dim i as Integer
		  dim f as Text
		  try
		    i = 1
		    dim file as Xojo.IO.FolderItem = parent.Child(basename+suffixe)
		    f = file.Path
		    i = 2
		    Dim fileNumber As Integer = 1
		    i = 3
		    ' On crée un fichier unique
		    while file.Exists()
		      i = i+1
		      file = parent.Child(basename + "-"+fileNumber.ToText+suffixe)
		      fileNumber = fileNumber + 1
		      
		      if fileNumber = 100 then
		        i = i + 100
		        Raise new BHApplicationException(kImpossibleDeGenererUnFichierUnique)
		      end
		    wend
		    i = i + 1000
		    return file.Name
		    
		  Catch err as NilObjectException
		    dim s as Text = "Crash à unique folder à l'étape : " + i.ToText + EndOfLine_ + _
		    "dossier : " + parent.Path  + EndOfLine_ + _
		    "file : " + f  + EndOfLine_ + _
		    "basename : " + basename + EndOfLine_ + _
		    "suffix : " + suffixe
		    
		    Raise new BHApplicationException(s)
		    System.DebugLog s
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XojoFolderItem(Extends fi as FolderItem) As Xojo.IO.FolderItem
		  Return New Xojo.IO.FolderItem(fi.NativePath.ToText)
		End Function
	#tag EndMethod


	#tag Constant, Name = kImpossibleDeGenererUnFichierUnique, Type = Text, Dynamic = True, Default = \"Impossible de g\xC3\xA9n\xC3\xA9rer un fichier unique.", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Impossible de g\xC3\xA9n\xC3\xA9rer un fichier unique."
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Cannot create a unique file."
	#tag EndConstant


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
End Module
#tag EndModule
