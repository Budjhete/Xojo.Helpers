#tag Module
Protected Module FolderItemExtra
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
		Function RealType(extends folder as FolderItem) As FileType
		  If Folder.Name.EndsWith(DocumentsTypes.Pdf.Extensions.Split(";")) Then
		    Return DocumentsTypes.Pdf
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Rtf.Extensions.Split(";"))Then
		    Return DocumentsTypes.RTF
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Zip.Extensions.Split(";")) Then
		    Return DocumentsTypes.Zip
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.ApplicationMsword.Extensions.Split(";")) Then
		    Return DocumentsTypes.ApplicationMsWord
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.ApplicationVndMsExcel.Extensions.Split(";")) Then
		    Return DocumentsTypes.ApplicationVndMsExcel
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.TextHtml.Extensions.Split(";")) Then
		    Return DocumentsTypes.TextHtml
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Png.Extensions.Split(";")) Then
		    Return DocumentsTypes.Png
		  End If
		  
		  If Folder.Name.EndsWith(DocumentsTypes.Jpeg.Extensions.Split(";")) Then
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RecursivePermissions(extends folder as FolderItem, permissions as Integer)
		  folder.Permissions = permissions
		  
		  for i as Integer = 1 to folder.Count
		    folder.Item(i).RecursivePermissions(permissions)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function RelativeTo(Extends fi as FolderItem, path as Text) As FolderItem
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UniqueFolderItem(extends parent as FolderItem, basename as Text, suffixe as Text = "") As FolderItem
		  return parent.Child(parent.UniqueFolderItemName(basename, suffixe))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UniqueFolderItemName(extends parent as FolderItem, basename as Text, suffixe as Text = "") As Text
		  dim i as Integer
		  dim f as Text
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
		    return file.Name
		    
		  Catch err as NilObjectException
		    dim s as Text = "Crash à unique folder à l'étape : " + i.ToText + EndOfLine + _
		    "dossier : " + parent.NativePath  + EndOfLine + _
		    "file : " + f  + EndOfLine + _
		    "basename : " + basename + EndOfLine + _
		    "suffix : " + suffixe
		    
		    Raise new BHApplicationException(s)
		    System.DebugLog s
		  End Try
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
