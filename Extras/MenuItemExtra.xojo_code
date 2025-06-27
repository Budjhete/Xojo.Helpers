#tag Module
Protected Module MenuItemExtra
	#tag Method, Flags = &h0
		Sub AppendAll(Extends pMenuItem as DesktopMenuItem, pFromMenuItem as DesktopMenuItem)
		  For i As Integer = 0 to pFromMenuItem.Count - 1
		    pMenuItem.AddMenu(pFromMenuItem.MenuAt(i).Clone)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuAt(Extends pMenuItem as DesktopMenuItem, name as String) As DesktopMenuItem
		  For i As Integer = 0 to pMenuItem.Count - 1
		    If pMenuItem.MenuAt(i).Name = name Then
		      Return pMenuItem.MenuAt(i)
		    End
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAll(Extends menu as DesktopMenuItem)
		  while menu.Count > 0
		    // Fix pour Windows, on dirait qu'il supprime pas les separator...
		    dim menuCount As Integer = menu.Count
		    menu.RemoveMenuAt(0)
		    if menu.Count >= menuCount then
		      System.Log(System.LogLevelERROR, "Impossible de supprimer le menu !")
		      exit
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(Extends pMenuItem As DesktopMenuItem, pIndex As Integer, pMenuItemToInsert As DesktopMenuItem)
		  pMenuItem.AddMenuAt(pIndex, pMenuItemToInsert)
		  pMenuItem.RemoveMenuAt(pIndex + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(Extends pMenuItem As DesktopMenuItem, pName As String, pMenuItemToInsert As DesktopMenuItem)
		  pMenuItem.Replace(pMenuItem.IndexOf(pName), pMenuItemToInsert)
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
