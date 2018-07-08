#tag Module
Protected Module MenuItemExtra
	#tag Method, Flags = &h0
		Sub AppendAll(Extends pMenuItem as MenuItem, pFromMenuItem as MenuItem)
		  For i As Integer = 0 to pFromMenuItem.Count - 1
		    pMenuItem.Append(pFromMenuItem.Item(i).Clone)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Extends pMenuItem as MenuItem, name as String) As MenuItem
		  For i As Integer = 0 to pMenuItem.Count - 1
		    If pMenuItem.Item(i).Name = name Then
		      Return pMenuItem.Item(i)
		    End
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAll(Extends menu as MenuItem)
		  while menu.Count > 0
		    // Fix pour Windows, on dirait qu'il supprime pas les separator...
		    dim menuCount As Integer = menu.Count
		    menu.Remove(0)
		    if menu.Count >= menuCount then
		      System.Log(System.LogLevelERROR, "Impossible de supprimer le menu !")
		      exit
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(Extends pMenuItem As MenuItem, pIndex As Integer, pMenuItemToInsert As MenuItem)
		  pMenuItem.Insert(pIndex, pMenuItemToInsert)
		  pMenuItem.Remove(pIndex + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(Extends pMenuItem As MenuItem, pName As String, pMenuItemToInsert As MenuItem)
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
End Module
#tag EndModule
