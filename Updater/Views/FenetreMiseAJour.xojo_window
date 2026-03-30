#tag DesktopWindow
Begin DesktopWindow FenetreMiseAJour Attributes ( Deprecated = true ) 
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   3
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   HasTitleBar     =   True
   Height          =   120
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   120
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   120
   MinimumWidth    =   350
   Resizeable      =   True
   Title           =   "#kMiseAJourDuLogiciel"
   Type            =   0
   Visible         =   True
   Width           =   350
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   True
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
   Begin DesktopButton bAction
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
   Begin DesktopProgressBar pProgess
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
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
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   49
      Transparent     =   False
      Value           =   0.0
      Visible         =   True
      Width           =   255
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
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
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   0
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin DesktopProgressWheel pExtraction
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
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
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   81
      Transparent     =   False
      Visible         =   False
      Width           =   16
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopLabel lExtration
      AllowAutoDeactivate=   True
      Bold            =   False
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
   Begin DesktopCanvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   1164708047
      Enabled         =   True
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
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub Cancel()
		  request.Disconnect
		  request.Close
		  if temp_ <> nil and temp_.Exists then
		    temp_.Delete
		  end if
		  
		  Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DownloadExtension() As String
		  dim cleanedURL as String = item_.FileURL
		  dim queryPos as Integer = cleanedURL.InStr("?")
		  if queryPos > 0 then
		    cleanedURL = cleanedURL.Left(queryPos-1)
		  end if
		  
		  return cleanedURL.LastField(".").Lowercase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FailInstallAndFallback()
		  state_ = UpdateState.Fermer
		  bAction.Caption = kFermerMAJ
		  pExtraction.Active = false
		  pExtraction.Visible = false
		  lExtration.Visible = false
		  
		  MessageBox(kVerifiezLesDroitsWEtRelancezLeProgramme)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FinalizeMacInstall()
		  try
		    PrepareRelauncher()
		    if state_ = UpdateState.Fermer then
		      return
		    end if
		    
		    for each child as FolderItem in dest_.Children
		      
		      if child.IsFolder and child.Name.EndsWith(".app") then
		        dim currentApp as FolderItem = App.ExecutableFile.XojoFolderItem.Parent(".app")
		        if currentApp = nil then
		          Raise new RuntimeException()
		        end
		        
		        dim destFolder as FolderItem = currentApp.Parent()
		        dim finalName as String = currentApp.Name
		        dim stagedName as String = destFolder.UniqueFolderItemName(currentApp.BaseName + "-update", "."+currentApp.Extension)
		        
		        child.Name = stagedName
		        child.CopyTo(destFolder)
		        
		        dim stagedApp as FolderItem = destFolder.Child(stagedName)
		        if stagedApp = nil or not stagedApp.Exists then
		          Raise new RuntimeException()
		        end if
		        
		        currentApp.Name = SpecialFolder.Trash.XojoFolderItem.UniqueFolderItemName(currentApp.BaseName, "."+currentApp.Extension)
		        
		        currentApp.MoveTo(SpecialFolder.Trash.XojoFolderItem)
		        
		        stagedApp.Name = finalName
		        
		        relaunchItem_ = destFolder.Child(finalName)
		        exit
		      end
		    next
		    
		    if relaunchItem_ = nil then
		      Raise new RuntimeException()
		    end if
		    
		    if temp_ <> nil and temp_.Exists then
		      temp_.Delete()
		    end if
		    if dest_ <> nil and dest_.Exists then
		      dest_.RecursiveDelete()
		    end if
		    
		    Timer1.Mode = 1
		    
		  catch err as RuntimeException
		    FailInstallAndFallback()
		  end try
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
		      If source.ChildAt(i).directory then
		        //it's a folder
		        CopyFileOrFolder source.ChildAt(i), newFolder
		        //recursively call this
		        //routine passing it the folder
		      else
		        source.ChildAt(i).CopyFileTo newFolder
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
		  pExtraction.Active = true
		  
		  dim ext as String = DownloadExtension()
		  
		  #if TargetWin32
		    if ext = "exe" then
		      mEstInstaller = true
		      UnarchiveFinish()
		      return
		    end if
		  #endif
		  
		  dest_ = SpecialFolder.Temporary.Child(RandomString(10))
		  dest_.CreateFolderIfNotExist
		  
		  #if TargetMacOS
		    if ext = "dmg" then
		      dim extract as new DiskImageUnarchiver(temp_.oldFolderItem, dest_.oldFolderItem)
		      
		      AddHandler extract.Finish, AddressOf UnarchiveMacFinish
		      AddHandler extract.Fail, AddressOf UnarchiveMacFail
		      
		      extract.Start
		    else
		      dim extract as new ZipImageUnarchiver(temp_.oldFolderItem, dest_.oldFolderItem)
		      
		      AddHandler extract.Finish, AddressOf UnarchiveMacZipFinish
		      AddHandler extract.Fail, AddressOf UnarchiveMacZipFail
		      
		      extract.Start
		    end if
		    
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
		    MessageBox kLanceurNonDisponible
		    state_ = UpdateState.Fermer
		    bAction.Caption = kFermerMAJ
		    return
		  end
		  
		  ' On s'assure qu'il n'y a pas déjà de relauncher dans le dossier temporaire
		  dim oldLauncher as FolderItem = SpecialFolder.Temporary.Child(mArchive.Name)
		  if oldLauncher.Exists then
		    if oldLauncher.IsFolder then
		      oldLauncher.RecursiveDelete()
		    else
		      oldLauncher.Remove
		    end if
		  end if
		  
		  mArchive.CopyTo(SpecialFolder.Temporary)
		  mArchive = SpecialFolder.Temporary.XojoFolderItem.Child(mArchive.Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Relancer()
		  try
		    #if TargetWin32
		      if mEstInstaller then
		        temp_.oldFolderItem.Launch()
		        ForceQuit()
		        return
		      end if
		    #endif
		    
		    if mArchive = nil then
		      Raise new RuntimeException()
		    end if
		    
		    #if TargetWin32
		      
		      dim zip as ZipArchive = ZipArchive.Open(mArchive.oldFolderItem, true)
		      zip.ExtractAll(mArchive.oldFolderItem.Parent)
		      zip.Close()
		      
		      mRelauncher = mArchive.Parent.Child("relaunch.exe")
		      mArchive.Delete()
		      
		      Soft Declare Function ShellExecuteW Lib "Shell32" ( hwnd as Integer, lpOperation as WString, lpFile as WString, lpParameters as WString, lpDirectory as WString, nShowCmd as Integer ) as Integer
		      
		      Const SW_SHOWNORMAL = 1
		      dim args as String = Str(App.PID) + " """+relaunchItem_.oldFolderItem.ShellPath+""" """ + dest_.oldFolderItem.ShellPath+ """"
		      dim ret as Integer = ShellExecuteW(Self.Handle, "runas", mRelauncher.oldFolderItem.NativePath, args, mRelauncher.Parent.NativePath, SW_SHOWNORMAL)
		      
		      if ret <= 32 then
		        mRelauncher.oldFolderItem.Launch(args)
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
		      ShowURL(item_.FileURL)
		      Close()
		      return
		    #endif
		    
		    ForceQuit()
		    
		  catch err as RuntimeException
		    ShowURL(item_.FileURL)
		    ForceQuit()
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Show()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(item as AppcastItem)
		  item_ = item
		  state_ = UpdateState.Annuler
		  mEstInstaller = false
		  dest_ = nil
		  mArchive = nil
		  mRelauncher = nil
		  relaunchItem_ = nil
		  bAction.Caption = kCancel
		  bAction.Default = false
		  bAction.Width = 91
		  bAction.Left = 239
		  pProgess.Value = 0
		  pExtraction.Visible = false
		  pExtraction.Active = false
		  lExtration.Visible = false
		  
		  Super.Show
		  
		  dim ext as String = DownloadExtension()
		  
		  temp_ = SpecialFolder.Temporary.Child(StringExtra.RandomString(10) + "-part." + ext)
		  
		  request.SetRequestHeader("User-Agent", Appcast.FullVersionName)
		  request.Get(item_.FileURL, temp_.OldFolderItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UnarchiveFinish(success as Boolean = true)
		  lExtration.Visible = false
		  pExtraction.Visible = false
		  pExtraction.Active = false
		  
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

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Attributes( Deprecated = True ) Protected Sub UnarchiveLinFail(extract as ZipImageUnarchiver)
		  MessageBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveLinFinish(extract as ZipImageUnarchiver)
		  PrepareRelauncher()
		  
		  relaunchItem_ = App.ExecutableFile.XojoFolderItem
		  
		  UnarchiveFinish()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveMacFail(extract as DiskImageUnarchiver)
		  MessageBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveMacZipFail(extract as ZipImageUnarchiver)
		  MessageBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveMacFinish(extract as DiskImageUnarchiver)
		  FinalizeMacInstall()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveMacZipFinish(extract as ZipImageUnarchiver)
		  FinalizeMacInstall()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveWinFail(extract as ZipImageUnarchiver)
		  MessageBox kErreurDecompressionArchive
		  UnarchiveFinish(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = false
		Protected Sub UnarchiveWinFinish(extract as ZipImageUnarchiver)
		  PrepareRelauncher()
		  if state_ = UpdateState.Fermer then
		    return
		  end if
		  
		  'relaunchItem_ = SpecialFolder.Applications.Child("Budjhete").Child("Budjhete.exe")
		  relaunchItem_ = App.ExecutableFile.XojoFolderItem
		  
		  UnarchiveFinish()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected dest_ As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected item_ As AppcastItem = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mArchive As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEstInstaller As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRelauncher As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected relaunchItem_ As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		state_ As UpdateState = UpdateState.Annuler
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected temp_ As FolderItem
	#tag EndProperty


	#tag Enum, Name = UpdateState, Type = Integer, Flags = &h0
		Annuler
		  Fermer
		Relancer
	#tag EndEnum


#tag EndWindowCode

#tag Events bAction
	#tag Event
		Sub Pressed()
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
		  if totalBytes > 0 then
		    pProgess.Value = (bytesReceived/totalBytes)*100
		    lExtration.Text = str(bytesReceived/1024) + "/" + str(totalBytes/1024) + " Kb"
		  else
		    pProgess.Value = 0
		    lExtration.Text = str(bytesReceived/1024) + " Kb"
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  dim hasExpectedLength as Boolean = item_.Length > 0
		  dim hasExpectedSignature as Boolean = item_.MD5Signature <> ""
		  
		  if hasExpectedLength or hasExpectedSignature then
		    dim invalidDownload as Boolean
		    
		    if hasExpectedLength and temp_.Length <> item_.Length then
		      invalidDownload = true
		    end if
		    
		    if hasExpectedSignature and MD5(temp_).Lowercase <> item_.MD5Signature.Lowercase then
		      invalidDownload = true
		    end if
		    
		    if invalidDownload then
		      MessageBox("Erreur : Le fichier téléchargé est corrompu. (en test)")
		      bAction.Caption = "Fermer"
		      state_ = UpdateState.Fermer
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
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
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
			"9 - Modeless Dialog"
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
		Type="ColorGroup"
		EditorType="ColorGroup"
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
		Type="DesktopMenuBar"
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
