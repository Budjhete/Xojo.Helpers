#tag Class
Protected Class CalendlyClient
	#tag Method, Flags = &h0
		Function AvailableTimes(pEventTypeURI As String, pStart As DateTime, pEnd As DateTime) As Dictionary()
		  Dim pTimes() As Dictionary
		  If pEventTypeURI.Trim = "" Or pStart Is Nil Or pEnd Is Nil Then Return pTimes

		  Dim pURL As String = cAPIBaseURL + "/event_type_available_times?event_type=" + EncodeURLComponent(pEventTypeURI.Trim) + _
		  "&start_time=" + EncodeURLComponent(UTCISO8601(pStart)) + "&end_time=" + EncodeURLComponent(UTCISO8601(pEnd))
		  Dim pResponse As Dictionary = RequestJSON("GET", pURL)
		  If pResponse Is Nil Or Not pResponse.HasKey("collection") Then Return pTimes

		  Dim pCollection() As Variant = pResponse.Value("collection")
		  For Each pValue As Variant In pCollection
		    If pValue IsA Dictionary Then pTimes.Add(Dictionary(pValue))
		  Next

		  Return pTimes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CancelEvent(pEventURI As String, pReason As String) As Boolean
		  If pEventURI.Trim = "" Then
		    LastError = kCalendlyURIManquante(App.Lang)
		    Return False
		  End If

		  Dim pPayload As New Dictionary
		  pPayload.Value("reason") = pReason.Trim
		  Return RequestJSON("POST", pEventURI.TrimRight("/") + "/cancellation", GenerateJSON(pPayload)) <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pToken As String)
		  Token = pToken.Trim
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateInvitee(pEventTypeURI As String, pStart As DateTime, pName As String, pEmail As String, pTimezone As String, pGuestEmails() As String, pLocation As Dictionary = Nil) As Dictionary
		  If pEventTypeURI.Trim = "" Or pStart Is Nil Or pName.Trim = "" Or pEmail.Trim = "" Then
		    LastError = kCalendlyParametresIncomplets(App.Lang)
		    Return Nil
		  End If

		  Dim pPayload As New Dictionary
		  pPayload.Value("event_type") = pEventTypeURI.Trim
		  pPayload.Value("start_time") = UTCISO8601(pStart)

		  Dim pInvitee As New Dictionary
		  pInvitee.Value("name") = pName.Trim
		  pInvitee.Value("email") = pEmail.Trim
		  pInvitee.Value("timezone") = pTimezone.Trim
		  pPayload.Value("invitee") = pInvitee

		  Dim pGuests() As Variant
		  For Each pGuestEmail As String In pGuestEmails
		    If pGuestEmail.Trim <> "" And pGuestEmail.Trim.Lowercase <> pEmail.Trim.Lowercase Then pGuests.Add(pGuestEmail.Trim)
		  Next
		  If pGuests.LastIndex >= 0 Then pPayload.Value("event_guests") = pGuests
		  If pLocation <> Nil And pLocation.KeyCount > 0 Then pPayload.Value("location") = pLocation

		  Return RequestJSON("POST", cAPIBaseURL + "/invitees", GenerateJSON(pPayload))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentUserURI() As String
		  Dim pResponse As Dictionary = RequestJSON("GET", cAPIBaseURL + "/users/me")
		  If pResponse Is Nil Or Not pResponse.HasKey("resource") Then Return ""

		  Dim pResource As Dictionary = Dictionary(pResponse.Value("resource"))
		  If pResource Is Nil Then Return ""
		  Return pResource.Lookup("uri", "").StringValue.Trim
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EventType(pEventTypeURI As String) As Dictionary
		  If pEventTypeURI.Trim = "" Then Return Nil
		  Dim pResponse As Dictionary = RequestJSON("GET", pEventTypeURI.Trim)
		  If pResponse Is Nil Or Not pResponse.HasKey("resource") Then Return Nil
		  Return Dictionary(pResponse.Value("resource"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EventTypes() As Dictionary()
		  Dim pEventTypes() As Dictionary
		  Dim pUserURI As String = CurrentUserURI
		  If pUserURI = "" Then Return pEventTypes

		  Dim pURL As String = cAPIBaseURL + "/event_types?user=" + EncodeURLComponent(pUserURI) + "&active=true&count=100"
		  Dim pResponse As Dictionary = RequestJSON("GET", pURL)
		  If pResponse Is Nil Or Not pResponse.HasKey("collection") Then Return pEventTypes

		  Dim pCollection() As Variant = pResponse.Value("collection")
		  For Each pValue As Variant In pCollection
		    If pValue IsA Dictionary Then pEventTypes.Add(Dictionary(pValue))
		  Next

		  Return pEventTypes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RequestJSON(pMethod As String, pURL As String, pBody As String = "") As Dictionary
		  LastError = ""
		  LastHTTPStatus = 0
		  If Token = "" Then
		    LastError = kCalendlyJetonManquant(App.Lang)
		    Return Nil
		  End If

		  Dim pConnection As New URLConnection
		  pConnection.RequestHeader("Authorization") = "Bearer " + Token
		  pConnection.RequestHeader("Accept") = "application/json"
		  If pBody <> "" Then pConnection.SetRequestContent(pBody, "application/json")

		  Dim pResponse As String
		  Try
		    pResponse = pConnection.SendSync(pMethod, pURL, 30)
		  Catch pError As NetworkException
		    LastError = pError.Message
		    Return Nil
		  End Try

		  LastHTTPStatus = pConnection.HTTPStatusCode
		  If LastHTTPStatus < 200 Or LastHTTPStatus >= 300 Then
		    Try
		      Dim pErrorPayload As Dictionary = Dictionary(ParseJSON(pResponse))
		      LastError = pErrorPayload.Lookup("message", pResponse).StringValue.Trim
		    Catch pError As InvalidJSONException
		      LastError = pResponse.Trim
		    End Try
		    If LastError = "" Then LastError = "Calendly HTTP " + LastHTTPStatus.ToString
		    Return Nil
		  End If

		  If pResponse.Trim = "" Then Return New Dictionary
		  Try
		    Return Dictionary(ParseJSON(pResponse))
		  Catch pError As InvalidJSONException
		    LastError = kCalendlyReponseJSONInvalide(App.Lang)
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCISO8601(pDate As DateTime) As String
		  If pDate Is Nil Then Return ""

		  Dim pUTC As New DateTime(pDate.SecondsFrom1970, New TimeZone(0))
		  Return pUTC.Year.ToString + "-" + pUTC.Month.ToString.FillLeft("0", 2) + "-" + pUTC.Day.ToString.FillLeft("0", 2) + _
		  "T" + pUTC.Hour.ToString.FillLeft("0", 2) + ":" + pUTC.Minute.ToString.FillLeft("0", 2) + ":" + pUTC.Second.ToString.FillLeft("0", 2) + "Z"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LastError As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastHTTPStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Token As String
	#tag EndProperty


	#tag Constant, Name = cAPIBaseURL, Type = String, Dynamic = False, Default = \"https://api.calendly.com", Scope = Public
	#tag EndConstant

End Class
#tag EndClass
