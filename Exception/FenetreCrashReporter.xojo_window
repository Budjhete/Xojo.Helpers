#tag Window
Begin Window FenetreCrashReporter
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   434
   ImplicitInstance=   True
   LiveResize      =   True
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
   Title           =   "kRapporterProbleme"
   Visible         =   True
   Width           =   500
   Begin Label lRapporter
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   36
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
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kRapporterProblemeDetails"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   460
   End
   Begin Label lInfoDetails
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kInformationsDetaillees_"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextArea tInformations
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   100
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   86
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   460
   End
   Begin Label lComment
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kDetailsOuCommentaires_"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   254
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin BHTextField tComment
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "kDécrivez-nous ce que vous avez tentez de faire..."
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
      Format          =   ""
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      MaxLength       =   0
      mError          =   ""
      MinLength       =   0
      NotEmpty        =   False
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
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Text_           =   ""
      Top             =   279
      Transparent     =   False
      Underline       =   False
      URL             =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   460
      ZipCode         =   False
   End
   Begin ProgressWheel progress
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
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
      Top             =   394
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin Label lEmail
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "kEmailObligatoire"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   198
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin BHTextField tEmail
      AcceptTabs      =   False
      Alignment       =   0
      Alpha           =   False
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "kVousPouvezAussiMettreVotreNumeroDeTelephone"
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
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
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
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Text_           =   ""
      Top             =   220
      Transparent     =   False
      Underline       =   False
      URL             =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   460
      ZipCode         =   False
   End
   Begin PushButton bEnvoyer
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "kEnvoyer"
      Default         =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   400
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   394
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton bFermer
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "kFermer"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   308
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
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
		  
		  Message = "Une exception de type "+Introspection.GetType(error).Name.totext+" n'a pas été gérée." + EndOfLine_
		  'Message = Message + pMessage + EndOfLine_
		  
		  if error.Message <> "" then
		    Message = Message + EndOfLine_ + EndOfLine_ + "Message:"+EndOfLine_ +error.Message().ToText
		  end
		  
		  tInformations.Text = Message
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(error as RuntimeException, pMessage as Text)
		  Me.excp = error
		  
		  Message = "Une exception de type "+Introspection.GetType(error).Name.ToText+" n'a pas été gérée." + EndOfLine_
		  Message = Message + pMessage + EndOfLine_
		  
		  if error.Message <> "" then
		    Message = Message + EndOfLine_ + EndOfLine_ + "Message:"+EndOfLine_ +error.Message.ToText
		  end
		  
		  tInformations.Text = Message
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  post = new Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(infos as Text)
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
		Private Message As Text
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
		  //if me.Check then
		  bEnvoyer.Enabled = true
		  //end if
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
		  
		  IF version <> "" THEN
		    post.Value("Initial version") = version
		  end if
		  if creationDate <> "" Then
		    post.Value("Created on") = creationDate
		  end if
		  
		  
		  if System.NetworkInterfaceCount > 0 then
		    post.Value("MAC-modified") = StringMD5(System.GetNetworkInterface(0).MACAddress.ToText).Lowercase
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
		  call req.Post("http://app.kanjo.ca/crash-reporter.php", nil, 15)
		  
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="URLreport"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialVersion"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CreationDate"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
