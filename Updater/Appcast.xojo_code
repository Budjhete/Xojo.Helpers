#tag Class
Protected Class Appcast
	#tag Method, Flags = &h0
		Sub Constructor(url as String = "")
		  if url <> "" then
		    Load(url)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FullVersionName() As String
		  #if TargetMacOS
		    return App.LongVersion + " (Mac OS X)"
		  #elseif TargetWin32
		    return App.LongVersion + " (Windows)"
		  #elseif TargetLinux
		    return App.LongVersion + " (Linux)"
		  #endif
		  
		  Return App.LongVersion + " (Autre plateforme)"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HTTPSocketPageReceived(socket as HTTPSocket, URL as String, HTTPStatus as Integer, Headers as InternetHeaders, Content as String)
		  dim xml as new XmlDocument
		  dim param as XmlNode
		  
		  xml.LoadXml(Content)
		  
		  dim items as XMLNodeList = xml.XQL("//item")
		  For i as Integer = 0 to items.Length-1
		    dim node as XmlNode = items.Item(i)
		    
		    '#if not DebugBuild
		    '
		    'if node.GetAttribute("prerelease") = "1" then
		    'Continue
		    'end
		    '
		    '#endif
		    
		    
		    dim item as new AppcastItem
		    
		    ' Titre
		    param = node.Child("title")
		    if param <> nil then
		      item.Title = param.FirstChild.Value.ToText
		    end
		    
		    ' Description
		    param = node.Child("description")
		    if param <> nil then
		      item.Description = param.FirstChild.Value.ToText
		    end
		    
		    ' Date
		    param = node.Child("pubDate")
		    if param <> nil then
		      item.Date = param.FirstChild.Value.ToText
		    end
		    
		    ' ReleaseNotesURL
		    param = node.Child("releaseNotesLink")
		    if param <> nil then
		      item.ReleaseNotesURL = param.FirstChild.Value.ToText
		    end
		    
		    ' Enclosure:
		    for j as Integer = 0 to (node.ChildCount-1)
		      
		      param = node.Child(j)
		      if param.Name = "enclosure" and param.GetAttribute("os") = kMonOS then
		        item.MD5Signature = param.GetAttribute("md5Signature").ToText
		        item.FileURL = param.GetAttribute("url").ToText
		        item.MinimumSystemVersion = param.GetAttribute("minimumSystemVersion").ToText
		        item.Length = Val(param.GetAttribute("length"))
		        item.Version = new Version(param.GetAttribute("version"))
		      end
		      
		    next
		    
		    Me.Items.Append(item)
		  Next
		  
		  RaiseEvent Success()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lastest() As AppcastItem
		  dim item as AppcastItem = nil
		  
		  For i as Integer = 0 to Items.Ubound
		    if item = nil or item.Version < Items(i).Version then
		      item = Items(i)
		    end
		  Next
		  
		  return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(url as String)
		  mSocket = new HTTPSocket
		  
		  dim userAgent as String = Appcast.FullVersionName
		  if DebugBuild or Updater.Instance.ShowPrerelease then
		    userAgent = userAgent + "; show-prereleases"
		  end
		  
		  dim channel as String = Updater.Instance.Channel
		  
		  if channel <> "" and channel <> Updater.CHANNEL_STABLE then
		    userAgent = userAgent + "; channel="+Updater.Instance.Channel
		  end
		  
		  mSocket.SetRequestHeader("User-Agent", userAgent)
		  
		  AddHandler mSocket.PageReceived, AddressOf HTTPSocketPageReceived
		  
		  mSocket.Yield = true
		  dim content as string = mSocket.Get(url, 3)
		  
		  #pragma BreakOnExceptions Off
		  
		  try
		    if content.Trim() <> "" then
		      ParseContent(content.ToText)
		    end
		    
		    RaiseEvent Success()
		  catch ex as RuntimeException
		    // do nothing
		  end
		  
		  #pragma BreakOnExceptions Default
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseContent(Content as String)
		  redim Items(-1)
		  
		  dim xml as new XmlDocument
		  dim param as XmlNode
		  
		  xml.LoadXml(Content)
		  
		  dim items as XMLNodeList = xml.XQL("//item")
		  For i as Integer = 0 to items.Length-1
		    dim node as XmlNode = items.Item(i)
		    
		    '#if not DebugBuild
		    '
		    'if node.GetAttribute("prerelease") = "1" then
		    'Continue
		    'end
		    '
		    '#endif
		    
		    
		    dim item as new AppcastItem
		    
		    ' Titre
		    param = node.Child("title")
		    if param <> nil then
		      item.Title = param.FirstChild.Value.ToText
		    end
		    
		    ' Description
		    param = node.Child("description")
		    if param <> nil then
		      item.Description = param.FirstChild.Value.ToText
		    end
		    
		    ' Date
		    param = node.Child("pubDate")
		    if param <> nil then
		      item.Date = param.FirstChild.Value.ToText
		    end
		    
		    ' ReleaseNotesURL
		    param = node.Child("releaseNotesLink")
		    if param <> nil then
		      item.ReleaseNotesURL = param.FirstChild.Value.ToText
		    end
		    
		    ' Enclosure:
		    for j as Integer = 0 to (node.ChildCount-1)
		      
		      param = node.Child(j)
		      if param.Name = "enclosure" and param.GetAttribute("os") = kMonOS then
		        item.MD5Signature = param.GetAttribute("md5Signature").ToText
		        item.FileURL = param.GetAttribute("url").ToText
		        item.MinimumSystemVersion = param.GetAttribute("minimumSystemVersion").ToText
		        item.Length = Val(param.GetAttribute("length"))
		        item.Version = new Version(param.GetAttribute("version"))
		      end
		      
		    next
		    
		    Me.Items.Append(item)
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Success()
	#tag EndHook


	#tag Property, Flags = &h0
		Items() As AppcastItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSocket As HTTPSocket
	#tag EndProperty


	#tag Constant, Name = kMonOS, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"windows"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"macosx"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"linux"
		#Tag Instance, Platform = Mac Classic, Language = Default, Definition  = \"ppc"
	#tag EndConstant


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
End Class
#tag EndClass
