#tag Window
Begin Window FenetreMiseAJour
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   120
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   120
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   120
   MinimizeButton  =   False
   MinWidth        =   350
   Placement       =   3
   Resizeable      =   True
   Title           =   "#kMiseAJourDuLogiciel"
   Visible         =   True
   Width           =   350
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   75
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kMiseAJourDuLogicielDetail"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   255
   End
   Begin PushButton bAction
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "kCancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   239
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   81
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   91
   End
   Begin ProgressBar pProgess
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   75
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   49
      Transparent     =   False
      Value           =   0.0
      Visible         =   True
      Width           =   255
   End
   Begin HTTPSocket request
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Enabled         =   True
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
      IsConnected     =   False
      LastErrorCode   =   "0"
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   0
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin ProgressWheel pExtraction
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   211
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   81
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin Label lExtration
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kExtractionDuLogiciel"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   81
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   179
   End
   Begin Canvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   1164708047
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   55
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Visible         =   True
      Width           =   43
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   500
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub Cancel()
		  request.Disconnect
		  request.Close
		  temp_.Delete
		  
		  Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CopyFileorFolder(source as FolderItem, destination as FolderItem)
		  Dim i as Integer
		  Dim newFolder as FolderItem
		  
		  If source.directory then //it's a folder
		    newFolder = destination.child(source.name)
		    newFolder.createAsFolder
		    
		    For i=1 to source.count //go through each item
		      If source.item(i).directory then
		        //it's a folder
		        CopyFileOrFolder source.item(i), newFolder
		        //recursively call this
		        //routine passing it the folder
		      else
		        source.item(i).CopyFileTo newFolder
		        //it's a file so copy it
		      end if
		    next
		    
		  else //it's not a folder
		    source.CopyFileTo destination
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InstallUpdate()
		  lExtration.Visible = true
		  pExtraction.Visible = true
		  
		  #if TargetWin32
		    dim ext as String = item_.FileURL.Mid(item_.FileURL.LastIndexOf(".")+1).Lowercase
		    
		    if ext = "exe" then
		      mEstInstaller = true
		      UnarchiveFinish()
		      return
		    end
		  #endif
		  
		  dest_ = Xojo.IO.SpecialFolder.Temporary.Child(TextExtra.RandomText(10))
		  dest_.CreateAsFolder
		  
		  #if TargetMacOS
		    dim extract as new DiskImageUnarchiver(temp_.oldFolderItem, dest_.oldFolderItem)
		    
		    AddHandler extract.Finish, AddressOf UnarchiveMacFinish
		    AddHandler extract.Fail, AddressOf UnarchiveMacFail
		    
		    extract.Start
		    
		  #elseif TargetWin32
		    dim extract as new ZipImageUnarchiver(temp_.oldFolderItem, dest_.oldFolderItem)
		    
		    AddHandler extract.Finish, AddressOf UnarchiveWinFinish
		    AddHandler extract.Fail, AddressOf UnarchiveWinFail
		    
		    extract.Start
		    
		  #else 'TargetLinux
		    dim extract as new ZipImageUnarchiver(temp_.oldFolderItem, dest_.oldFolderItem)
		    
		    AddHandler extract.Finish, AddressOf UnarchiveLinFinish
		    AddHandler extract.Fail, AddressOf UnarchiveLinFail
		    
		    extract.Start
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrepareRelauncher()
		  mArchive = App.Resources.Relauncher()
		  
		  if not mArchive.Exists then
		    MsgBox kLanceurNonDisponible
		    state_ = UpdateState.Fermer
		    bAction.Caption = kFermerMAJ
		    return
		  end
		  
		  ' On s'assure qu'il n'y a pas déjà de relauncher dans le dossier temporaire
		  dim oldLauncher as FolderItem = SpecialFolder.Temporary.Child(mArchive.Name)
		  if oldLauncher.Exists then
		    oldLauncher.RecursiveDelete()
		  end if
		  
		  mArchive.CopyTo(Xojo.IO.SpecialFolder.Temporary)
		  mArchive = SpecialFolder.Temporary.XojoFolderItem.Child(mArchive.Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Relancer()
		  #if TargetWin32
		    
		    if mEstInstaller then
		      temp_.oldFolderItem.Launch()
		      Quit()
		      
		      return
		    end
		    
		  #endif
		  
		  
		  if mArchive = nil then
		    Raise new RuntimeException()
		  end
		  
		  #if TargetWin32
		    dim zip as ZipArchive = ZipArchive.Open(mArchive.oldFolderItem, true)
		    zip.ExtractAll(mArchive.oldFolderItem.Parent)
		    zip.Close()
		    
		    mRelauncher = mArchive.Parent.Child("relaunch.exe")
		    mArchive.Delete()
		    
		    Soft Declare Function ShellExecuteExW Lib "Shell32" ( info as Ptr ) as Boolean
		    Soft Declare Function ShellExecuteExA Lib "Shell32" ( info as Ptr ) as Boolean
		    
		    dim info as new MemoryBlock( 15 * 4 )
		    dim verb as new MemoryBlock( 32 )
		    dim file as new MemoryBlock( 260 * 2 )
		    dim args as new MemoryBlock(512)
		    
		    info.Long( 0 ) = info.Size
		    info.Long( 8 ) = self.Handle
		    if System.IsFunctionAvailable( "ShellExecuteExW", "Shell32" ) then
		      verb.WString( 0 ) = "runas"
		      file.WString( 0 ) = mRelauncher.oldFolderItem.NativePath
		      args.WString( 0 ) = Str(App.PID) + " """+relaunchItem_.oldFolderItem.ShellPath+""" """ + dest_.oldFolderItem.ShellPath+ """"
		    else
		      verb.CString( 0 ) = "runas"
		      file.CString( 0 ) = mRelauncher.oldFolderItem.NativePath
		      args.CString( 0 ) = Str(App.PID) + " """+relaunchItem_.oldFolderItem.ShellPath+""" """ + dest_.oldFolderItem.ShellPath+ """"
		      
		    end if
		    info.Ptr( 12 ) = verb
		    info.Ptr( 16 ) = file
		    info.Ptr( 20 ) = args
		    
		    Const SW_SHOWNORMAL = 1
		    info.Long( 28 ) = SW_SHOWNORMAL
		    
		    dim ret as Boolean
		    if System.IsFunctionAvailable( "ShellExecuteExW", "Shell32" ) then
		      ret = ShellExecuteExW( info )
		    else
		      ret = ShellExecuteExA( info )
		    end if
		    
		  #elseif TargetMacOS
		    dim zip as ZipArchive = ZipArchive.Open(mArchive.oldFolderItem, true)
		    zip.ExtractAll(mArchive.Parent.oldFolderItem, true)
		    zip.Close()
		    
		    mRelauncher = mArchive.Parent.Child("relaunch.app")
		    mArchive.Delete()
		    
		    mRelauncher.RecursivePermissions(&o777)
		    
		    mRelauncher.oldFolderItem.Launch(Str(App.PID) + " """+relaunchItem_.oldFolderItem.ShellPath+"""")
		    
		  #else 'TargetLinux
		    dim zip as ZipArchive = ZipArchive.Open(mArchive.oldFolderItem, true)
		    zip.ExtractAll(mArchive.Parent.oldFolderItem)
		    zip.Close()
		    
		    mRelauncher = mArchive.Parent.Child("relaunch")
		    mArchive.Delete()
		    
		    mRelauncher = mRelauncher.Parent.Child("relaunch")
		    mRelauncher.RecursivePermissions(&o777)
		    'MsgBox(mRelauncher.AbsolutePath + " " + Str(App.PID) + " """+relaunchItem_.ShellPath+""" """ + dest_.ShellPath+ """")
		    
		    mRelauncher.oldFolderItem.Launch(Str(App.PID) + " """+relaunchItem_.oldFolderItem.ShellPath+""" """ + dest_.oldFolderItem.ShellPath+ """")
		  #endif
		  
		  ForceQuit()
		  
		  Exception err
		    if err isa NilObjectException then
		      Dim d as New MessageDialog                  //declare the MessageDialog object
		      Dim b as MessageDialogButton                //for handling the result
		      d.icon=MessageDialog.GraphicStop         //display warning icon
		      d.ActionButton.Caption = "Mannuellement"
		      d.CancelButton.Visible = True              //show the Cancel button
		      d.CancelButton.Caption = kQuitterMAJ
		      d.AlternateActionButton.Visible=True        //show the "Don't Save" button
		      d.AlternateActionButton.Caption="Télécharger en ligne"
		      d.Message="kLa mise à jour n'a pu être téléchargée, veuillez essayez manuellement."+EndOfLine+"Ou télécharger la dernière version en ligne"
		      d.Explanation= ""
		      
		      b=d.ShowModal                              //display the dialog
		      Select Case b                              //determine which button was pressed.
		      Case d.ActionButton
		        ShowURL(item_.FileURL)
		        ForceQuit()
		      Case d.AlternateActionButton
		        ShowUrl(app.LienTelechargement)
		        ForceQuit()
		      Case d.CancelButton
		        ForceQuit()
		      End select
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Show()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(item as AppcastItem)
		  item_ = item
		  
		  Super.Show
		  
		  dim ext as Text = item_.FileURL.Mid(item_.FileURL.LastIndexOf(".")+1)
		  
		  temp_ = Xojo.IO.SpecialFolder.Temporary.Child(TextExtra.RandomText(10) + "-part." + ext)
		  
		  request.SetRequestHeader("User-Agent", Appcast.FullVersionName)
		  request.Get(item_.FileURL, temp_.OldFolderItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveFinish(success as Boolean = true)
		  lExtration.Visible = false
		  pExtraction.Visible = false
		  
		  if success  then
		    dim diff as Integer = (150 - bAction.Width)
		    
		    bAction.Width = 150
		    bAction.Left = (bAction.Left - diff)
		    
		    bAction.Caption = kQuitterRelancer
		    bAction.Default = true
		    state_ = UpdateState.Relancer
		  else
		    bAction.Caption = kFermerMAJ
		    state_ = UpdateState.Fermer
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveLinFail(extract as ZipImageUnarchiver)
		  MsgBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveLinFinish(extract as ZipImageUnarchiver)
		  PrepareRelauncher()
		  
		  relaunchItem_ = App.ExecutableFile.XojoFolderItem
		  
		  UnarchiveFinish()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveMacFail(extract as DiskImageUnarchiver)
		  MsgBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveMacFinish(extract as DiskImageUnarchiver)
		  PrepareRelauncher()
		  
		  for each child as Xojo.IO.FolderItem in dest_.Children
		    
		    if child.IsFolder and child.Name.EndsWith(".app") then
		      dim currentApp as Xojo.IO.FolderItem = App.ExecutableFile.XojoFolderItem.Parent(".app")
		      if currentApp = nil then
		        Raise new RuntimeException()
		      end
		      
		      dim destFolder as Xojo.IO.FolderItem = currentApp.Parent()
		      
		      #if not DebugBuild
		        child.Name = currentApp.Name
		      #endif
		      
		      currentApp.Name = SpecialFolder.Trash.XojoFolderItem.UniqueFolderItemName(currentApp.BaseName, "."+currentApp.Extension)
		      
		      currentApp.MoveTo(SpecialFolder.Trash.XojoFolderItem)
		      
		      child.CopyTo(destFolder)
		      
		      relaunchItem_ = destFolder.Child(child.Name)
		    end
		  next
		  
		  temp_.Delete()
		  dest_.RecursiveDelete()
		  
		  Timer1.Mode = 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveWinFail(extract as ZipImageUnarchiver)
		  MsgBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveWinFinish(extract as ZipImageUnarchiver)
		  PrepareRelauncher()
		  
		  'relaunchItem_ = SpecialFolder.Applications.Child("Budjhete").Child("Budjhete.exe")
		  relaunchItem_ = App.ExecutableFile.XojoFolderItem
		  
		  UnarchiveFinish()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected dest_ As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected item_ As AppcastItem = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mArchive As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEstInstaller As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRelauncher As Xojo.IO.FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected relaunchItem_ As Xojo.IO.FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		state_ As UpdateState = UpdateState.Annuler
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected temp_ As Xojo.IO.FolderItem
	#tag EndProperty


	#tag Enum, Name = UpdateState, Type = Integer, Flags = &h0
		Annuler
		  Fermer
		Relancer
	#tag EndEnum


#tag EndWindowCode

#tag Events bAction
	#tag Event
		Sub Action()
		  if state_ = UpdateState.Annuler then
		    Cancel()
		  elseif state_ = UpdateState.Fermer then
		    Close()
		  else
		    Relancer()
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events request
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  pProgess.Value = (bytesReceived/totalBytes)*100
		  lExtration.Text = str(bytesReceived/1024) + "/" + str(totalBytes/1024) + " Kb"
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  if DebugBuild then
		    if temp_.Length <> item_.Length or MD5(temp_).Lowercase <> item_.MD5Signature.Lowercase then
		      MsgBox("Erreur : Le fichier téléchargé est corrompu. (en test)")
		      bAction.Caption = "Fermer"
		      return
		    end
		  end if
		  
		  InstallUpdate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  UnarchiveFinish()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="state_"
		Visible=false
		Group="Behavior"
		InitialValue="UpdateState.Annuler"
		Type="UpdateState"
		EditorType="Enum"
		#tag EnumValues
			"0 - Annuler"
			"1 - Fermer"
			"2 - Relancer"
		#tag EndEnumValues
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
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
