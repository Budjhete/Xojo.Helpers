#tag Class
Protected Class Updater
	#tag Method, Flags = &h21
		Private Sub AppcastSuccess(cast as Appcast)
		  dim currentVersion as new Version(App.Version)
		  
		  dim item as AppcastItem
		  dim newer as AppcastItem = nil
		  
		  For i as Integer = 0 to cast.Items.Ubound
		    item = cast.Items(i)
		    
		    if not IsSkipped(item.Version) and _
		      not IsUpdateLater(item.Version) and _
		      currentVersion < item.Version and _
		      (newer = nil or newer.Version < item.Version) then
		      newer = item
		    end
		  Next
		  
		  mNewer = newer
		  
		  'if mNewer <> nil and not Me.windowShow then
		  'MsgBox "Une nouvelle version est disponible."
		  ''Me.windowShow = true
		  ''dim win as new FenetreNouvelleVersion(mNewer)
		  ''win.Show()
		  'end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Channel() As String
		  if App.StageCode = Application.Final then
		    return Updater.CHANNEL_STABLE
		  elseif App.StageCode = Application.Beta then
		    return Updater.CHANNEL_BETA
		  else
		    return Updater.CHANNEL_UNSTABLE
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Check()
		  LastCheckTime = Xojo.Core.Date.now
		  
		  dim item as AppcastItem = GetNewer()
		  if item <> nil and not Me.windowShow then
		    Me.windowShow = true
		    dim win as new FenetreNouvelleVersion(item)
		    win.Show()
		  else
		    FenetreAJour.ShowModal()
		  end
		  
		  'Dim http as New HTTPSocket
		  'http.SetRequestHeader("User-Agent", App.FullVersionName)
		  'dim result As String = http.Get("http://www.budjhete.com/updates/version.php",30)
		  '
		  'dim tmp() As String = result.Split(":")
		  '
		  'if tmp(0) = "YES" then
		  'FenetreNouvelleVersion.Show()
		  'FenetreNouvelleVersion.SetVersion(tmp(1))
		  'FenetreNouvelleVersion.SetFile(tmp(2))
		  'else
		  'FenetreAJour.ShowModal()
		  'end
		  
		  
		  'SetRequestHeader("User-Agent", App.VersionName)
		  'Get("http://www.budjhete.com/updates")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNewer(ignoreSkipped as Boolean = true, ignoreUpdateLater as Boolean = true) As AppcastItem
		  return mNewer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize()
		  'LastCheckTime = new Date()
		  
		  mAppcast = new Appcast()
		  AddHandler mAppcast.Success, AddressOf AppcastSuccess
		  RefreshAppcast()
		  
		  dim item as AppcastItem = GetNewer()
		  if item <> nil and not Me.windowShow then
		    Me.windowShow = true
		    dim win as new FenetreNouvelleVersion(item)
		    win.Show()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSkipped(v as Version) As Boolean
		  if not Me.UpdateConfig.HasKey("Skipped") then
		    return false
		  end
		  
		  return Collection(Me.UpdateConfig.Value("Skipped")).Contains(v.ToString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUpdateLater(v as Version) As Boolean
		  Using Xojo.Core
		  
		  if not Me.UpdateConfig.HasKey("UpdateLater") then
		    return false
		  end
		  
		  dim liste as Dictionary = Dictionary(Me.UpdateConfig.Value("UpdateLater"))
		  if not liste.HasKey(v.ToString) then
		    return false
		  end
		  
		  dim when as Date = liste.GetDate(v.ToString)
		  dim now as Date = Xojo.Core.Date.Now
		  
		  return (now < when)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshAppcast()
		  mAppcast.Load(kAppcastUrl)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Skip(v as Version)
		  dim liste as Collection
		  
		  if not Me.UpdateConfig.HasKey("Skipped") then
		    liste = new Collection
		    Me.UpdateConfig.Value("Skipped") = liste
		  else
		    liste = Me.UpdateConfig.Value("Skipped")
		  end
		  
		  if not liste.Contains(v.ToString) then
		    liste.Add(v.ToString)
		    call App.Configuration.Update
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(item as AppcastItem)
		  FenetreMiseAJour.Show(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateLater(item as AppcastItem)
		  dim liste as Dictionary
		  
		  if not Me.UpdateConfig.HasKey("UpdateLater") then
		    liste = new Dictionary
		    Me.UpdateConfig.Value("UpdateLater") = liste
		  else
		    liste = Me.UpdateConfig.Value("UpdateLater")
		  end
		  
		  dim when as new Date
		  when.Day = when.Day + 7
		  
		  liste.Value(item.Version.ToString) = when
		  App.Configuration.Update
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Me.UpdateConfig.GetBoolean("AutoUpdates", false)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.UpdateConfig.Set("AutoUpdates", value)
			End Set
		#tag EndSetter
		AutoUpdate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Me.UpdateConfig.GetString("Frequency", "Daily")
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.UpdateConfig.Set("Frequency", value)
			End Set
		#tag EndSetter
		Frequency As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if instance_ Is Nil then
			    instance_ = new Updater()
			  end
			  return instance_
			End Get
		#tag EndGetter
		Shared Instance As Updater
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared instance_ As Updater = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Me.UpdateConfig.GetDate("LastCheckTime", Nil)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.UpdateConfig.Set("LastCheckTime", value)
			End Set
		#tag EndSetter
		LastCheckTime As Xojo.Core.Date
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAppcast As Appcast = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNewer As AppcastItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Me.UpdateConfig.GetBoolean("ShowPrereleases", false)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    Me.UpdateConfig.Set("ShowPrereleases", true)
			  elseif Me.UpdateConfig.HasKey("ShowPrereleases") then
			    Me.UpdateConfig.Remove("ShowPrereleases")
			  end
			End Set
		#tag EndSetter
		ShowPrerelease As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Using Xojo.Core
			  
			  If Not App.Configuration.HasKey("Updates") Then
			    App.Configuration.Value("Updates") = New Dictionary
			  End If
			  
			  Dim pUpdates As Dictionary = App.Configuration.GetDictionary("Updates")
			  
			  Return pUpdates
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  App.Configuration.Value("Updates") = value
			End Set
		#tag EndSetter
		Protected UpdateConfig As Xojo.Core.Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private windowShow As Boolean = false
	#tag EndProperty


	#tag Constant, Name = CHANNEL_BETA, Type = Text, Dynamic = False, Default = \"beta", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CHANNEL_STABLE, Type = Text, Dynamic = False, Default = \"stable", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CHANNEL_UNSTABLE, Type = Text, Dynamic = False, Default = \"genesis", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kAppcastUrl, Type = Text, Dynamic = False, Default = \"http://app.kanjo.ca/download/appcast.xml", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoUpdate"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Frequency"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowPrerelease"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
