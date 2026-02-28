#tag Class
Protected Class NextCloudClass
	#tag Method, Flags = &h0
		Function BuildFilesWebURL(remotePath As String) As String
		  // Builds a human-friendly Nextcloud Files URL:
		  // https://cloud.domain.com/apps/files/?dir=%2Fpath
		  
		  Var rp As String = NormalizeRemotePath(remotePath)
		  If rp.EndsWith("/") And rp.Length > 1 Then rp = rp.Left(rp.Length - 1)
		  
		  Var base As String = BaseWeb.Trim
		  If base.EndsWith("/") Then base = base.Left(base.Length - 1)
		  
		  Return base + "/apps/files/?dir=" + rp.URLEncode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		    // Optional: implement later (WebDAV DELETE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Download()
		    // Optional: implement later (WebDAV GET)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Exists()
		    // Optional: implement later (WebDAV PROPFIND Depth:0 or HEAD)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListFolders(remotePath As String) As NcFolderEntry()
		  // Lists sub-folders in remotePath using WebDAV PROPFIND Depth: 1
		  // BaseDav example:
		  //   https://cloud.domain.com/remote.php/dav/files/<username>/
		  
		  Var out() As NcFolderEntry
		  
		  Var rp As String = NormalizeRemotePath(remotePath) // "/.../"
		  
		  If Username.Trim = "" Or AppPassword.Trim = "" Then Return out
		  If BaseDav.Trim = "" Then Return out
		  
		  Var base As String = BaseDav.Trim
		  If Not base.EndsWith("/") Then base = base + "/"
		  
		  // Build full URL: base + rp without leading "/"
		  Var url As String = base + rp.Middle(1)
		  
		  Var body As String = _
		  "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine + _
		  "<d:propfind xmlns:d=""DAV:"">" + EndOfLine + _
		  "  <d:prop>" + EndOfLine + _
		  "    <d:resourcetype/>" + EndOfLine + _
		  "    <d:displayname/>" + EndOfLine + _
		  "  </d:prop>" + EndOfLine + _
		  "</d:propfind>"
		  
		  Var u As New URLConnection
		  u.RequestHeader("Depth") = "1"
		  u.RequestHeader("Content-Type") = "application/xml; charset=utf-8"
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  
		  // Basic auth
		  Var auth As String = EncodeBase64(Username + ":" + AppPassword, 0)
		  u.RequestHeader("Authorization") = "Basic " + auth
		  u.SetRequestContent(body, "application/xml; charset=utf-8")
		  
		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 60)
		  Catch e As RuntimeException
		    Return out
		  End Try
		  
		  // Basic sanity
		  If response.Trim = "" Then Return out
		  If Not response.Trim.BeginsWith("<") Then Return out
		  
		  Var x As New XmlDocument
		  Try
		    x.LoadXml(response)
		  Catch
		    Return out
		  End Try
		  
		  Var marker As String = "/remote.php/dav/files/" + Username
		  
		  Var root As XmlNode = x.DocumentElement // multistatus
		  If root Is Nil Then Return out
		  
		  For i As Integer = 0 To root.ChildCount - 1
		    Var resp As XmlNode = root.Child(i)
		    If resp Is Nil Or resp.LocalName <> "response" Then Continue
		    
		    Var href As String
		    Var display As String
		    Var isCollection As Boolean
		    
		    For j As Integer = 0 To resp.ChildCount - 1
		      Var n As XmlNode = resp.Child(j)
		      If n Is Nil Then Continue
		      
		      Select Case n.LocalName
		      Case "href"
		        If n.FirstChild <> Nil Then href = n.FirstChild.Value.URLDecode
		        
		      Case "propstat"
		        // Find prop/displayname and prop/resourcetype/collection
		        For k As Integer = 0 To n.ChildCount - 1
		          Var ps As XmlNode = n.Child(k)
		          If ps Is Nil Or ps.LocalName <> "prop" Then Continue
		          
		          For m As Integer = 0 To ps.ChildCount - 1
		            Var p As XmlNode = ps.Child(m)
		            If p Is Nil Then Continue
		            
		            If p.LocalName = "displayname" And p.FirstChild <> Nil Then
		              display = p.FirstChild.Value
		              
		            ElseIf p.LocalName = "resourcetype" Then
		              For t As Integer = 0 To p.ChildCount - 1
		                Var c As XmlNode = p.Child(t)
		                If c <> Nil And c.LocalName = "collection" Then
		                  isCollection = True
		                  Exit
		                End If
		              Next
		            End If
		          Next
		        Next
		      End Select
		    Next
		    
		    If href.Trim = "" Then Continue
		    If Not isCollection Then Continue
		    
		    // Extract remote path from href
		    Var pos As Integer = href.IndexOf(marker)
		    If pos < 0 Then Continue
		    
		    Var remote As String = href.Middle(pos + marker.Length)
		    If remote.Trim = "" Then remote = "/"
		    If Not remote.BeginsWith("/") Then remote = "/" + remote
		    If Not remote.EndsWith("/") Then remote = remote + "/"
		    
		    // Ignore "self" entry
		    If remote = rp Then Continue
		    
		    Var e As NcFolderEntry
		    e.Name = If(display.Trim <> "", display.Trim, remote)
		    e.RemotePath = remote
		    out.Add(e)
		  Next
		  
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MkCol()
		    // Optional: implement later (WebDAV MKCOL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Move()
		    // Optional: implement later (WebDAV MOVE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NormalizeRemotePath(path As String) As String
		  // Ensures:
		  // - starts with "/"
		  // - folder paths end with "/"
		  // - root is "/"
		  
		  Var p As String = path.Trim
		  If p = "" Then Return "/"
		  
		  If Not p.BeginsWith("/") Then p = "/" + p
		  
		  // Collapse double slashes (basic)
		  While p.IndexOf("//") >= 0
		    p = p.ReplaceAll("//", "/")
		  Wend
		  
		  If p <> "/" And Not p.EndsWith("/") Then p = p + "/"
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Upload()
		    // Optional: implement later (WebDAV PUT)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AppPassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BaseDav As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BaseWeb As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
		#tag ViewProperty
			Name="BaseWeb"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BaseDav"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AppPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
