#tag Module
Protected Module Helpers
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ActiveWindow() As DesktopWindow
		  if App.WindowCount > 0 then
		    return App.WindowAt(0)
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
		Function BuildPopupMenu(ParamArray items as String) As DesktopMenuItem
		  Dim m as new DesktopMenuItem
		  
		  for i as Integer = 0 to items.Ubound
		    m.AddMenu(new DesktopMenuItem(items(i), i))
		  next
		  
		  return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Sub CloseAllWindows()
		  For i as Integer = WindowCount - 1 DownTo 0
		    Dim w as DesktopWindow = App.WindowAt(i)
		    If w <> nil then
		      w.Close()
		    End if
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorDarker(cc as Color) As Color
		  if color.IsDarkMode then
		    return color.RGB(cc.Red-60, cc.Green-60, cc.Blue-60)
		  else
		    Return cc
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSwitch(cc as Color) As Color
		  if color.IsDarkMode then
		    return color.RGB(255-cc.Red, 255-cc.Green, 255-cc.Blue)
		  else
		    Return cc
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToHex(Source as String) As String
		  Dim SrcMB As MemoryBlock
		  SrcMB = Source
		  
		  
		  
		  Dim ReturnValue as String
		  Dim OneBitHex as String
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
		Function ConvertToHex(Source As Xojo.Core.MemoryBlock) As String
		  Xojo.Core
		  
		  Dim ReturnValue as String
		  Dim OneBitHex as String
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
		Sub CopyFileorFolder(source as FolderItem, destination as FolderItem)
		  'Dim i as Integer
		  Dim newFolder as FolderItem
		  
		  If source.IsFolder then
		    
		    newFolder=destination.child(source.name)
		    newFolder.CreateFolder
		    
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
		Function DateToUnix(d As DateTime) As Uint64
		  
		  Return d.SecondsFrom1970
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(Extends ref as Dictionary, obj as Dictionary) As Boolean
		  
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
		Sub ErrorBox(title as String = "", message as String)
		  #if TargetIOS then
		    Dim MessageBox As MobileMessageBox
		    MessageBox.Title = title
		    MessageBox.Message = message
		    
		    MessageBox.Show
		    
		  #else
		    MessageBox(title+EndOfLine+EndOfLine+message)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EstEntrer(char as String) As Boolean
		  return (char = Text.FromUnicodeCodepoint(3) Or char = Text.FromUnicodeCodepoint(13))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillLeft(str As String, padding As String, length As Integer) As String
		  trigger_error("La fonction «FillLeft» est désuette.", ErrorType.Deprecated)
		  return str.FillLeft(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillRight(str As String, padding As String, length As Integer) As String
		  trigger_error("La fonction «FillRight» est désuette.", ErrorType.Deprecated)
		  return str.FillRight(padding, length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function FindFile(file as String, paths() as FolderItem) As FolderItem
		  dim path, fi as FolderItem
		  
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

	#tag Method, Flags = &h0
		Function FromLabel(extends e as MimeEmailMBS) As string
		  dim h as MimeHeaderMBS = e.Header
		  dim f as MimeMailboxListMBS = h.from
		  
		  if f <> nil then
		    dim Mailboxes() as MimeMailboxMBS = f.Mailboxes
		    
		    for each m as MimeMailboxMBS in Mailboxes
		      dim l as string = m.LabelDecoded
		      if l = "" then
		        l = m.Email
		      end if
		      
		      return l
		    next
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function GetResourceFolder() As FolderItem
		  #if TargetLinux
		    return new FolderItem(App.ExecutableFile.Parent.Child(App.ExecutableFile.Name + " Resources").NativePath)
		  #elseif TargetWin32
		    return new FolderItem(App.ExecutableFile.Parent.Child(replace(App.ExecutableFile.Name, ".exe", "") + " Resources").NativePath)
		  #elseif TargetMacOS
		    return new FolderItem(App.ExecutableFile.Parent.Parent.Child("Resources").NativePath)
		  #Elseif TargetIOS
		    Return new FolderItem(SpecialFolder.Resource("Resources").NativePath)
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
		Function IIF(condition as Boolean, trueValue as Boolean, falseValue as Boolean) As Boolean
		  if condition then
		    return trueValue
		  else
		    return falseValue
		  end
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
		Function IIF(condition as Boolean, trueValue as ORM, falseValue as ORM) As ORM
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub ImportSQL(db as SQLiteDatabase, sql as FolderItem)
		  
		  
		  dim tis As TextInputStream
		  tis = TextInputStream.Open(sql)
		  
		  ImportSQL(db, tis.ReadAll)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub ImportSQL(db as SQliteDatabase, sql as String)
		  dim tis As TextInputStream
		  tis = TextInputStream.Open(ResourceManager.Instance.SQL("sqlite"))
		  
		  
		  Dim queries() as String = sql.Split(";")
		  For Each query as String In queries
		    db.ExecuteSQL(query)
		    If DB.Error Then
		      System.DebugLog "DB Error: " + db.ErrorCode.StringValue + "  " + db.ErrorMessage + EndOfLine  + EndOfLine+ "Dans cette requête : " + query
		    Else
		      db.Commit()
		    End If
		    
		  Next
		  
		  System.DebugLog "DEBUG : Tables created as sqlite"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InvertImage(source As Picture) As Picture
		  If source Is Nil Then Return Nil
		  
		  if color.IsDarkMode then
		    
		    Var newPicture As New Picture(source.Width, source.Height)
		    Var sourceSurface As RGBSurface = source.RGBSurface
		    Var destSurface As RGBSurface = newPicture.RGBSurface
		    
		    If sourceSurface Is Nil Or destSurface Is Nil Then Return Nil
		    
		    For x As Integer = 0 To source.Width - 1
		      For y As Integer = 0 To source.Height - 1
		        Var c As Color = sourceSurface.Pixel(x,y)
		        destSurface.Pixel(x,y) = Color.RGBA(255 - c.Red, 255 - c.Green, 255 - c.Blue, c.Alpha)
		      Next
		    Next
		    
		    Return newPicture
		  else
		    Return source
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isArray(value As Auto) As Boolean
		  Using Xojo.Introspection
		  if value=nil then Return false
		  Return Xojo.Introspection.GetType(value).isArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInteger(str as String) As Boolean
		  return str.Test("^\d+$")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOnTop(w As DesktopWindow) As Boolean
		  return w = Window(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsWindowOpen(name as String) As boolean
		  For i as Integer = 0 to WindowCount - 1
		    Dim w as DesktopWindow = App.WindowAt(i)
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
		Sub LogToDesktop(message as String)
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
		Function MD5(f as FolderItem) As String
		  // test parameters
		  If f=Nil Then Return ""
		  If Not f.Exists Then Return ""
		  If f.IsFolder Then Return ""
		  
		  // read file f to a string
		  // Note: RB string supports any binary data
		  Dim b As BinaryStream
		  b = BinaryStream.Open(f, false)
		  
		  
		  // get the MD5 digest
		  Dim MD5Dgt As String
		  If b.Length<1 Then
		    // file f is not readable
		    Return ""
		  Else
		    Dim mb As New MemoryBlock(b.Length)
		    mb = b.Read(b.Length)
		    b.Close
		    MD5Dgt= Crypto.MD5(mb)
		    
		  End If
		  
		  
		  
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
		Sub Reveal(Extends f as FolderItem)
		  Dim shell1 as new Shell
		  Dim cmd as String
		  if f <>  nil then
		    if f.Exists then
		      #IF TargetWin32 then
		        cmd  = "explorer.exe /select,"+ chr(34)+ f.NativePath+ chr(34)
		        shell1.execute(cmd)
		      #elseIf TargetMachO or TargetMacOS then
		        cmd  = "Open -R "+  f.NativePath
		        shell1.execute(cmd)
		      #else
		        ' Linux?
		        
		      #ENDIF
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenPosX(ctrl As DesktopUIControl) As Integer
		  return ctrl.Left + ctrl.Window.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenPosY(ctrl As DesktopUIControl) As Integer
		  return ctrl.Top + ctrl.Window.Top
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function StringMD5(str As String) As String
		  return ConvertToHex(MD5(str)).Lowercase.Padding(32, "0", PaddingAlignment.Left)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function StringRepeat(pattern As String, multiplier As Integer) As String
		  trigger_error("La fonction «StringRepeat» est désuette.", ErrorType.Deprecated)
		  return pattern.Repeat(multiplier)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strtobasictype(value as String) As Auto
		  dim Auto As Auto = value
		  return Auto
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SubExpressionString(Extends pExp as RegExMatch, pID as Integer) As String
		  Return pExp.SubExpressionString(pID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Attributes( Deprecated )  Function TextMD5(str As Text) As Text
		  Dim uData as Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData(str)
		  Dim uMD5 as Xojo.Core.MemoryBlock = Xojo.Crypto.MD5(uData)
		  return ConvertToHex(uMD5).Lowercase.Padding(32, "0", PaddingAlignment.Left)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub TODO(tache as String)
		  #if DebugBuild
		    System.Log(System.LogLevelInformation, "TODO: " + tache)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToLabel(extends e as MimeEmailMBS) As string
		  dim h as MimeHeaderMBS = e.Header
		  dim f as MimeAddressListMBS = h.too
		  dim parts() as string
		  
		  if f <> nil then
		    dim Addresses() as MimeAddressMBS = f.Addresses
		    
		    for each a as MimeAddressMBS in Addresses
		      dim g as MimeGroupMBS = a.Group
		      
		      if g <> nil then
		        parts.Append g.NameDecoded
		      else
		        dim m as MimeMailboxMBS = a.Mailbox
		        if m <> nil then
		          dim s as string = m.LabelDecoded
		          if s = "" then
		            s = m.Email
		          end if
		          
		          parts.Append s
		        end if
		      end if
		    next
		  end if
		  
		  Return Join(parts, ", ")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub trigger_error(erreur As String, Optional type As ErrorType = ErrorType.Error)
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
End Module
#tag EndModule
