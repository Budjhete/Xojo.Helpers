#tag Window
Begin Window FenetreNouvelleVersion
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   624
   ImplicitInstance=   False
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   3
   Resizeable      =   True
   Title           =   "#kMiseAJourDuLogiciel"
   Visible         =   True
   Width           =   886
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   93
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
      Text            =   "#kMiseAJourDuLogicielText1"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   17
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   765
   End
   Begin Label lDetail
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   38
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   93
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kMiseAJourDuLogicielText2"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   49
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   773
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kNotesVersion_"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   98
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   106
   End
   Begin PushButton bUpdate
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "kMettreAJour"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   749
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   117
   End
   Begin PushButton bLater
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "kRappelerUlterieurement"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   544
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   179
   End
   Begin PushButton bSkip
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "kPasserCetteVersion"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   162
   End
   Begin CheckBox cAuto
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "#kAutomatiquementMettreAJour"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   552
      Transparent     =   False
      Underline       =   False
      Value           =   "False"
      Visible         =   True
      Width           =   846
   End
   Begin BHLink LinWithoutGtkLink
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   95
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   32
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   1001725311
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   68
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   61
   End
   Begin Rectangle Rectangle1
      AutoDeactivate  =   True
      BorderWidth     =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   422
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   118
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   846
      Begin HTMLViewer hNotes
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   420
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Renderer        =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   118
         Visible         =   True
         Width           =   844
      End
   End
   Begin PushButton bManuel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "kMiseAJourManuel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   327
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  mLastActivate = new Date
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if item_.Version <> nil then
		    lDetail.Text = lDetail.Text.AssignVars(item_.Version.ToString, App.Version)
		  else
		    lDetail.Text = kMiseAJourDuLogicielTextNotAuto.AssignVars(App.Version, App.Name)
		  end
		  
		  #if TargetLinux
		    dim libFolder as FolderItem = GetFolderItem("/usr/lib/", FolderItem.PathTypeNative)
		    if not libFolder.Child("libgtkhtml-2.so").Exists then
		      Me.hNotes.Visible = false
		      Me.LinWithoutGtkLink.Text = item_.ReleaseNotesURL
		      Me.LinWithoutGtkLink.Visible = true
		      Me.Height = Me.Height - hNotes.Height
		      
		      return
		    end if
		  #endif
		  
		  hNotes.LoadURL(item_.ReleaseNotesURL)
		  
		  
		  Self.SetFocus()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(item as AppcastItem)
		  item_ = item
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFile(file As String)
		  'file_ = file
		  '
		  'hNotes.LoadURL("http://budjhete.com/updates/readme.php?"+file)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVersion(version As String)
		  'if textDetail_ = "" then
		  'textDetail_ = lDetail.Text
		  'end
		  '
		  'dim text As String = textDetail_
		  '
		  'text = text.Replace("{VERSION}", version)
		  'text = text.Replace("{ACTUELLE}", App.VersionName)
		  '
		  'lDetail.Text = text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SudoMove(fileToMove as FolderItem, receiveFolder as FolderItem)
		  dim shell as new Shell
		  dim exString as String = "mv " + fileToMove.NativePath + " " + receiveFolder.NativePath
		  
		  select case System.EnvironmentVariable("DESKTOP_SESSION")
		  case "gnome"
		    shell.Execute("sudo " + exString)
		    'MsgBox("gksudo " + exString)
		  case "xfce"
		    shell.Execute("gksudo " + exString)
		  case "kde"
		    shell.Execute("kdesudo " + exString)
		  case ""
		    select case System.EnvironmentVariable("GDMSESSION")
		    case "gnome"
		      shell.Execute("gksudo " + exString)
		    case "xfce"
		      shell.Execute("gksudo " + exString)
		    case "kde"
		      shell.Execute("kdesudo " + exString)
		    case ""
		    end select
		  end select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		item_ As AppcastItem
	#tag EndProperty

	#tag Property, Flags = &h0
		mLastActivate As Date
	#tag EndProperty


#tag EndWindowCode

#tag Events bUpdate
	#tag Event
		Sub Action()
		  if App.EnableAutoUpdates then
		    Updater.Instance.Update(item_)
		  else
		    ShowURL(App.LienTelechargement) // use Constants in App.
		  end
		  
		  Close()
		  
		  'FenetreMiseAJour.Show()
		  'FenetreMiseAJour.Telecharger(file_)
		  'Close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bLater
	#tag Event
		Sub Action()
		  Updater.Instance.UpdateLater(item_)
		  Close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bSkip
	#tag Event
		Sub Action()
		  Updater.Instance.Skip(item_.Version)
		  Close()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cAuto
	#tag Event
		Sub Action()
		  Updater.Instance.AutoUpdate = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  dim now as new Date
		  now.Second = now.Second - 2
		  
		  Self.Show()
		  
		  if mLastActivate <> nil and mLastActivate < now then
		    Me.Mode = Timer.ModeOff
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bManuel
	#tag Event
		Sub Action()
		  ShowURL(item_.FileURL)
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
