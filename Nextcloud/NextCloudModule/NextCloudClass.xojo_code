#tag Class
Protected Class NextCloudClass
	#tag Method, Flags = &h0
		Function ArchiveLocalItemOnServer(localItem As FolderItem, localBase As FolderItem, ByRef pResult As Dictionary, activeRootName As String = "Fichiers", archiveRootName As String = "Archives") As Boolean
		  Return MoveLocalItemOnServer(localItem, localBase, activeRootName, archiveRootName, pResult, "archive")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ArchiveRelativePathOnServer(relativePath As String, ByRef pResult As Dictionary, activeRootName As String = "Fichiers", archiveRootName As String = "Archives") As Boolean
		  Return MoveRelativePathOnServer(relativePath, activeRootName, archiveRootName, pResult, "archive")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildAuthorizationHeaderValue() As String
		  If Username.Trim = "" Or AppPassword.Trim = "" Then Return ""
		  Return "Basic " + EncodeBase64(Username + ":" + AppPassword, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildDavUrl(remotePath As String) As String
		  Var base As String = BaseDav.Trim
		  If base = "" Then
		    Var baseRoot As String = BuildBaseRoot()
		    If baseRoot.Trim <> "" And Username.Trim <> "" Then
		      base = baseRoot + "/remote.php/dav/files/" + Username + "/"
		    End If
		  End If
		  
		  If base.Trim = "" Then Return ""
		  If Not base.EndsWith("/") Then base = base + "/"
		  
		  Var rp As String = remotePath.Trim
		  If rp = "" Then Return ""
		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend
		  
		  Var encoded As String = EncodeRemotePathForDav(rp)
		  If encoded.BeginsWith("/") Then encoded = encoded.Middle(1)
		  
		  Return base + encoded
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRelativePathFromLocal(localItem As FolderItem, localBase As FolderItem) As String
		  If localItem = Nil Then Return ""
		  If localBase = Nil Then Return ""
		  
		  Var basePath As String = localBase.NativePath
		  Var localPath As String = localItem.NativePath
		  If basePath.Trim = "" Then Return ""
		  If Not localPath.BeginsWith(basePath) Then Return ""
		  
		  Var relPath As String = localPath.Middle(basePath.Length)
		  relPath = relPath.ReplaceAll("\\", "/")
		  If relPath = "" Then relPath = "/"
		  If Not relPath.BeginsWith("/") Then relPath = "/" + relPath
		  
		  While relPath.IndexOf("//") >= 0
		    relPath = relPath.ReplaceAll("//", "/")
		  Wend
		  
		  If relPath.Length > 1 And relPath.EndsWith("/") Then
		    relPath = relPath.Left(relPath.Length - 1)
		  End If
		  
		  Return relPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildRemotePathFromRelative(relativePath As String) As String
		  Var root As String = NormalizeRemotePath(KanjoRootFolder)
		  If root.Trim = "" Then Return ""
		  
		  Var relPath As String = relativePath.Trim
		  If relPath = "" Or relPath = "/" Then
		    If root <> "/" And root.EndsWith("/") Then
		      Return root.Left(root.Length - 1)
		    End If
		    Return root
		  End If
		  
		  If relPath.BeginsWith("/") Then relPath = relPath.Middle(1)
		  
		  Var remotePath As String = root + relPath
		  While remotePath.IndexOf("//") >= 0
		    remotePath = remotePath.ReplaceAll("//", "/")
		  Wend
		  
		  If remotePath.Length > 1 And remotePath.EndsWith("/") Then
		    remotePath = remotePath.Left(remotePath.Length - 1)
		  End If
		  
		  Return remotePath
		End Function
	#tag EndMethod

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
		  Var relPath As String = BuildRelativePathFromLocal(localItem, localBase)
		  If relPath = "" Then Return ""
		  
		  Return BuildRemotePathFromRelative(relPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Configure(baseWebURL As String, usernameValue As String, appPasswordValue As String, rootFolderValue As String, ByRef pMessage As String) As Boolean
		  pMessage = ""

		  BaseWeb = NormalizeBaseWeb(baseWebURL)
		  Username = usernameValue.Trim
		  AppPassword = appPasswordValue
		  KanjoRootFolder = rootFolderValue.Trim

		  If BaseWeb.Trim = "" Or Username.Trim = "" Or AppPassword.Trim = "" Or KanjoRootFolder.Trim = "" Then
		    pMessage = "Nextcloud: configuration incomplete."
		    BaseDav = ""
		    Return False
		  End If

		  Var baseRoot As String = BuildBaseRoot()
		  If baseRoot.Trim = "" Then
		    pMessage = "Nextcloud: URL invalide."
		    BaseDav = ""
		    Return False
		  End If

		  BaseDav = baseRoot + "/remote.php/dav/files/" + Username + "/"
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete(remotePath As String, ByRef pMessage As String) As Boolean
		  pMessage = ""
		  
		  Var url As String = BuildDavUrl(remotePath)
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If url = "" Or authHeader = "" Then
		    pMessage = "Nextcloud DELETE: configuration invalide."
		    Return False
		  End If
		  
		  Var u As New URLConnection
		  u.RequestHeader("Authorization") = authHeader
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  
		  Var response As String
		  Try
		    response = u.SendSync("DELETE", url, 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud DELETE: " + e.Message
		    Return False
		  End Try
		  
		  Select Case u.HTTPStatusCode
		  Case 200, 204, 404
		    // ok or already absent
		  Else
		    pMessage = "Nextcloud DELETE HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select
		  
		  Dim httpStatus As Integer
		  Dim fileId As String
		  Dim existsMessage As String
		  If Exists(remotePath, httpStatus, fileId, existsMessage) Then
		    pMessage = "Nextcloud DELETE: la ressource existe encore après suppression."
		    Return False
		  End If
		  
		  If httpStatus <> 404 And existsMessage.Trim <> "" Then
		    pMessage = "Nextcloud DELETE: vérification distante impossible. " + existsMessage
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Download()
		  // Optional: implement later (WebDAV GET)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DownloadFile(remotePath As String, destination As FolderItem, ByRef pMessage As String) As Boolean
		  pMessage = ""

		  If destination = Nil Then
		    pMessage = "Nextcloud DOWNLOAD: destination invalide."
		    Return False
		  End If

		  Var url As String = BuildDavUrl(remotePath)
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If url = "" Or authHeader = "" Then
		    pMessage = "Nextcloud DOWNLOAD: configuration invalide."
		    Return False
		  End If

		  Var u As New URLConnection
		  u.RequestHeader("Authorization") = authHeader
		  u.RequestHeader("User-Agent") = "Kanjo/1.0"

		  Var response As String
		  Try
		    response = u.SendSync("GET", url, 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud DOWNLOAD: " + e.Message
		    Return False
		  End Try

		  Select Case u.HTTPStatusCode
		  Case 200
		    // ok
		  Case 401, 403
		    pMessage = "Nextcloud DOWNLOAD: acces refuse."
		    Return False
		  Case 404
		    pMessage = "Nextcloud DOWNLOAD: fichier introuvable."
		    Return False
		  Else
		    pMessage = "Nextcloud DOWNLOAD HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select

		  Try
		    Var output As BinaryStream = BinaryStream.Create(destination, True)
		    output.Write(response)
		    output.Close
		  Catch e As RuntimeException
		    pMessage = "Nextcloud DOWNLOAD: " + e.Message
		    Return False
		  End Try

		  Return True
		End Function
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function Exists(remotePath As String, ByRef pHttpStatus As Integer, ByRef pFileId As String, ByRef pMessage As String) As Boolean
		  pHttpStatus = 0
		  pFileId = ""
		  pMessage = ""
		  
		  Var rp As String = remotePath.Trim
		  If rp = "" Then
		    pMessage = "Nextcloud EXISTS: chemin distant vide."
		    Return False
		  End If
		  
		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend
		  
		  Var url As String = BuildDavUrl(rp)
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If url = "" Or authHeader = "" Then
		    pMessage = "Nextcloud EXISTS: configuration invalide."
		    Return False
		  End If
		  
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
		  u.RequestHeader("Authorization") = authHeader
		  u.SetRequestContent(body, "application/xml; charset=utf-8")
		  
		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 30)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud EXISTS: " + e.Message
		    Return False
		  End Try
		  
		  pHttpStatus = u.HTTPStatusCode
		  Select Case pHttpStatus
		  Case 200, 207
		    // continue
		  Case 401, 403
		    pMessage = "Nextcloud EXISTS: accès refusé."
		    Return False
		  Case 404
		    Return False
		  Else
		    pMessage = "Nextcloud EXISTS HTTP " + pHttpStatus.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select
		  
		  If response.Trim = "" Or Not response.Trim.BeginsWith("<") Then
		    // Some servers may answer 207 without fileid payload.
		    Return True
		  End If
		  
		  Var x As New XmlDocument
		  Try
		    x.LoadXml(response)
		  Catch
		    Return True
		  End Try
		  
		  Var root As XmlNode = x.DocumentElement
		  If root Is Nil Then Return True
		  
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
		            pFileId = p.FirstChild.Value
		            Return True
		          End If
		        Next
		      Next
		    Next
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Function Exists(remotePath As String, ByRef pHttpStatus As Integer, ByRef pFileId As String, ByRef pMessage As String) As Boolean
		  pHttpStatus = 0
		  pFileId = ""
		  pMessage = ""

		  Var rp As String = remotePath.Trim
		  If rp = "" Then
		    pMessage = "Nextcloud EXISTS: chemin distant vide."
		    Return False
		  End If

		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend

		  Var url As String = BuildDavUrl(rp)
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If url = "" Or authHeader = "" Then
		    pMessage = "Nextcloud EXISTS: configuration invalide."
		    Return False
		  End If

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
		  u.RequestHeader("Authorization") = authHeader
		  u.SetRequestContent(body, "application/xml; charset=utf-8")

		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 30)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud EXISTS: " + e.Message
		    Return False
		  End Try

		  pHttpStatus = u.HTTPStatusCode
		  Select Case pHttpStatus
		  Case 200, 207
		    // continue
		  Case 401, 403
		    pMessage = "Nextcloud EXISTS: accès refusé."
		    Return False
		  Case 404
		    Return False
		  Else
		    pMessage = "Nextcloud EXISTS HTTP " + pHttpStatus.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select

		  If response.Trim = "" Or Not response.Trim.BeginsWith("<") Then
		    // Some servers may answer 207 without fileid payload.
		    Return True
		  End If

		  Var responses() As String = WebDavResponseBlocks(response)
		  If responses.LastIndex >= 0 Then
		    For Each resp As String In responses
		      pFileId = WebDavTagValue(resp, "fileid")
		      If pFileId.Trim <> "" Then Return True
		    Next
		  Else
		    pFileId = WebDavTagValue(response, "fileid")
		    If pFileId.Trim <> "" Then Return True
		  End If

		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FetchFileId(remotePath As String) As String
		  // Returns oc:fileid for a file path via WebDAV PROPFIND Depth:0
		  
		  Var httpStatus As Integer
		  Var fileId As String
		  Var message As String
		  Call Exists(remotePath, httpStatus, fileId, message)
		  Return fileId
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
		Function FindChildEntryByCandidateNames(remoteParentPath As String, pCandidateNames() As String, ByRef pEntry As Dictionary, ByRef pMessage As String) As Boolean
		  pEntry = Nil
		  pMessage = ""
		  
		  Dim pCandidates As New Dictionary
		  For Each pCandidateName As String In pCandidateNames
		    Dim pNormalized As String = pCandidateName.Trim.Lowercase
		    If pNormalized = "" Then Continue
		    pCandidates.Value(pNormalized) = True
		  Next
		  
		  If pCandidates.KeyCount = 0 Then Return False
		  
		  Dim pEntries() As Dictionary = ListEntries(remoteParentPath, pMessage)
		  If pEntries.LastIndex < 0 Then Return False
		  
		  For Each pChildEntry As Dictionary In pEntries
		    If pChildEntry = Nil Then Continue
		    Dim pName As String = pChildEntry.Lookup("name", "").StringValue.Trim.Lowercase
		    If pName = "" Then Continue
		    If pCandidates.HasKey(pName) Then
		      pEntry = pChildEntry
		      Return True
		    End If
		  Next
		  
		  Return False
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
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
		        If n.FirstChild <> Nil Then
		          href = n.FirstChild.Value
		          href = href.ReplaceAll("+", "%20")
		          Try
		            href = DecodeURLComponent(href)
		          Catch
		          End Try
		        End If
		        
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Function ListFolders(remotePath As String) As NcFolderEntry()
		  // Lists sub-folders in remotePath using the Android-compatible ListEntries parser.

		  Var out() As NcFolderEntry
		  Var message As String
		  Var entries() As Dictionary = ListEntries(remotePath, message)
		  For Each entry As Dictionary In entries
		    If entry = Nil Then Continue
		    If Not entry.Lookup("is_folder", False).BooleanValue Then Continue

		    Var e As NcFolderEntry
		    e.Name = entry.Lookup("name", "").StringValue
		    e.RemotePath = entry.Lookup("remote_path", "").StringValue
		    out.Add(e)
		  Next

		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function ListEntries(remotePath As String, ByRef pMessage As String) As Dictionary()
		  // Lists files and folders in remotePath using WebDAV PROPFIND Depth: 1
		  // Returns dictionaries with: name, remote_path, parent_remote_path,
		  // is_folder, file_id, content_type, open_url
		  
		  Var out() As Dictionary
		  pMessage = ""
		  
		  Var rp As String = NormalizeRemotePath(remotePath)
		  If Username.Trim = "" Or AppPassword.Trim = "" Then
		    pMessage = "Nextcloud LIST: identifiants manquants."
		    Return out
		  End If
		  
		  If BaseDav.Trim = "" Then
		    pMessage = "Nextcloud LIST: BaseDav manquante."
		    Return out
		  End If
		  
		  Var base As String = BaseDav.Trim
		  If Not base.EndsWith("/") Then base = base + "/"
		  
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If authHeader = "" Then
		    pMessage = "Nextcloud LIST: configuration invalide."
		    Return out
		  End If
		  
		  Var rpEncoded As String = EncodeRemotePathForDav(rp)
		  Var url As String = base + rpEncoded.Middle(1)
		  
		  Var body As String = _
		  "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine + _
		  "<d:propfind xmlns:d=""DAV:"" xmlns:oc=""http://owncloud.org/ns"">" + EndOfLine + _
		  "  <d:prop>" + EndOfLine + _
		  "    <d:resourcetype/>" + EndOfLine + _
		  "    <d:displayname/>" + EndOfLine + _
		  "    <d:getcontenttype/>" + EndOfLine + _
		  "    <oc:fileid/>" + EndOfLine + _
		  "  </d:prop>" + EndOfLine + _
		  "</d:propfind>"
		  
		  Var u As New URLConnection
		  u.RequestHeader("Depth") = "1"
		  u.RequestHeader("Content-Type") = "application/xml; charset=utf-8"
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  u.RequestHeader("Authorization") = authHeader
		  u.SetRequestContent(body, "application/xml; charset=utf-8")
		  
		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud LIST: " + e.Message
		    Return out
		  End Try
		  
		  Select Case u.HTTPStatusCode
		  Case 200, 207
		    // ok
		  Case 404
		    Return out
		  Case 401, 403
		    pMessage = "Nextcloud LIST: accès refusé."
		    Return out
		  Else
		    pMessage = "Nextcloud LIST HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return out
		  End Select
		  
		  If response.Trim = "" Or Not response.Trim.BeginsWith("<") Then Return out
		  
		  Var x As New XmlDocument
		  Try
		    x.LoadXml(response)
		  Catch
		    pMessage = "Nextcloud LIST: réponse XML invalide."
		    Return out
		  End Try
		  
		  Var marker As String = "/remote.php/dav/files/" + Username
		  Var root As XmlNode = x.DocumentElement
		  If root Is Nil Then Return out
		  
		  For i As Integer = 0 To root.ChildCount - 1
		    Var resp As XmlNode = root.Child(i)
		    If resp Is Nil Or resp.LocalName <> "response" Then Continue
		    
		    Var href As String
		    Var display As String
		    Var fileId As String
		    Var contentType As String
		    Var isCollection As Boolean
		    
		    For j As Integer = 0 To resp.ChildCount - 1
		      Var n As XmlNode = resp.Child(j)
		      If n Is Nil Then Continue
		      
		      Select Case n.LocalName
		      Case "href"
		        If n.FirstChild <> Nil Then
		          href = n.FirstChild.Value
		          href = href.ReplaceAll("+", "%20")
		          Try
		            href = DecodeURLComponent(href)
		          Catch
		          End Try
		        End If
		        
		      Case "propstat"
		        For k As Integer = 0 To n.ChildCount - 1
		          Var ps As XmlNode = n.Child(k)
		          If ps Is Nil Or ps.LocalName <> "prop" Then Continue
		          
		          For m As Integer = 0 To ps.ChildCount - 1
		            Var p As XmlNode = ps.Child(m)
		            If p Is Nil Then Continue
		            
		            Select Case p.LocalName
		            Case "displayname"
		              If p.FirstChild <> Nil Then display = p.FirstChild.Value
		              
		            Case "resourcetype"
		              For t As Integer = 0 To p.ChildCount - 1
		                Var c As XmlNode = p.Child(t)
		                If c <> Nil And c.LocalName = "collection" Then
		                  isCollection = True
		                  Exit
		                End If
		              Next
		              
		            Case "fileid"
		              If p.FirstChild <> Nil Then fileId = p.FirstChild.Value
		              
		            Case "getcontenttype"
		              If p.FirstChild <> Nil Then contentType = p.FirstChild.Value
		            End Select
		          Next
		        Next
		      End Select
		    Next
		    
		    If href.Trim = "" Then Continue
		    
		    Var pos As Integer = href.IndexOf(marker)
		    If pos < 0 Then Continue
		    
		    Var remote As String = href.Middle(pos + marker.Length)
		    If remote.Trim = "" Then remote = "/"
		    If Not remote.BeginsWith("/") Then remote = "/" + remote
		    If isCollection Then
		      If Not remote.EndsWith("/") Then remote = remote + "/"
		    ElseIf remote.Length > 1 And remote.EndsWith("/") Then
		      remote = remote.Left(remote.Length - 1)
		    End If
		    
		    If remote = rp Then Continue
		    
		    Var itemName As String = display.Trim
		    If itemName = "" Then
		      Var remoteName As String = remote
		      If remoteName.Length > 1 And remoteName.EndsWith("/") Then remoteName = remoteName.Left(remoteName.Length - 1)
		      Var remoteParts() As String = remoteName.Split("/")
		      If remoteParts.LastIndex >= 0 Then itemName = remoteParts(remoteParts.LastIndex)
		    End If
		    If itemName.Trim = "" Then Continue
		    
		    Var entry As New Dictionary
		    entry.Value("name") = itemName
		    entry.Value("remote_path") = remote
		    entry.Value("parent_remote_path") = rp
		    entry.Value("is_folder") = isCollection
		    entry.Value("file_id") = fileId
		    entry.Value("content_type") = contentType
		    
		    If isCollection Then
		      entry.Value("open_url") = BuildFilesWebURL(remote)
		    Else
		      entry.Value("open_url") = BuildFileWebURL(remote, fileId)
		    End If
		    
		    out.Add(entry)
		  Next
		  
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Function ListEntries(remotePath As String, ByRef pMessage As String) As Dictionary()
		  // Lists files and folders in remotePath using WebDAV PROPFIND Depth: 1.
		  // Android does not expose XmlDocument/XmlNode, so this variant extracts only the WebDAV fields needed here.

		  Var out() As Dictionary
		  pMessage = ""

		  Var rp As String = NormalizeRemotePath(remotePath)
		  If Username.Trim = "" Or AppPassword.Trim = "" Then
		    pMessage = "Nextcloud LIST: identifiants manquants."
		    Return out
		  End If

		  If BaseDav.Trim = "" Then
		    pMessage = "Nextcloud LIST: BaseDav manquante."
		    Return out
		  End If

		  Var base As String = BaseDav.Trim
		  If Not base.EndsWith("/") Then base = base + "/"

		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If authHeader = "" Then
		    pMessage = "Nextcloud LIST: configuration invalide."
		    Return out
		  End If

		  Var rpEncoded As String = EncodeRemotePathForDav(rp)
		  Var url As String = base + rpEncoded.Middle(1)

		  Var body As String = _
		  "<?xml version=""1.0"" encoding=""utf-8""?>" + EndOfLine + _
		  "<d:propfind xmlns:d=""DAV:"" xmlns:oc=""http://owncloud.org/ns"">" + EndOfLine + _
		  "  <d:prop>" + EndOfLine + _
		  "    <d:resourcetype/>" + EndOfLine + _
		  "    <d:displayname/>" + EndOfLine + _
		  "    <d:getcontenttype/>" + EndOfLine + _
		  "    <oc:fileid/>" + EndOfLine + _
		  "  </d:prop>" + EndOfLine + _
		  "</d:propfind>"

		  Var u As New URLConnection
		  u.RequestHeader("Depth") = "1"
		  u.RequestHeader("Content-Type") = "application/xml; charset=utf-8"
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  u.RequestHeader("Authorization") = authHeader
		  u.SetRequestContent(body, "application/xml; charset=utf-8")

		  Var response As String
		  Try
		    response = u.SendSync("PROPFIND", url, 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud LIST: " + e.Message
		    Return out
		  End Try

		  Select Case u.HTTPStatusCode
		  Case 200, 207
		    // ok
		  Case 404
		    Return out
		  Case 401, 403
		    pMessage = "Nextcloud LIST: accès refusé."
		    Return out
		  Else
		    pMessage = "Nextcloud LIST HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return out
		  End Select

		  If response.Trim = "" Or Not response.Trim.BeginsWith("<") Then Return out

		  Var marker As String = "/remote.php/dav/files/" + Username
		  Var responses() As String = WebDavResponseBlocks(response)
		  If responses.LastIndex < 0 Then
		    pMessage = "Nextcloud LIST: réponse XML invalide."
		    Return out
		  End If

		  For Each resp As String In responses
		    Var href As String = WebDavTagValue(resp, "href")
		    href = href.ReplaceAll("+", "%20")
		    Try
		      href = DecodeURLComponent(href)
		    Catch
		    End Try

		    Var displayName As String = WebDavTagValue(resp, "displayname")
		    Var fileId As String = WebDavTagValue(resp, "fileid")
		    Var contentType As String = WebDavTagValue(resp, "getcontenttype")
		    Var isCollection As Boolean = WebDavHasTag(resp, "collection")

		    If href.Trim = "" Then Continue

		    Var pos As Integer = href.IndexOf(marker)
		    If pos < 0 Then Continue

		    Var remote As String = href.Middle(pos + marker.Length)
		    If remote.Trim = "" Then remote = "/"
		    If Not remote.BeginsWith("/") Then remote = "/" + remote
		    If isCollection Then
		      If Not remote.EndsWith("/") Then remote = remote + "/"
		    ElseIf remote.Length > 1 And remote.EndsWith("/") Then
		      remote = remote.Left(remote.Length - 1)
		    End If

		    If remote = rp Then Continue

		    Var itemName As String = displayName.Trim
		    If itemName = "" Then
		      Var remoteName As String = remote
		      If remoteName.Length > 1 And remoteName.EndsWith("/") Then remoteName = remoteName.Left(remoteName.Length - 1)
		      Var remoteParts() As String = remoteName.Split("/")
		      If remoteParts.LastIndex >= 0 Then itemName = remoteParts(remoteParts.LastIndex)
		    End If
		    If itemName.Trim = "" Then Continue

		    Var entry As New Dictionary
		    entry.Value("name") = itemName
		    entry.Value("remote_path") = remote
		    entry.Value("parent_remote_path") = rp
		    entry.Value("is_folder") = isCollection
		    entry.Value("file_id") = fileId
		    entry.Value("content_type") = contentType

		    If isCollection Then
		      entry.Value("open_url") = BuildFilesWebURL(remote)
		    Else
		      entry.Value("open_url") = BuildFileWebURL(remote, fileId)
		    End If

		    out.Add(entry)
		  Next

		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Private Function WebDavHasTag(pXml As String, pTagName As String) As Boolean
		  Var rx As New RegEx
		  Var opts As New RegExOptions
		  opts.CaseSensitive = False
		  opts.DotMatchAll = True
		  opts.TreatTargetAsOneLine = True
		  rx.Options = opts
		  rx.SearchPattern = "<(?:[A-Za-z_][A-Za-z0-9_.-]*:)?" + pTagName + "\b[^>]*(?:/?>)"

		  Var match As RegExMatch = rx.Search(pXml)
		  Return Not (match Is Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Private Function WebDavResponseBlocks(pXml As String) As String()
		  Var blocks() As String

		  Var rx As New RegEx
		  Var opts As New RegExOptions
		  opts.CaseSensitive = False
		  opts.DotMatchAll = True
		  opts.TreatTargetAsOneLine = True
		  rx.Options = opts
		  rx.SearchPattern = "<(?:[A-Za-z_][A-Za-z0-9_.-]*:)?response\b[^>]*>(.*?)</(?:[A-Za-z_][A-Za-z0-9_.-]*:)?response>"

		  Var match As RegExMatch = rx.Search(pXml)
		  While Not (match Is Nil)
		    blocks.Add(match.SubExpressionString(1))
		    match = rx.Search()
		  Wend

		  Return blocks
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Private Function WebDavTagValue(pXml As String, pTagName As String) As String
		  Var rx As New RegEx
		  Var opts As New RegExOptions
		  opts.CaseSensitive = False
		  opts.DotMatchAll = True
		  opts.TreatTargetAsOneLine = True
		  rx.Options = opts
		  rx.SearchPattern = "<(?:[A-Za-z_][A-Za-z0-9_.-]*:)?" + pTagName + "\b[^>]*>(.*?)</(?:[A-Za-z_][A-Za-z0-9_.-]*:)?" + pTagName + ">"

		  Var match As RegExMatch = rx.Search(pXml)
		  If match Is Nil Then Return ""

		  Var value As String = match.SubExpressionString(1).Trim
		  value = value.ReplaceAll("&lt;", "<")
		  value = value.ReplaceAll("&gt;", ">")
		  value = value.ReplaceAll("&quot;", """")
		  value = value.ReplaceAll("&apos;", "'")
		  value = value.ReplaceAll("&amp;", "&")
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MkCol(remoteFolderPath As String, ByRef pMessage As String) As Boolean
		  pMessage = ""
		  
		  Var folderPath As String = NormalizeRemotePath(remoteFolderPath)
		  If folderPath = "/" Then Return True
		  
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If authHeader = "" Then
		    pMessage = "Nextcloud MKCOL: configuration invalide."
		    Return False
		  End If
		  
		  Var currentPath As String = ""
		  Var parts() As String = folderPath.Split("/")
		  For Each part As String In parts
		    If part.Trim = "" Then Continue
		    
		    If currentPath = "" Then
		      currentPath = "/" + part
		    Else
		      currentPath = currentPath + "/" + part
		    End If
		    
		    Var u As New URLConnection
		    u.RequestHeader("Authorization") = authHeader
		    u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		    
		    Var response As String
		    Try
		      response = u.SendSync("MKCOL", BuildDavUrl(currentPath), 30)
		    Catch e As RuntimeException
		      pMessage = "Nextcloud MKCOL: " + e.Message
		      Return False
		    End Try
		    
		    Select Case u.HTTPStatusCode
		    Case 200, 201, 405
		      // ok / created / already exists
		    Else
		      pMessage = "Nextcloud MKCOL HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		      Return False
		    End Select
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Move(sourcePath As String, destinationPath As String, ByRef pMessage As String, ByRef pDestinationFileId As String) As Boolean
		  pMessage = ""
		  pDestinationFileId = ""
		  
		  Var src As String = sourcePath.Trim
		  Var dst As String = destinationPath.Trim
		  If src = "" Or dst = "" Then
		    pMessage = "Nextcloud MOVE: chemin source ou destination vide."
		    Return False
		  End If
		  
		  If src = dst Then
		    pMessage = "Nextcloud MOVE: source et destination identiques."
		    Return False
		  End If
		  
		  Dim httpStatus As Integer
		  Dim sourceFileId As String
		  Dim existsMessage As String
		  If Not Exists(src, httpStatus, sourceFileId, existsMessage) Then
		    pMessage = "Nextcloud MOVE: source introuvable. " + existsMessage
		    Return False
		  End If
		  
		  Dim destinationExists As Boolean = Exists(dst, httpStatus, pDestinationFileId, existsMessage)
		  If destinationExists Then
		    pMessage = "Nextcloud MOVE: la destination existe déjà."
		    Return False
		  End If
		  
		  If httpStatus <> 404 And existsMessage.Trim <> "" Then
		    pMessage = "Nextcloud MOVE: impossible de vérifier la destination avant déplacement. " + existsMessage
		    Return False
		  End If
		  
		  If Not MkCol(ParentRemotePath(dst), pMessage) Then
		    Return False
		  End If
		  
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If authHeader = "" Then
		    pMessage = "Nextcloud MOVE: configuration invalide."
		    Return False
		  End If
		  
		  Var u As New URLConnection
		  u.RequestHeader("Authorization") = authHeader
		  u.RequestHeader("Destination") = BuildDavUrl(dst)
		  u.RequestHeader("Overwrite") = "F"
		  u.RequestHeader("User-Agent") = "KanjoDesktop/1.0"
		  
		  Var response As String
		  Try
		    response = u.SendSync("MOVE", BuildDavUrl(src), 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud MOVE: " + e.Message
		    Return False
		  End Try
		  
		  Select Case u.HTTPStatusCode
		  Case 201, 204
		    // ok
		  Else
		    pMessage = "Nextcloud MOVE HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select
		  
		  Dim sourceStillExists As Boolean = Exists(src, httpStatus, sourceFileId, existsMessage)
		  If sourceStillExists Then
		    pMessage = "Nextcloud MOVE: la source existe encore après déplacement."
		    Return False
		  End If
		  
		  If httpStatus <> 404 And existsMessage.Trim <> "" Then
		    pMessage = "Nextcloud MOVE: impossible de confirmer la disparition de la source. " + existsMessage
		    Return False
		  End If
		  
		  If Not Exists(dst, httpStatus, pDestinationFileId, existsMessage) Then
		    If httpStatus <> 404 And existsMessage.Trim <> "" Then
		      pMessage = "Nextcloud MOVE: impossible de vérifier la destination après déplacement. " + existsMessage
		    Else
		      pMessage = "Nextcloud MOVE: la destination est introuvable après déplacement."
		    End If
		    Return False
		  End If
		  
		  pMessage = "Nextcloud MOVE OK" + EndOfLine + _
		  "HTTP: " + u.HTTPStatusCode.ToString + EndOfLine + _
		  "Source: " + src + EndOfLine + _
		  "Destination: " + dst + EndOfLine + _
		  "FileId destination: " + pDestinationFileId + EndOfLine + _
		  "Réponse brute: " + If(response.Trim <> "", response, "<vide>")
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveLocalItemOnServer(localItem As FolderItem, localBase As FolderItem, sourceRootName As String, destinationRootName As String, ByRef pResult As Dictionary, pAction As String = "") As Boolean
		  If localItem = Nil Then
		    pResult = New Dictionary
		    pResult.Value("ok") = False
		    pResult.Value("action") = pAction
		    pResult.Value("message") = "Aucun fichier local fourni."
		    Return False
		  End If
		  
		  If localBase = Nil Then
		    pResult = New Dictionary
		    pResult.Value("ok") = False
		    pResult.Value("action") = pAction
		    pResult.Value("message") = "Aucune base locale fournie."
		    Return False
		  End If
		  
		  Var relativePath As String = BuildRelativePathFromLocal(localItem, localBase)
		  If relativePath = "" Then
		    pResult = New Dictionary
		    pResult.Value("ok") = False
		    pResult.Value("action") = pAction
		    pResult.Value("message") = "Le fichier ne fait pas partie du dossier média attendu."
		    Return False
		  End If
		  
		  Var ok As Boolean = MoveRelativePathOnServer(relativePath, sourceRootName, destinationRootName, pResult, pAction)
		  If ok Then
		    pResult.Value("local_path") = localItem.NativePath
		    pResult.Value("is_folder") = localItem.IsFolder
		  End If
		  
		  Return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveRelativePathOnServer(relativePath As String, sourceRootName As String, destinationRootName As String, ByRef pResult As Dictionary, pAction As String = "") As Boolean
		  pResult = New Dictionary
		  pResult.Value("ok") = False
		  pResult.Value("action") = pAction
		  pResult.Value("message") = ""
		  
		  If sourceRootName.Trim = "" Or destinationRootName.Trim = "" Then
		    pResult.Value("message") = "Racine source ou destination invalide."
		    Return False
		  End If
		  
		  If KanjoRootFolder.Trim = "" Then
		    pResult.Value("message") = "Le dossier racine Nextcloud n'est pas configuré."
		    Return False
		  End If
		  
		  Var sourceRelativePath As String = NormalizeMediaRelativePath(relativePath)
		  If sourceRelativePath = "" Then
		    pResult.Value("message") = "Chemin relatif média invalide."
		    Return False
		  End If
		  
		  Var destinationRelativePath As String = SwitchRelativeTopFolder(sourceRelativePath, sourceRootName, destinationRootName)
		  If destinationRelativePath = "" Then
		    pResult.Value("message") = "Impossible de calculer le chemin relatif de destination."
		    Return False
		  End If
		  
		  Var sourceRemotePath As String = BuildRemotePathFromRelative(sourceRelativePath)
		  Var destinationRemotePath As String = BuildRemotePathFromRelative(destinationRelativePath)
		  If sourceRemotePath = "" Or destinationRemotePath = "" Then
		    pResult.Value("message") = "Impossible de calculer les chemins distants."
		    Return False
		  End If
		  
		  Var destinationFileId As String
		  Var moveMessage As String
		  If Not Move(sourceRemotePath, destinationRemotePath, moveMessage, destinationFileId) Then
		    pResult.Value("relative_path") = sourceRelativePath
		    pResult.Value("source_relative_path") = sourceRelativePath
		    pResult.Value("destination_relative_path") = destinationRelativePath
		    pResult.Value("source_remote_path") = sourceRemotePath
		    pResult.Value("destination_remote_path") = destinationRemotePath
		    pResult.Value("message") = moveMessage
		    Return False
		  End If
		  
		  pResult.Value("ok") = True
		  pResult.Value("relative_path") = sourceRelativePath
		  pResult.Value("source_relative_path") = sourceRelativePath
		  pResult.Value("destination_relative_path") = destinationRelativePath
		  pResult.Value("source_remote_path") = sourceRemotePath
		  pResult.Value("destination_remote_path") = destinationRemotePath
		  pResult.Value("destination_file_id") = destinationFileId
		  pResult.Value("message") = moveMessage
		  
		  Return True
		End Function
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
		Function NormalizeMediaRelativePath(relativePath As String) As String
		  Var rp As String = relativePath.Trim
		  If rp = "" Then Return ""
		  
		  rp = rp.ReplaceAll("\\", "/")
		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend
		  
		  If rp.Length > 1 And rp.EndsWith("/") Then
		    rp = rp.Left(rp.Length - 1)
		  End If
		  
		  Return rp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentRemotePath(remotePath As String) As String
		  Var rp As String = remotePath.Trim
		  If rp = "" Then Return ""
		  
		  If Not rp.BeginsWith("/") Then rp = "/" + rp
		  While rp.IndexOf("//") >= 0
		    rp = rp.ReplaceAll("//", "/")
		  Wend
		  
		  If rp.Length > 1 And rp.EndsWith("/") Then
		    rp = rp.Left(rp.Length - 1)
		  End If
		  
		  Var cut As Integer = rp.LastIndexOf("/")
		  If cut <= 0 Then Return "/"
		  
		  Var parentPath As String = rp.Left(cut)
		  If parentPath = "" Then parentPath = "/"
		  If Not parentPath.EndsWith("/") Then parentPath = parentPath + "/"
		  
		  Return parentPath
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
		Function RestoreLocalItemOnServer(localItem As FolderItem, localBase As FolderItem, ByRef pResult As Dictionary, activeRootName As String = "Fichiers", archiveRootName As String = "Archives") As Boolean
		  Return MoveLocalItemOnServer(localItem, localBase, archiveRootName, activeRootName, pResult, "restore")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RestoreRelativePathOnServer(relativePath As String, ByRef pResult As Dictionary, activeRootName As String = "Fichiers", archiveRootName As String = "Archives") As Boolean
		  Return MoveRelativePathOnServer(relativePath, archiveRootName, activeRootName, pResult, "restore")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SwitchRelativeTopFolder(relativePath As String, sourceRootName As String, destinationRootName As String) As String
		  Var rp As String = NormalizeMediaRelativePath(relativePath)
		  If rp = "" Then Return ""
		  
		  Var rel As String = rp
		  If rel.BeginsWith("/") Then rel = rel.Middle(1)
		  
		  Var parts() As String = rel.Split("/")
		  Var firstIndex As Integer = -1
		  For i As Integer = 0 To parts.LastIndex
		    If parts(i).Trim <> "" Then
		      firstIndex = i
		      Exit
		    End If
		  Next
		  
		  If firstIndex < 0 Then Return ""
		  If parts(firstIndex) <> sourceRootName Then Return ""
		  
		  parts(firstIndex) = destinationRootName
		  
		  Return "/" + String.FromArray(parts, "/")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SwitchRemoteTopFolder(remotePath As String, sourceRootName As String, destinationRootName As String) As String
		  Var rp As String = remotePath.Trim
		  If rp = "" Then Return ""
		  
		  Var root As String = NormalizeRemotePath(KanjoRootFolder)
		  If root.Trim = "" Then Return ""
		  
		  Var rel As String = rp
		  If rel.BeginsWith(root) Then
		    rel = rel.Middle(root.Length)
		  Else
		    If rel.BeginsWith("/") Then rel = rel.Middle(1)
		  End If
		  
		  rel = rel.ReplaceAll("\\", "/")
		  While rel.IndexOf("//") >= 0
		    rel = rel.ReplaceAll("//", "/")
		  Wend
		  If rel.BeginsWith("/") Then rel = rel.Middle(1)
		  
		  Var parts() As String = rel.Split("/")
		  Var firstIndex As Integer = -1
		  For i As Integer = 0 To parts.LastIndex
		    If parts(i).Trim <> "" Then
		      firstIndex = i
		      Exit
		    End If
		  Next
		  
		  If firstIndex < 0 Then Return ""
		  If parts(firstIndex) <> sourceRootName Then Return ""
		  
		  parts(firstIndex) = destinationRootName
		  Var rebuilt As String = root + String.FromArray(parts, "/")
		  While rebuilt.IndexOf("//") >= 0
		    rebuilt = rebuilt.ReplaceAll("//", "/")
		  Wend
		  
		  If rebuilt.Length > 1 And rebuilt.EndsWith("/") Then
		    rebuilt = rebuilt.Left(rebuilt.Length - 1)
		  End If
		  
		  Return rebuilt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Upload()
		  // Optional: implement later (WebDAV PUT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UploadFile(localFile As FolderItem, remotePath As String, ByRef pMessage As String) As Boolean
		  pMessage = ""

		  If localFile = Nil Or Not localFile.Exists Then
		    pMessage = "Nextcloud UPLOAD: fichier local introuvable."
		    Return False
		  End If

		  Var normalizedRemotePath As String = NormalizeRemotePath(remotePath)
		  If normalizedRemotePath = "/" Or normalizedRemotePath.Trim = "" Then
		    pMessage = "Nextcloud UPLOAD: chemin distant invalide."
		    Return False
		  End If

		  Var url As String = BuildDavUrl(normalizedRemotePath)
		  Var authHeader As String = BuildAuthorizationHeaderValue()
		  If url = "" Or authHeader = "" Then
		    pMessage = "Nextcloud UPLOAD: configuration invalide."
		    Return False
		  End If

		  Var lastSlash As Integer = normalizedRemotePath.LastIndexOf("/")
		  If lastSlash > 0 Then
		    Var parentPath As String = normalizedRemotePath.Left(lastSlash)
		    If parentPath.Trim <> "" Then
		      Var mkcolMessage As String
		      If Not MkCol(parentPath, mkcolMessage) Then
		        pMessage = mkcolMessage
		        Return False
		      End If
		    End If
		  End If

		  Var content As String
		  Try
		    Var input As BinaryStream = BinaryStream.Open(localFile, False)
		    content = input.Read(input.Length)
		    input.Close
		  Catch e As RuntimeException
		    pMessage = "Nextcloud UPLOAD: " + e.Message
		    Return False
		  End Try

		  Var u As New URLConnection
		  u.RequestHeader("Authorization") = authHeader
		  u.RequestHeader("User-Agent") = "Kanjo/1.0"
		  u.SetRequestContent(content, "application/octet-stream")

		  Var response As String
		  Try
		    response = u.SendSync("PUT", url, 60)
		  Catch e As RuntimeException
		    pMessage = "Nextcloud UPLOAD: " + e.Message
		    Return False
		  End Try

		  Select Case u.HTTPStatusCode
		  Case 200, 201, 204
		    Return True
		  Case 401, 403
		    pMessage = "Nextcloud UPLOAD: acces refuse."
		    Return False
		  Else
		    pMessage = "Nextcloud UPLOAD HTTP " + u.HTTPStatusCode.ToString + If(response.Trim <> "", ": " + response, "")
		    Return False
		  End Select
		End Function
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
