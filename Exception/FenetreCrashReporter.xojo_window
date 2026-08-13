#tag DesktopWindow
Begin DesktopWindow FenetreCrashReporter
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   True
   DefaultLocation =   3
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   434
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   434
   MinimumWidth    =   500
   Resizeable      =   True
   Title           =   "#kRapporterProbleme"
   Type            =   0
   Visible         =   True
   Width           =   500
   Begin DesktopLabel lRapporter
      AllowAutoDeactivate=   True
      Bold            =   True
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
   Begin DesktopLabel lInfoDetails
      AllowAutoDeactivate=   True
      Bold            =   False
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
   Begin DesktopTextArea tInformations
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
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
   Begin DesktopLabel lComment
      AllowAutoDeactivate=   True
      Bold            =   False
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
      ConvertPhoneToNumber=   False
      Dash            =   False
      Date            =   False
      Decimal         =   False
      DefaultCountryCode=   1
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
      PhoneDisplayMode=   0
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
   Begin DesktopProgressWheel progress
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
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
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   394
      Transparent     =   False
      Visible         =   False
      Width           =   16
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopLabel lEmail
      AllowAutoDeactivate=   True
      Bold            =   False
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
      ConvertPhoneToNumber=   False
      Dash            =   False
      Date            =   False
      Decimal         =   False
      DefaultCountryCode=   1
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
      PhoneDisplayMode=   0
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
   Begin DesktopButton bEnvoyer
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
   Begin DesktopButton bFermer
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
#tag EndDesktopWindow

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
		Sub TextChange()
		  if me.Check then
		    bEnvoyer.Enabled = true
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bEnvoyer
	#tag Event
		Sub Pressed()
		  Me.Enabled = False
		  progress.Visible = True
		  bFermer.Cancel = False
		  bFermer.Caption = kAnnuler(App.Lang)

		  Var crashStackLines() As String
		  Var crashExceptionType As String
		  Var crashExceptionMessage As String
		  If excp <> Nil Then
		    crashExceptionType = Introspection.GetType(excp).Name
		    crashExceptionMessage = excp.Message
		    crashStackLines = excp.Stack
		  End If

		  Var crashContext As New Dictionary
		  Var crashWindows() As Variant
		  For crashWindowIndex As Integer = 0 To App.WindowCount - 1
		    If App.WindowAt(crashWindowIndex) IsA FenetreCrashReporter Then Continue
		    crashWindows.Add(Introspection.GetType(App.WindowAt(crashWindowIndex)).Name)
		  Next
		  crashContext.Value("windows") = crashWindows
		  crashContext.Value("window_count") = crashWindows.Count
		  crashContext.Value("created_on") = CreationDate
		  crashContext.Value("report_to") = ReportToEmail
		  crashContext.Value("details") = Self.Message

		  Var crashDeviceHash As String
		  If System.NetworkInterfaceCount > 0 Then
		    crashDeviceHash = EncodeHex(Crypto.SHA256(System.GetNetworkInterface(0).MACAddress)).Lowercase
		  End If

		  Var crashCompany As ModelCompany = App.CurrentCompany
		  Var crashUserName As String
		  Var crashPassword As String
		  If crashCompany <> Nil And crashCompany.Utilisateur <> Nil And crashCompany.Utilisateur.Pk > 0 Then
		    Var crashUserID As Integer = crashCompany.Utilisateur.Pk.IntegerValue
		    crashUserName = crashCompany.Preference("UserNameKanjoWeb" + crashUserID.ToString).StringValue.Trim
		    If crashUserName = "" Then crashUserName = crashCompany.Preference("UserNameKanjoMobile" + crashUserID.ToString).StringValue.Trim
		    crashPassword = crashCompany.Preference("MotDePasseKanjoWeb" + crashUserID.ToString).StringValue
		    If crashPassword = "" Then crashPassword = crashCompany.Preference("MotDePasseKanjoMobile" + crashUserID.ToString).StringValue
		  End If

		  Var crashReporterEmail As String = tEmail.Text.Trim
		  If crashReporterEmail = "" Then crashReporterEmail = crashUserName
		  Var crashUUIDSource As String = DateTime.Now.SecondsFrom1970.ToString + "|" + System.Random.InRange(100000, 999999).ToString + "|" + crashDeviceHash

		  Var crashPayload As New Dictionary
		  crashPayload.Value("report_uuid") = EncodeHex(Crypto.SHA256(crashUUIDSource)).Lowercase
		  crashPayload.Value("project") = KanjoAppDesktopProjectName
		  crashPayload.Value("version") = App.Version
		  crashPayload.Value("build") = App.NonReleaseVersion
		  crashPayload.Value("operating_system") = CurrentOS
		  crashPayload.Value("language") = App.Lang
		  crashPayload.Value("exception_type") = crashExceptionType
		  crashPayload.Value("exception_message") = crashExceptionMessage
		  crashPayload.Value("stack_trace") = String.FromArray(crashStackLines, EndOfLine)
		  crashPayload.Value("comments") = tComment.Text
		  crashPayload.Value("reporter_email") = crashReporterEmail
		  crashPayload.Value("device_hash") = crashDeviceHash
		  crashPayload.Value("context") = crashContext

		  Var crashPayloadJSON As String = GenerateJSON(crashPayload)
		  Var crashAuthHeader As String
		  If crashUserName <> "" And crashPassword <> "" Then crashAuthHeader = KanjoAppEncodeCredentials(crashUserName, crashPassword)

		  Var crashResponse As Dictionary = App.KanjoAppSendCrashReport(crashPayloadJSON, crashAuthHeader)
		  If crashResponse Is Nil Or Not crashResponse.Lookup("ok", False).BooleanValue Then
		    Var queued As Boolean = App.KanjoAppQueueCrashReport(crashPayload.Value("report_uuid").StringValue, crashPayloadJSON, crashAuthHeader)
		    Var sendDetails As String
		    
		    If crashResponse <> Nil Then
		      Var crashStatus As Integer = crashResponse.Lookup("status", 0).IntegerValue
		      If crashStatus > 0 Then sendDetails = "HTTP " + crashStatus.ToString
		      If crashResponse.Lookup("error", "").StringValue.Trim <> "" Then
		        If sendDetails <> "" Then sendDetails = sendDetails + EndOfLine
		        sendDetails = sendDetails + crashResponse.Value("error").StringValue
		      End If
		    End If
		    
		    If queued Then
		      tInformations.Text = Self.Message + EndOfLine + EndOfLine + kCrashReportQueued(App.Lang)
		    Else
		      tInformations.Text = Self.Message + EndOfLine + EndOfLine + kCrashReportSendFailed(App.Lang)
		    End If
		    If sendDetails <> "" Then tInformations.Text = tInformations.Text + EndOfLine + sendDetails
		    
		    Me.Enabled = True
		    progress.Visible = False
		    bFermer.Cancel = True
		    bFermer.Caption = kFermer(App.Lang)
		    Return
		  End If

		  Quit
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bFermer
	#tag Event
		Sub Pressed()
		  Quit()
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
		Type="DesktopMenuBar"
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
