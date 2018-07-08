#tag Module
Protected Module Helpers
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ActiveWindow() As Window
		  if WindowCount > 0 then
		    return Window(0)
		  end
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseName(Extends fi as FolderItem) As String
		  dim pos as Integer = fi.Name.InStrReverse(".")
		  
		  if pos = 0 then
		    return fi.Name
		  end
		  
		  return fi.Name.Left(pos-1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Between(value as Double, min as Double, max as Double) As Boolean
		  return value.Between(min, max)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function BuildPopupMenu(ParamArray items as String) As MenuItem
		  Dim m as new MenuItem
		  
		  for i as Integer = 0 to items.Ubound
		    m.Append(new MenuItem(items(i), i))
		  next
		  
		  return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Sub CloseAllWindows()
		  For i as Integer = WindowCount - 1 DownTo 0
		    Dim w as Window = Window(i)
		    If w <> nil then
		      w.Close()
		    End if
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function Confirm(message as String) As Boolean
		  return (MsgBox(message, 36) = 6)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToHex(Source As String) As String
		  Dim SrcMB As MemoryBlock
		  SrcMB=New MemoryBlock(Source.LenB)
		  SrcMB.StringValue(0,SrcMB.Size)=Source
		  
		  Dim ReturnValue As String
		  Dim OneBitHex As String
		  For i As Integer=0 To SrcMB.Size-1
		    OneBitHex=Hex(SrcMB.Byte(i))
		    If i<>0 Then
		      If OneBitHex.Len=1 Then OneBitHex="0" + OneBitHex
		    End If
		    ReturnValue=ReturnValue+OneBitHex
		  Next
		  
		  Return ReturnValue.Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFileorFolder(source as FolderItem, destination as FolderItem)
		  Dim i as Integer
		  Dim newFolder as FolderItem
		  
		  If source.directory then
		    
		    newFolder=destination.child(source.name)
		    newFolder.createAsFolder
		    
		    For i=1 to source.count
		      If source.item(i).directory then
		        CopyFileOrFolder source.item(i), newFolder
		      else
		        source.item(i).CopyFileTo newFolder
		      end if
		    next
		    
		  else
		    source.CopyFileTo destination
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentOS() As String
		  dim os as string
		  
		  
		  #if TargetMacOS
		    os = "Mac OS"
		    
		    //be more specific of OS Version
		    dim sys1, sys2, sys3 as Integer
		    call System.Gestalt("sys1", sys1)
		    call System.Gestalt("sys2", sys2)
		    call System.Gestalt("sys3", sys3)
		    
		    select case sys1
		    case 10
		      os = "Mac OS X"
		      select case sys2
		      case 0
		        os = "Mac OS X Chetaah"
		      case 1
		        os = "Mac OS X Puma"
		      case 2
		        os = "Mac OS X Jaguar"
		      case 3
		        os = "Mac OS X Panther"
		      case 4
		        os = "Mac OS X Tiger"
		      case 5
		        os = "Mac OS X Leopard"
		      case 6
		        os = "Mac OS X Snow Leopard"
		      case 7
		        os = "Mac OS X Lion"
		      case 8
		        os = "Mac OS X Mountain Lion"
		      case 9
		        os = "Mac OS X Mavericks"
		      case 10
		        os = "Mac OS X Yosemite"
		      case 10
		        os = "Mac OS X El Capitan"
		      end select
		    end select
		    
		    os = os + " "+str(sys1)+"."+str(sys2)+"."+str(sys3)
		    
		  #elseif TargetWin32
		    os = "Windows"
		    
		    //try to be more specific of windows version
		    Soft Declare Sub GetVersionExA lib "Kernel32" ( info as Ptr )
		    Soft Declare Sub GetVersionExW lib "Kernel32" ( info as Ptr )
		    
		    dim info as MemoryBlock
		    
		    if System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) then
		      info =  new MemoryBlock( 20 + (2 * 128) )
		      info.Long( 0 ) = info.Size
		      
		      GetVersionExW( info )
		    else
		      info =  new MemoryBlock( 148 )
		      info.Long( 0 ) = info.Size
		      
		      GetVersionExA( info )
		    end if
		    
		    dim str as String
		    
		    if info.Long( 4 ) = 4 then
		      if info.Long( 8 ) = 0 then
		        os = "Windows 95/NT 4.0"
		      elseif info.Long( 8 ) = 10 then
		        os = "Windows 98"
		      elseif info.Long( 8 ) = 90 then
		        os = "Windows Me"
		      end if
		    elseif info.Long( 4 ) = 3 then
		      os = "Windows NT 3.51"
		    elseif info.Long( 4 ) = 5 then
		      if info.Long( 8 ) = 0 then
		        os = "Windows 2000"
		      elseif info.Long( 8 ) = 1 then
		        os = "Windows XP"
		      elseif info.Long( 8 ) = 2 then
		        os = "Windows Server 2003"
		      end if
		    elseif info.long(4) = 6 then
		      if info.long(8) = 0 then
		        os = "Windows Vista"
		      elseif info.long(8) = 1 then
		        os = "Windows 7"
		      end if
		    end if
		    
		    str = " Build " + Str( info.Long( 12 ) )
		    
		    if System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) then
		      str = str + " " + Trim( info.WString( 20 ) )
		    else
		      str = str + " " + Trim( info.CString( 20 ) )
		    end if
		    
		    os = os + str
		    
		    
		  #elseif TargetLinux
		    Dim shell as new Shell
		    shell.execute("cat /etc/issue")
		    
		    If shell.errorCode = 0 then
		      return shell.result
		    else
		      return "Linux"
		    end if
		    
		  #endif
		  
		  return os
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateToUnix(d As Date) As Uint64
		  Return (d.TotalSeconds - 2082844800)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(Extends ref as Dictionary, obj as Dictionary) As Boolean
		  for each key as Variant in ref.Keys
		    if not obj.HasKey(key) or ref.Value(key) <> obj.Value(key) then
		      return false
		    end
		  next
		  
		  
		  for each key as Variant in obj.Keys
		    if not ref.HasKey(key) or obj.Value(key) <> ref.Value(key) then
		      return false
		    end
		  next
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ErrorBox(title as String, message as String)
		  MsgBox(title+EndOfLine+EndOfLine+message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstEntrer(char As String) As Boolean
		  return (char = chr(3) Or char = chr(13))
		End Function
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
		Function FillLeft(str as String, padding As String, length As Integer) As String
		  trigger_error("La fonction «FillLeft» est désuette.", ErrorType.Deprecated)
		  return str.FillLeft(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillRight(str as String, padding As String, length As Integer) As String
		  trigger_error("La fonction «FillRight» est désuette.", ErrorType.Deprecated)
		  return str.FillRight(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFile(file as String, paths() as FolderItem) As FolderItem
		  dim path, fi as FolderItem
		  
		  for each path in paths
		    fi = path.RelativeTo(file)
		    
		    if fi <> nil and fi.Exists then
		      return fi
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ForceQuit()
		  Quit()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResourceFolder() As FolderItem
		  #if TargetLinux
		    return App.ExecutableFile.Parent.Child("Resources")
		  #elseif TargetWin32
		    return App.ExecutableFile.Parent.Child(replace(App.ExecutableFile.Name, ".exe", "") + " Resources")
		  #else
		    return App.ExecutableFile.Parent.Parent.Child("Resources")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResourceItem(path as String) As FolderItem
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
		Function Hyphenate(str As String) As String
		  'str = RemoveAccents(str)
		  '
		  'Dim rx As New RegEx
		  'rx.Options.ReplaceAllMatches = True
		  '
		  'rx.SearchPattern = "[\W\s]+"
		  'rx.ReplacementPattern = "-"
		  'str = rx.Replace(str)
		  '
		  'rx.SearchPattern = "^[-]+"
		  'rx.ReplacementPattern = ""
		  'str = rx.Replace(str)
		  '
		  'rx.SearchPattern = "[-]+$"
		  'str = rx.Replace(str)
		  'return rx.Replace(str)
		  
		  trigger_error("La fonction «Hyphenate» est désuette.", ErrorType.Deprecated)
		  return str.Hyphenate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as Color, falseValue as Color) As Color
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as Double, falseValue as Double) As Double
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as Integer, falseValue as Integer) As Integer
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as ORM, falseValue as ORM) As variant
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as String, falseValue as String) As String
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportSQL(db as SQLiteDatabase, sql as FolderItem)
		  dim tis As TextInputStream
		  tis = TextInputStream.Open(sql)
		  
		  ImportSQL(db, tis.ReadAll)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportSQL(db as SQliteDatabase, sql as String)
		  dim tis As TextInputStream
		  tis = TextInputStream.Open(ResourceManager.Instance.SQL("sqlite"))
		  
		  
		  Dim queries() As String = sql.Split(";")
		  For Each query As String In queries
		    db.SQLExecute(query)
		    If DB.Error Then
		      System.DebugLog "DB Error: " + db.ErrorCode.StringValue + "  " + db.ErrorMessage + EndOfLine  + EndOfLine + "Dans cette requête : " + query
		    Else
		      db.Commit()
		    End If
		    
		  Next
		  
		  System.DebugLog "DEBUG : Tables created as sqlite"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Int(str As String) As Integer
		  Return str.toInt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInteger(str as String) As Boolean
		  return str.Test("^\d+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOnTop(w As Window) As Boolean
		  return w = Window(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOpen(name As String) As boolean
		  For i as Integer = 0 to WindowCount - 1
		    Dim w as Window = Window(i)
		    If w <> nil then
		      dim ti As Introspection.TypeInfo = Introspection.GetType(w)
		      if ti.Name = name then
		        return true
		      end
		    End if
		  Next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function is_array(value As Variant) As Boolean
		  return value.IsArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LogToDesktop(message As String)
		  #if DebugBuild then
		    dim fp as TextOutputStream
		    
		    if fp = nil then
		      dim today as new Date
		      fp = TextOutputStream.Append(SpecialFolder.Desktop.Child("budjhete-" + today.SQLDate+ ".txt"))
		    end
		    
		    fp.WriteLine(message)
		    
		    fp.Close()
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MD5(f as FolderItem) As String
		  // test parameters
		  If f=Nil Then Return ""
		  If Not f.Exists Then Return ""
		  If f.Directory Then Return ""
		  
		  // read file f to a string
		  // Note: RB string supports any binary data
		  Dim InputData As TextInputStream
		  InputData=f.OpenAsTextFile
		  Dim FileData As String
		  If InputData=Nil Then
		    // file f is not readable
		    Return ""
		  Else
		    FileData=InputData.ReadAll
		    InputData.Close
		  End If
		  
		  // get the MD5 digest
		  Dim MD5Dgt As String
		  MD5Dgt=MD5(FileData)
		  
		  // convert MD5 digest to a Hex string
		  Dim HashStr As String
		  HashStr = ConvertToHex(MD5Dgt)
		  
		  Return HashStr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mm(Extends Byref pValue As Integer)
		  pValue = pValue - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub moins(Extends Byref pValueA As Integer, Assigns pValueB As Integer)
		  pValueA = pValueA - pValueB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent(Extends fi as FolderItem, endsWith as String) As FolderItem
		  dim parent as FolderItem = fi.Parent
		  if parent = nil or parent.Name.EndsWith(endsWith) then
		    return parent
		  end
		  
		  return parent.Parent(endsWith)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub plus(Extends Byref pValueA As Integer, Assigns pValueB As Integer)
		  pValueA = pValueA + pValueB
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub pp(Extends Byref pValueA As Integer)
		  pValueA = pValueA + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reveal(Extends f as FolderItem)
		  Dim shell1 as new Shell
		  Dim cmd as string
		  if f <>  nil then
		    if f.Exists then
		      #IF TargetWin32 then
		        cmd  = "explorer.exe /select,"+ chr(34)+ f.NativePath+ chr(34)
		        shell1.execute(cmd)
		      #elseIf TargetMachO or TargetMacOS then
		        cmd  = "Open -R "+  f.ShellPath
		        shell1.execute(cmd)
		      #else
		        ' Linux?
		        
		      #ENDIF
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenPosX(ctrl As RectControl) As Integer
		  return ctrl.Left + ctrl.Window.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenPosY(ctrl As RectControl) As Integer
		  return ctrl.Top + ctrl.Window.Top
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringMD5(str As String) As String
		  return ConvertToHex(MD5(str)).Lowercase.Padding(32, "0", PaddingAlignment.Left)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringRepeat(pattern As String, multiplier As Integer) As String
		  trigger_error("La fonction «StringRepeat» est désuette.", ErrorType.Deprecated)
		  return pattern.Repeat(multiplier)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strtobasictype(value As String) As Variant
		  dim variant As Variant = value
		  return variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TODO(tache as String)
		  #if DebugBuild
		    System.Log(System.LogLevelInformation, "TODO: " + tache)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trigger_error(erreur AS String, Optional type As ErrorType = ErrorType.Error)
		  Select Case type
		  Case ErrorType.Error
		    erreur = "Error: " +erreur
		  Case ErrorType.Warning
		    erreur = "Warning: " +erreur
		  Case ErrorType.Notice
		    erreur = "Notice: " +erreur
		  Case ErrorType.Deprecated
		    erreur = "Depecrated: " +erreur
		  End
		  
		  MsgBox erreur
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixToDate(i As Int64) As Date
		  Dim cd As New Date
		  
		  i = i + 2082844800
		  cd.TotalSeconds = i
		  
		  Return cd
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Utf8StringValue(Extends field as DatabaseField, default as String = "") As String
		  if field.Value.IsNull() then
		    return default
		  end
		  
		  return field.StringValue.DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArray(ParamArray pVariants As Variant) As Variant()
		  Return pVariants
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function VisibleWindowCount() As Integer
		  dim count As Integer
		  
		  for i As Integer = 0 to (WindowCount - 1)
		    if Window(i).Visible then
		      count = count  + 1
		    end
		  next
		  
		  return count
		End Function
	#tag EndMethod


	#tag Enum, Name = Alignement, Type = Integer, Flags = &h0
		Left
		  Center
		Right
	#tag EndEnum

	#tag Enum, Name = ErrorType, Type = Integer, Flags = &h0
		Error
		  Warning
		  Notice
		  Deprecated
		SqlError
	#tag EndEnum

	#tag Enum, Name = FACTURE_TYPE, Type = Integer, Flags = &h0
		FACTURE
		  COMMANDE
		  ESTIME
		SOUMISSION
	#tag EndEnum

	#tag Enum, Name = TypeFacture, Flags = &h0
		Facture
		  Estime
		  Commande
		Soumission
	#tag EndEnum


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
