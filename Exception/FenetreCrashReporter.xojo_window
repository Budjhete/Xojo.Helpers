#tag Window
Begin Window FenetreCrashReporter
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   434
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   434
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   3
   Resizeable      =   True
   Title           =   "#kRapporterProbleme"
   Visible         =   True
   Width           =   500
   Begin Label lRapporter
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   36
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kRapporterProblemeDetails"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   460
   End
   Begin Label lInfoDetails
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kInformationsDetaillees_"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextArea tInformations
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   100
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   460
   End
   Begin Label lComment
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
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
      Text            =   "#kDetailsOuCommentaires_"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   254
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin BHTextField tComment
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowTabs       =   False
      Alpha           =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   False
      Decimal         =   False
      Digit           =   False
      Email           =   False
      Enabled         =   True
      ErrorColor      =   &cFFC3B700
      ExactLength     =   0
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   100
      Hint            =   "kDécrivez-nous ce que vous avez tentez de faire..."
      ignoreChange    =   False
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   True
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   279
      Transparent     =   False
      Underline       =   False
      URL             =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   460
      ZipCode         =   False
   End
   Begin ProgressWheel progress
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   394
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin Label lEmail
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kEmailObligatoire"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   198
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin BHTextField tEmail
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      Alpha           =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Dash            =   False
      DataField       =   ""
      DataSource      =   ""
      Date            =   False
      Decimal         =   False
      Digit           =   False
      Email           =   True
      Enabled         =   True
      ErrorColor      =   &cFFC3B700
      ExactLength     =   0
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      ignoreChange    =   False
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   True
      Numeric         =   False
      Password        =   False
      Phone           =   False
      Range           =   False
      RangeMax        =   0
      RangeMin        =   0
      ReadOnly        =   False
      Regex           =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   220
      Transparent     =   False
      Underline       =   False
      URL             =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   460
      ZipCode         =   False
   End
   Begin PushButton bEnvoyer
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "#kEnvoyer"
      Default         =   True
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   400
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   394
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton bFermer
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "#kFermer"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   308
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   394
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(error as RuntimeException)
		  Me.excp = error
		  
		  Message = "Une exception de type "+Introspection.GetType(error).Name+" n'a pas été gérée." + EndOfLine
		  'Message = Message + pMessage + EndOfLine
		  
		  if error.Message <> "" then
		    Message = Message + EndOfLine + EndOfLine+ "Message:"+EndOfLine + error.Message()
		  end
		  
		  tInformations.Text = Message
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(error as RuntimeException, pMessage as String)
		  Me.excp = error
		  
		  Message = "Une exception de type "+Introspection.GetType(error).Name+" n'a pas été gérée." + EndOfLine
		  Message = Message + pMessage + EndOfLine
		  
		  if error.Message <> "" then
		    Message = Message + EndOfLine + EndOfLine+ "Message:"+EndOfLine + error.Message
		  end
		  
		  tInformations.Text = Message
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(infos as String)
		  Message = infos
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CreationDate As String
	#tag EndProperty

	#tag Property, Flags = &h0
		eMailFrom As String
	#tag EndProperty

	#tag Property, Flags = &h0
		excp As RuntimeException
	#tag EndProperty

	#tag Property, Flags = &h21
		Private heightClose As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private heightOpen As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		InitialVersion As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Message As String
	#tag EndProperty

	#tag Property, Flags = &h0
		post As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared ReportToEmail As String
	#tag EndProperty

	#tag Property, Flags = &h0
		URLreport As String
	#tag EndProperty


	#tag Constant, Name = kLangue, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fran\xC3\xA7ais"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Anglais"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Not detected"
	#tag EndConstant

	#tag Constant, Name = kOS, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Mac OS X"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Linux"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Windows"
	#tag EndConstant


#tag EndWindowCode

#tag Events tEmail
	#tag Event
		Sub Open()
		  'if Company <> Nil then
		  'dim cpny as Company = Company.Current()
		  'me.Text = cpny.Client().courriel
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  if me.Check then
		    bEnvoyer.Enabled = true
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bEnvoyer
	#tag Event
		Sub Action()
		  Me.Enabled = False
		  progress.Visible = true
		  bFermer.Cancel = false
		  bFermer.Caption = "Annuler"
		  
		  
		  
		  
		  dim req as new HTTPSocket
		  
		  req.SetRequestHeader("User-Agent", "Kanjo/2.0 (Macintosh; Intel Mac OS X 10_11_5; en-us)")
		  
		  dim post as new Dictionary
		  
		  post.Value("Details") = self.Message
		  post.Value("Langue") = kLangue
		  post.Value("OS") = CurrentOS // Part of Xojo.Helpers by kanjo
		  post.Value("Version") = App.Version
		  
		  
		  if ReportToEmail <> "" then
		    post.Value("ReportTo") = ReportToEmail
		  end
		  
		  
		  // Version initial du logiciel
		  
		  'IF version <> "" THEN
		  'post.Value("Initial version") = version
		  'end if
		  if creationDate <> "" Then
		    post.Value("Created on") = creationDate
		  end if
		  
		  
		  if System.NetworkInterfaceCount > 0 then
		    post.Value("MAC-modified") = StringMD5(System.GetNetworkInterface(0).MACAddress).Lowercase
		  end if
		  
		  post.Value("NbWindows") = str(WindowCount)
		  for i as Integer = 0 to WindowCount - 1
		    
		    if Window(i) isA FenetreCrashReporter then
		      continue
		    end if
		    
		    post.Value("Window" +str(i)) = Introspection.GetType(Window(i)).Name
		    
		    
		  next
		  
		  dim strStack() as String = excp.Stack
		  post.Value("NbStack") = str(strStack.Ubound + 1)
		  for i as Integer = 0 to strStack.Ubound
		    post.Value("Stack" + str(i)) = strStack(i)
		  next
		  
		  if tEmail.Text <> "" then
		    post.Value("Email") = tEmail.Text
		  else
		    
		  end if
		  
		  post.Value("CompagnieEmail") = ""
		  
		  
		  if tComment.Text <> "" then
		    post.Value("Comments") = tComment.Text
		  end if
		  
		  
		  // Fichier de journalisation
		  'dim fi as FolderItem = Logger.LogOutputFile
		  '
		  'if fi <> nil and fi.Exists then
		  'dim tis As TextInputStream = TextInputStream.Open(fi)
		  '
		  'try
		  'post.Value("Logs") = tis.ReadAll
		  'finally
		  'tis.Close
		  'end
		  'end
		  
		  
		  req.SetFormData(post)
		  call req.Post("https://app.kanjo.ca/crash-reporter.php", nil, 15)
		  
		  Quit()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bFermer
	#tag Event
		Sub Action()
		  Quit()
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="URLreport"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialVersion"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CreationDate"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="eMailFrom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
