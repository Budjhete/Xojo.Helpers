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
		Function ConvertToHex(Source As Text) As Text
		  Xojo.Core
		  Dim SrcMB As Xojo.Core.MemoryBlock
		  SrcMB = Xojo.Core.TextEncoding.UTF8.ConvertTextToData(Source)
		  
		  
		  
		  Dim ReturnValue As Text
		  Dim OneBitHex As Text
		  For i As Integer=0 To SrcMB.Size-1
		    
		    Dim b As UInt8 = SrcMB.UInt8Value(i)
		    OneBitHex=b.ToHex(2)
		    
		    If i<>0 Then
		      If OneBitHex.Length=1 Then OneBitHex="0" + OneBitHex
		    End If
		    
		    ReturnValue=ReturnValue+OneBitHex
		  Next
		  
		  Return ReturnValue.Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToHex(Source As Xojo.Core.MemoryBlock) As Text
		  Xojo.Core
		  
		  Dim ReturnValue As Text
		  Dim OneBitHex As Text
		  For i As Integer=0 To Source.Size-1
		    
		    Dim b As UInt8 = Source.UInt8Value(i)
		    OneBitHex=b.ToHex(2)
		    
		    If i<>0 Then
		      If OneBitHex.Length=1 Then OneBitHex="0" + OneBitHex
		    End If
		    
		    ReturnValue=ReturnValue+OneBitHex
		  Next
		  
		  Return ReturnValue.Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFileorFolder(source as Xojo.IO.FolderItem, destination as Xojo.IO.FolderItem)
		  Using Xojo.IO
		  'Dim i as Integer
		  Dim newFolder as FolderItem
		  
		  If source.IsFolder then
		    
		    newFolder=destination.child(source.name)
		    newFolder.createAsFolder
		    
		    For Each f As FolderItem In source.Children
		      If f.IsFolder then
		        CopyFileOrFolder f, newFolder
		      else
		        f.CopyTo newFolder
		      end if
		    Next
		    
		  else
		    source.CopyTo destination
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentOS() As Text
		  dim os as Text
		  
		  
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
		      case 11
		        os = "Mac OS X El Capitan"
		      case 12
		        os = "Mac OS X Sierra"
		      case 13
		        os = "Mac OS X High Sierra"
		      case 11
		        os = "Mac OS X Mojave"
		      end select
		    end select
		    
		    os = os + " "+sys1.ToText+"."+sys2.ToText+"."+sys3.ToText
		    
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
		    
		    dim str as Text
		    
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
		    
		    str = " Build " + info.Long( 12 ).ToText
		    
		    if System.IsFunctionAvailable( "GetVersionExW", "Kernel32" ) then
		      str = str + " " + Trim( info.WString( 20 ) ).ToText
		    else
		      str = str + " " + Trim( info.CString( 20 ) ).ToText
		    end if
		    
		    os = os + str
		    
		    
		  #elseif TargetLinux
		    Dim shell as new Shell
		    shell.execute("cat /etc/issue")
		    
		    If shell.errorCode = 0 then
		      return shell.result.ToText
		    else
		      return "Linux"
		    end if
		    
		  #endif
		  
		  return os
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateToUnix(d As Xojo.Core.Date) As Uint64
		  Using Xojo.Core
		  Return d.SecondsFrom1970
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(Extends ref as Xojo.Core.Dictionary, obj as Xojo.Core.Dictionary) As Boolean
		  Using Xojo.Core
		  for each entry as DictionaryEntry in ref
		    if not obj.HasKey(entry.Key) or entry.Value <> obj.Value(entry.key) then
		      return false
		    end
		  next
		  
		  
		  for each entry as DictionaryEntry in obj
		    if not ref.HasKey(entry.key) or entry <> ref.Value(entry.key) then
		      return false
		    end
		  next
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ErrorBox(title as Text = "", message as Text)
		  #if TargetIOS then
		    Dim MessageBox As iOSMessageBox
		    MessageBox.Title = title
		    MessageBox.Message = message
		    
		    MessageBox.Show
		    
		  #else
		    MsgBox(title+EndOfLine+EndOfLine+message)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstEntrer(char As Text) As Boolean
		  return (char = Text.FromUnicodeCodepoint(3) Or char = Text.FromUnicodeCodepoint(13))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillLeft(str As Text, padding As Text, length As Integer) As Text
		  trigger_error("La fonction «FillLeft» est désuette.", ErrorType.Deprecated)
		  return str.FillLeft(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillRight(str As Text, padding As Text, length As Integer) As Text
		  trigger_error("La fonction «FillRight» est désuette.", ErrorType.Deprecated)
		  return str.FillRight(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function FindFile(file as Text, paths() as Xojo.IO.FolderItem) As Xojo.IO.FolderItem
		  dim path, fi as Xojo.IO.FolderItem
		  
		  for each path in paths
		    if path <> nil and path.Exists then
		      fi = path.RelativeTo(file)
		      
		      if fi <> nil and fi.Exists then
		        return fi
		      end
		    end if
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub ForceQuit()
		  Quit()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function GetResourceFolder() As Xojo.io.FolderItem
		  #if TargetLinux
		    return new Xojo.IO.FolderItem(App.ExecutableFile.Parent.Child("Resources").NativePath.ToText)
		  #elseif TargetWin32
		    return new Xojo.IO.FolderItem(App.ExecutableFile.Parent.Child(replace(App.ExecutableFile.Name, ".exe", "") + " Resources").NativePath.ToText)
		  #elseif TargetMacOS
		    return new Xojo.IO.FolderItem(App.ExecutableFile.Parent.Parent.Child("Resources").NativePath.ToText)
		  #Elseif TargetIOS
		    Return new Xojo.IO.FolderItem(SpecialFolder.GetResource("Resources").Path)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResourceItem(path as Text) As Xojo.IO.FolderItem
		  Using Xojo.IO
		  dim fi as FolderItem = GetResourceFolder()
		  
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
		Function Hyphenate(str As Text) As Text
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
		Function IIF(condition as Boolean, trueValue as Currency, falseValue as Currency) As Currency
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
		Function IIF(condition as Boolean, trueValue as ORM, falseValue as ORM) As Auto
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IIF(condition as Boolean, trueValue as Text, falseValue as Text) As Text
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub ImportSQL(db as SQliteDatabase, sql as Text)
		  Using Xojo.Core
		  Using Xojo.IO
		  
		  dim tis As Xojo.IO.TextInputStream
		  tis = Xojo.IO.TextInputStream.Open(ResourceManager.Instance.SQL("sqlite"), Xojo.Core.TextEncoding.UTF8)
		  
		  
		  Dim queries() As Text = sql.Split(";")
		  For Each query As Text In queries
		    db.SQLExecute(query)
		    If DB.Error Then
		      System.DebugLog "DB Error: " + db.ErrorCode.StringValue + "  " + db.ErrorMessage.ToText + EndOfLine_  + EndOfLine_ + "Dans cette requête : " + query
		    Else
		      db.Commit()
		    End If
		    
		  Next
		  
		  System.DebugLog "DEBUG : Tables created as sqlite"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub ImportSQL(db as SQLiteDatabase, sql as Xojo.IO.FolderItem)
		  Using Xojo.Core
		  
		  dim tis As Xojo.IO.TextInputStream
		  tis = Xojo.IO.TextInputStream.Open(sql, Xojo.Core.TextEncoding.UTF8)
		  
		  ImportSQL(db, tis.ReadAll)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isArray(value As Auto) As Boolean
		  Using Xojo.Introspection
		  if value=nil then Return false
		  Return Xojo.Introspection.GetType(value).isArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInteger(str as Text) As Boolean
		  return str.Test("^\d+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOnTop(w As Window) As Boolean
		  return w = Window(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOpen(name As Text) As boolean
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub LogToDesktop(message As Text)
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MD5(f as Xojo.IO.FolderItem) As Text
		  Using Xojo.IO
		  
		  // test parameters
		  If f=Nil Then Return ""
		  If Not f.Exists Then Return ""
		  If f.IsFolder Then Return ""
		  
		  // read file f to a string
		  // Note: RB string supports any binary data
		  Dim b As BinaryStream
		  b = BinaryStream.Open(f, Xojo.IO.BinaryStream.LockModes.Read)
		  
		  
		  // get the MD5 digest
		  Dim MD5Dgt As Text
		  If b.Length<1 Then
		    // file f is not readable
		    Return ""
		  Else
		    Dim mb As New Xojo.Core.MemoryBlock(b.Read(b.Length))
		    b.Close
		    MD5Dgt= Xojo.Core.TextEncoding.UTF8.ConvertDataToText(Xojo.Crypto.MD5(mb))
		    
		  End If
		  
		  
		  
		  // convert MD5 digest to a Hex string
		  Dim HashStr As Text
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
		Function Parent(Extends fi as Xojo.IO.FolderItem, endsWith as Text) As Xojo.IO.FolderItem
		  Using Xojo.IO
		  dim parent as FolderItem = fi.Parent
		  if (parent = nil) or parent.Name.EndsWith(endsWith) then
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Reveal(Extends f as folderItem)
		  Dim shell1 as new Shell
		  Dim cmd as Text
		  if f <>  nil then
		    if f.Exists then
		      #IF TargetWin32 then
		        cmd  = "explorer.exe /select,"+ chr(34).ToText+ f.NativePath.ToText+ chr(34).ToText
		        shell1.execute(cmd)
		      #elseIf TargetMachO or TargetMacOS then
		        cmd  = "Open -R "+  f.NativePath.ToText
		        shell1.execute(cmd)
		      #else
		        ' Linux?
		        
		      #ENDIF
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Reveal(Extends f as Xojo.IO.FolderItem)
		  Dim shell1 as new Shell
		  Dim cmd as Text
		  if f <>  nil then
		    if f.Exists then
		      #IF TargetWin32 then
		        cmd  = "explorer.exe /select,"+ chr(34).ToText+ f.Path+ chr(34).ToText
		        shell1.execute(cmd)
		      #elseIf TargetMachO or TargetMacOS then
		        cmd  = "Open -R "+  f.Path
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function StringMD5(str As Text) As Text
		  Dim uData as Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData(str)
		  Dim uMD5 as Xojo.Core.MemoryBlock = Xojo.Crypto.MD5(uData)
		  return ConvertToHex(uMD5).Lowercase.Padding(32, "0", PaddingAlignment.Left)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringRepeat(pattern As Text, multiplier As Integer) As Text
		  trigger_error("La fonction «StringRepeat» est désuette.", ErrorType.Deprecated)
		  return pattern.Repeat(multiplier)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strtobasictype(value As Text) As Auto
		  dim Auto As Auto = value
		  return Auto
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SubExpressionString(Extends pExp as RegExMatch, pID as Integer) As Text
		  Return pExp.SubExpressionString(pID).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function SubExpressionText(Extends pExp as RegExMatch, pID as Integer) As Text
		  Return pExp.SubExpressionString(pID).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub TODO(tache as Text)
		  #if DebugBuild
		    System.Log(System.LogLevelInformation, "TODO: " + tache)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub trigger_error(erreur As Text, Optional type As ErrorType = ErrorType.Error)
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
		  
		  ErrorBox erreur
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UnixToDate(i As Int64) As Date
		  Dim cd As New Date
		  
		  i = i + 2082844800
		  cd.TotalSeconds = i
		  
		  Return cd
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
