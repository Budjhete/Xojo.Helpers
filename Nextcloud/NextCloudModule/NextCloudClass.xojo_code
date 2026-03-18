#tag Class
Protected Class NextCloudClass
	#tag Method, Flags = &h0
		Function BuildFilesWebURL(remotePath As String) As String
		  // Builds a human-friendly Nextcloud Files URL that stays
		  // compatible with instances that still require /index.php.
		  
		  Var rp As String = NormalizeRemotePath(remotePath)
		  If rp.EndsWith("/") And rp.Length > 1 Then rp = rp.Left(rp.Length - 1)
		  
		  Var base As String = BuildBaseRoot()
		  If base = "" Then Return ""
		  
		  Return base + "/index.php/apps/files/?dir=" + rp.URLEncode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildBaseRoot() As String
		  Var base As String = NormalizeBaseWeb(BaseWeb)
		  If base.Trim = "" Then Return ""
		  
		  Var indexphp As String = "/index.php"
		  If base.EndsWith(indexphp) Then base = base.Left(base.Length - indexphp.Length)
		  If base.EndsWith("/") Then base = base.Left(base.Length - 1)
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildFileWebURL(remoteFile As String, pFileId As String = "") As String
		  Var base As String = BuildBaseRoot()
		  Var rf As String = remoteFile.Trim
		  If base = "" Or rf = "" Then Return ""
		  
		  rf = rf.ReplaceAll("\\", "/")
		  If Not rf.BeginsWith("/") Then rf = "/" + rf
		  If rf.Length > 1 And rf.EndsWith("/") Then rf = rf.Left(rf.Length - 1)
		  
		  Var parts() As String = rf.Split("/")
		  Var startIndex As Integer = 0
		  If parts.Count > 0 And parts(0) = "" Then startIndex = 1
		  If parts.LastIndex < startIndex Then Return ""
		  
		  Var fileName As String = parts(parts.LastIndex)
		  Var dirPath As String = "/"
		  If parts.LastIndex > startIndex Then
		    dirPath = ""
		    For i As Integer = startIndex To parts.LastIndex - 1
		      dirPath = dirPath + "/" + parts(i)
		    Next
		  End If
		  If dirPath = "" Then dirPath = "/"
		  
		  If pFileId.Trim <> "" Then
		    Return base + "/index.php/apps/files/files/" + pFileId.Trim + "?dir=" + EncodeURLComponent(dirPath) + "&openfile=true"
		  End If
		  
		  Return base + "/index.php/apps/files/?dir=" + EncodeURLComponent(dirPath) + "&openfile=" + EncodeURLComponent(fileName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRemotePathFromLocal(localItem As FolderItem, localBase As FolderItem) As String
		  If localItem = Nil Then Return ""
		  If localBase = Nil Then Return ""
		  
		  Var basePath As String = localBase.NativePath
		  Var localPath As String = localItem.NativePath
		  If basePath.Trim = "" Then Return ""
		  If Not localPath.BeginsWith(basePath) Then Return ""
		  
		  Var relPath As String = localPath.Middle(basePath.Length)
		  relPath = relPath.ReplaceAll("\\", "/")
		  If Not relPath.BeginsWith("/") Then relPath = "/" + relPath
		  
		  Var root As String = NormalizeRemotePath(KanjoRootFolder)
		  If relPath.BeginsWith("/") Then relPath = relPath.Middle(1)
		  
		  Var remotePath As String = root + relPath
		  remotePath = NormalizeRemotePath(remotePath)
		  If remotePath.Length > 1 And remotePath.EndsWith("/") Then remotePath = remotePath.Left(remotePath.Length - 1)
		  
		  Return remotePath
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
		Function EncodeRemotePathForDav(path As String) As String
		  // Encodes each path segment but keeps "/" separators intact.
		  
		  Var p As String = path.Trim
		  If p = "" Then Return ""
		  
		  Var hasLeading As Boolean = p.BeginsWith("/")
		  Var hasTrailing As Boolean = (p.EndsWith("/") And p.Length > 1)
		  
		  If hasLeading Then p = p.Middle(1)
		  If hasTrailing Then p = p.Left(p.Length - 1)
		  
		  Var parts() As String = p.Split("/")
		  Var encodedParts() As String
		  For Each part As String In parts
		    If part = "" Then Continue
		    encodedParts.Add(EncodeURLComponent(part))
		  Next
		  
		  Var encoded As String = String.FromArray(encodedParts, "/")
		  If hasLeading Then encoded = "/" + encoded
		  If hasTrailing Then encoded = encoded + "/"
		  
		  If encoded = "" And hasLeading Then encoded = "/"
		  Return encoded
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Exists()
		  // Optional: implement later (WebDAV PROPFIND Depth:0 or HEAD)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchFileId(remotePath As String) As String
		  // Returns oc:fileid for a file path via WebDAV PROPFIND Depth:0
		  
		  Var rp As String = remotePath.Trim
		  If rp = "" Then Return ""
		  
		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend
		  
		  If Username.Trim = "" Or AppPassword.Trim = "" Then Return ""
		  If BaseDav.Trim = "" Then Return ""
		  
		  Var base As String = BaseDav.Trim
		  If Not base.EndsWith("/") Then base = base + "/"
		  
		  Var rpEncoded As String = EncodeRemotePathForDav(rp)
		  Var url As String = base + rpEncoded.Middle(1)
		  
		  Var body As String = _
		  "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine + _
		  "<d:propfind xmlns:d=""DAV:"" xmlns:oc=""http://owncloud.org/ns"">" + EndOfLine + _
		  "  <d:prop>" + EndOfLine + _
		  "    <oc:fileid/>" + EndOfLine + _
		  "  </d:prop>" + EndOfLine + _
		  "</d:propfind>"
		  
		  Var u As New URLConnection
		  u.RequestHeader("Depth") = "0"
		  u.RequestHeader("Content-Type") = "application/xml; charset=utf-8"
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  
		  Var auth As String = EncodeBase64(Username + ":" + AppPassword, 0)
		  u.RequestHeader("Authorization") = "Basic " + auth
		  u.SetRequestContent(body, "application/xml; charset=utf-8")
		  
		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 30)
		  Catch e As RuntimeException
		    Return ""
		  End Try
		  
		  If response.Trim = "" Then Return ""
		  If Not response.Trim.BeginsWith("<") Then Return ""
		  
		  Var x As New XmlDocument
		  Try
		    x.LoadXml(response)
		  Catch
		    Return ""
		  End Try
		  
		  Var root As XmlNode = x.DocumentElement
		  If root Is Nil Then Return ""
		  
		  For i As Integer = 0 To root.ChildCount - 1
		    Var resp As XmlNode = root.Child(i)
		    If resp Is Nil Or resp.LocalName <> "response" Then Continue
		    
		    For j As Integer = 0 To resp.ChildCount - 1
		      Var n As XmlNode = resp.Child(j)
		      If n Is Nil Or n.LocalName <> "propstat" Then Continue
		      
		      For k As Integer = 0 To n.ChildCount - 1
		        Var ps As XmlNode = n.Child(k)
		        If ps Is Nil Or ps.LocalName <> "prop" Then Continue
		        
		        For m As Integer = 0 To ps.ChildCount - 1
		          Var p As XmlNode = ps.Child(m)
		          If p Is Nil Then Continue
		          
		          If p.LocalName = "fileid" And p.FirstChild <> Nil Then
		            Return p.FirstChild.Value
		          End If
		        Next
		      Next
		    Next
		  Next
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchLibreSignEntries(pUuid as String, pFileId as String, ByRef pContent as String) As Dictionary()
		  dim entries() as Dictionary
		  pContent = ""
		  
		  if pUuid.Trim = "" then Return entries
		  if BaseWeb.Trim = "" or Username.Trim = "" or AppPassword.Trim = "" then Return entries
		  
		  dim baseRoot as String = BuildBaseRoot()
		  if baseRoot.Trim = "" then Return entries
		  
		  dim conn as new URLConnection
		  conn.RequestHeader("Authorization") = "Basic " + EncodeBase64(Username+":"+AppPassword, 0)
		  conn.RequestHeader("OCS-APIRequest") = "true"
		  conn.RequestHeader("Accept") = "application/json"
		  
		  dim url as String = baseRoot + "/ocs/v2.php/apps/libresign/api/v1/file/progress/" + EncodeURLComponent(pUuid)
		  dim content as String
		  try
		    content = conn.SendSync("GET", url, 30)
		  catch e as RuntimeException
		    pContent = "LibreSign status: erreur de connexion"
		    Return entries
		  end try
		  
		  if conn.HTTPStatusCode < 200 or conn.HTTPStatusCode >= 300 then
		    pContent = "LibreSign status HTTP " + conn.HTTPStatusCode.ToString + ": " + content
		    Return entries
		  end if
		  
		  dim resp as Dictionary
		  try
		    resp = ParseJSON(content)
		  catch InvalidJSONException
		    pContent = "LibreSign status: réponse invalide"
		    Return entries
		  end try
		  
		  dim dataVar as Variant
		  if resp <> nil and resp.HasKey("ocs") then
		    try
		      dim ocs as Dictionary = Dictionary(resp.Value("ocs"))
		      dataVar = ocs.Lookup("data", Nil)
		    catch
		      dataVar = Nil
		    end try
		  else
		    dataVar = resp.Lookup("data", resp)
		  end if
		  
		  entries = LibreSignExtractEntries(dataVar)
		  pContent = content
		  
		  if entries.LastIndex >= 0 then Return entries
		  
		  dim fallbackContent as String
		  dim fallbackUrl as String = baseRoot + "/ocs/v2.php/apps/libresign/api/v1/file/validate/uuid/" + EncodeURLComponent(pUuid)
		  dim fallbackEntries() as Dictionary = LibreSignFetchEntries(fallbackUrl, fallbackContent)
		  if fallbackEntries.LastIndex >= 0 then
		    pContent = fallbackContent
		    Return fallbackEntries
		  end if
		  
		  if pFileId.Trim <> "" then
		    dim fallbackContent2 as String
		    dim fallbackUrl2 as String = baseRoot + "/ocs/v2.php/apps/libresign/api/v1/file/validate/file_id/" + EncodeURLComponent(pFileId)
		    dim fallbackEntries2() as Dictionary = LibreSignFetchEntries(fallbackUrl2, fallbackContent2)
		    if fallbackEntries2.LastIndex >= 0 then
		      pContent = fallbackContent2
		      Return fallbackEntries2
		    end if
		  end if
		  
		  Return entries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchLibreSignStatus(pUuid as String) As String
		  Return FetchLibreSignStatus(pUuid, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchLibreSignStatus(pUuid as String, pFileId as String) As String
		  dim content as String
		  dim entries() as Dictionary = FetchLibreSignEntries(pUuid, pFileId, content)
		  dim lines() as String = LibreSignBuildStatusLines(entries)
		  
		  if lines.LastIndex >= 0 then Return lines(0)
		  Return content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibreSignBuildStatusLines(entries() as Dictionary) As String()
		  dim lines() as String
		  
		  for each d as Dictionary in entries
		    dim email as String = d.Lookup("email", d.Lookup("identifier", "")).StringValue
		    dim name as String = d.Lookup("displayName", d.Lookup("display_name", d.Lookup("name", ""))).StringValue
		    dim status as String = d.Lookup("status", d.Lookup("state", d.Lookup("signed", ""))).StringValue
		    dim line as String = ""
		    
		    if name.Trim <> "" then line = name
		    if email.Trim <> "" then
		      if line.Trim <> "" then line = line + " "
		      line = line + "<" + email + ">"
		    end if
		    if status.Trim <> "" then
		      if line.Trim <> "" then line = line + " - "
		      line = line + status
		    end if
		    
		    if line.Trim <> "" then lines.Add(line)
		  next
		  
		  Return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchNextcloudCurrentUserDisplayName() As String
		  if BaseWeb.Trim = "" or Username.Trim = "" or AppPassword.Trim = "" then Return ""
		  
		  dim conn as new URLConnection
		  conn.RequestHeader("Authorization") = "Basic " + EncodeBase64(Username+":"+AppPassword, 0)
		  conn.RequestHeader("OCS-APIRequest") = "true"
		  conn.RequestHeader("Accept") = "application/json"
		  
		  dim url as String = BaseWeb.Trim
		  if url.EndsWith("/") then url = url.Left(url.Length-1)
		  url = url + "/ocs/v2.php/cloud/user"
		  
		  dim content as String
		  try
		    content = conn.SendSync("GET", url, 30)
		  catch
		    Return ""
		  end try
		  
		  if conn.HTTPStatusCode < 200 or conn.HTTPStatusCode >= 300 then Return ""
		  
		  dim resp as Dictionary
		  try
		    resp = ParseJSON(content)
		  catch
		    Return ""
		  end try
		  
		  dim data as Dictionary
		  if resp <> nil and resp.HasKey("ocs") then
		    try
		      dim ocs as Dictionary = Dictionary(resp.Value("ocs"))
		      data = Dictionary(ocs.Lookup("data", Nil))
		    catch
		      data = Nil
		    end try
		  else
		    try
		      data = Dictionary(resp.Lookup("data", resp))
		    catch
		      data = Nil
		    end try
		  end if
		  
		  if data = nil then Return ""
		  dim dn as String = data.Lookup("displayname", "").StringValue.Trim
		  if dn = "" then dn = data.Lookup("displayName", "").StringValue.Trim
		  return dn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchNextcloudCurrentUserEmail() As String
		  if BaseWeb.Trim = "" or Username.Trim = "" or AppPassword.Trim = "" then Return ""
		  
		  dim conn as new URLConnection
		  conn.RequestHeader("Authorization") = "Basic " + EncodeBase64(Username+":"+AppPassword, 0)
		  conn.RequestHeader("OCS-APIRequest") = "true"
		  conn.RequestHeader("Accept") = "application/json"
		  
		  dim url as String = BaseWeb.Trim
		  if url.EndsWith("/") then url = url.Left(url.Length-1)
		  url = url + "/ocs/v2.php/cloud/user"
		  
		  dim content as String
		  try
		    content = conn.SendSync("GET", url, 30)
		  catch
		    Return ""
		  end try
		  
		  if conn.HTTPStatusCode < 200 or conn.HTTPStatusCode >= 300 then Return ""
		  
		  dim resp as Dictionary
		  try
		    resp = ParseJSON(content)
		  catch
		    Return ""
		  end try
		  
		  dim data as Dictionary
		  if resp <> nil and resp.HasKey("ocs") then
		    try
		      dim ocs as Dictionary = Dictionary(resp.Value("ocs"))
		      data = Dictionary(ocs.Lookup("data", Nil))
		    catch
		      data = Nil
		    end try
		  else
		    try
		      data = Dictionary(resp.Lookup("data", resp))
		    catch
		      data = Nil
		    end try
		  end if
		  
		  if data = nil then Return ""
		  return data.Lookup("email", "").StringValue.Trim
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibreSignExtractEntries(dataVar as Variant) As Dictionary()
		  dim entries() as Dictionary
		  dim dd as Dictionary
		  try
		    dd = Dictionary(dataVar)
		  catch
		    dd = Nil
		  end try
		  
		  dim arrVar as Variant
		  if dd <> nil then
		    if dd.HasKey("signers") then
		      arrVar = dd.Value("signers")
		    elseif dd.HasKey("users") then
		      arrVar = dd.Value("users")
		    elseif dd.HasKey("signRequests") then
		      arrVar = dd.Value("signRequests")
		    elseif dd.HasKey("sign_requests") then
		      arrVar = dd.Value("sign_requests")
		    end if
		  end if
		  
		  if arrVar <> Nil then
		    dim arr() as Variant
		    try
		      arr = arrVar
		      for each v as Variant in arr
		        if v IsA Dictionary then entries.Add(Dictionary(v))
		      next
		    catch
		    end try
		  else
		    dim arr() as Variant
		    try
		      arr = dataVar
		      for each v as Variant in arr
		        if v IsA Dictionary then entries.Add(Dictionary(v))
		      next
		    catch
		    end try
		  end if
		  
		  Return entries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibreSignFetchEntries(pUrl as String, ByRef pContent as String) As Dictionary()
		  dim entries() as Dictionary
		  pContent = ""
		  
		  if pUrl.Trim = "" then Return entries
		  
		  dim conn as new URLConnection
		  conn.RequestHeader("Authorization") = "Basic " + EncodeBase64(Username+":"+AppPassword, 0)
		  conn.RequestHeader("OCS-APIRequest") = "true"
		  conn.RequestHeader("Accept") = "application/json"
		  
		  try
		    pContent = conn.SendSync("GET", pUrl, 30)
		  catch
		    Return entries
		  end try
		  
		  if conn.HTTPStatusCode < 200 or conn.HTTPStatusCode >= 300 then Return entries
		  
		  dim resp as Dictionary
		  try
		    resp = ParseJSON(pContent)
		  catch
		    Return entries
		  end try
		  
		  dim dataVar as Variant
		  if resp <> nil and resp.HasKey("ocs") then
		    try
		      dim ocs as Dictionary = Dictionary(resp.Value("ocs"))
		      dataVar = ocs.Lookup("data", Nil)
		    catch
		      dataVar = Nil
		    end try
		  else
		    dataVar = resp.Lookup("data", resp)
		  end if
		  
		  entries = LibreSignExtractEntries(dataVar)
		  Return entries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LibreSignFetchIdentifyMethods(ByRef pRaw as String) As String()
		  dim methods() as String
		  pRaw = ""
		  
		  if BaseWeb.Trim = "" or Username.Trim = "" or Username.Trim = "" then Return methods
		  
		  dim conn as new URLConnection
		  conn.RequestHeader("Authorization") = "Basic " + EncodeBase64(Username+":"+AppPassword, 0)
		  conn.RequestHeader("OCS-APIRequest") = "true"
		  conn.RequestHeader("Accept") = "application/json"
		  
		  dim url as String = BaseWeb.Trim
		  if url.EndsWith("/") then url = url.Left(url.Length-1)
		  url = url + "/ocs/v2.php/apps/libresign/api/v1/admin/signature-settings"
		  
		  dim content as String
		  try
		    content = conn.SendSync("GET", url, 30)
		  catch
		    Return methods
		  end try
		  
		  pRaw = content
		  if conn.HTTPStatusCode < 200 or conn.HTTPStatusCode >= 300 then Return methods
		  
		  dim resp as Dictionary
		  try
		    resp = ParseJSON(content)
		  catch
		    Return methods
		  end try
		  
		  dim dataVar as Variant
		  if resp <> nil and resp.HasKey("ocs") then
		    try
		      dim ocs as Dictionary = Dictionary(resp.Value("ocs"))
		      dataVar = ocs.Lookup("data", Nil)
		    catch
		      dataVar = Nil
		    end try
		  else
		    dataVar = resp.Lookup("data", resp)
		  end if
		  
		  dim dd as Dictionary
		  try
		    dd = Dictionary(dataVar)
		  catch
		    dd = Nil
		  end try
		  if dd = Nil then Return methods
		  
		  dim rawIdentify as Variant
		  if dd.HasKey("identify_method") then
		    rawIdentify = dd.Value("identify_method")
		  elseif dd.HasKey("identifyMethod") then
		    rawIdentify = dd.Value("identifyMethod")
		  elseif dd.HasKey("identify_methods") then
		    rawIdentify = dd.Value("identify_methods")
		  elseif dd.HasKey("identifyMethods") then
		    rawIdentify = dd.Value("identifyMethods")
		  end if
		  
		  if rawIdentify = Nil then Return methods
		  
		  try
		    dim arr() as Variant = rawIdentify
		    for each v as Variant in arr
		      dim s as String = v.StringValue.Trim
		      if s <> "" then methods.Add(s)
		    next
		    if methods.LastIndex >= 0 then Return methods
		  catch
		  end try
		  
		  dim sRaw as String = rawIdentify.StringValue.Trim
		  if sRaw = "" then Return methods
		  
		  if sRaw.Left(1) = "[" then
		    try
		      dim vParsed as Variant = ParseJSON(sRaw)
		      dim arr2() as Variant = vParsed
		      for each v as Variant in arr2
		        dim s as String = v.StringValue.Trim
		        if s <> "" then methods.Add(s)
		      next
		    catch
		    end try
		  else
		    dim parts() as String = sRaw.Split(",")
		    for each p as String in parts
		      dim s as String = p.Trim
		      if s <> "" then methods.Add(s)
		    next
		  end if
		  
		  Return methods
		End Function
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
		  Var rpEncoded As String = EncodeRemotePathForDav(rp)
		  Var url As String = base + rpEncoded.Middle(1)
		  
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
		Function NormalizeBaseWeb(base As String) As String
		  // Ensures:
		  // - trims trailing "/"
		  // - removes any trailing "/apps/files" (including duplicates)
		  
		  Var b As String = base.Trim
		  If b = "" Then Return ""
		  
		  Var changed As Boolean
		  Do
		    changed = False
		    
		    If b.EndsWith("/") Then
		      b = b.Left(b.Length - 1)
		      changed = True
		    End If
		    
		    If b.EndsWith("/apps/files/files") Then
		      dim appsfiles as string = "/apps/files/files"
		      b = b.Left(b.Length - appsfiles.Length)
		      changed = True
		    ElseIf b.EndsWith("/apps/files") Then
		      dim appsfiles as string = "/apps/files"
		      b = b.Left(b.Length - appsfiles.Length)
		      changed = True
		    End If
		  Loop Until Not changed
		  
		  Return b
		End Function
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
		KanjoRootFolder As String
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
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AppPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
