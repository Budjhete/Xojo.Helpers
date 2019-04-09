#tag Class
Protected Class Image
	#tag Method, Flags = &h0
		Shared Function Thumbnail(pPicture As Picture, pWidth As Integer, pHeight As Integer) As Picture
		  // TODO : Garder des trucs en cache
		  // If mThumbnail <> Nil And mThumbnail.Width = pWidth And mThumbnail.Height = pHeight Then
		  // Return mThumbnail
		  // End If
		  
		  Dim pThumb As New Picture(pWidth, pHeight, 32)
		  
		  // TODO : Faire en sorte que le Thumbnail soit centré, et si le Thumbnail est dans un format plus gros que l'image originale, ne pas agrandir
		  
		  // Resize and Crop
		  If pWidth < pHeight Then
		    pThumb.Graphics.DrawPicture(pPicture, 0, 0, (pPicture.Width*pHeight/pPicture.Height), pHeight, 0, 0, pPicture.Width, pPicture.Height)
		  Else
		    pThumb.Graphics.DrawPicture(pPicture, 0, 0, pWidth, pWidth*pPicture.Height/pPicture.Width, 0, 0, pPicture.Width, pPicture.Height)
		  End If
		  
		  Return pThumb
		End Function
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
End Class
#tag EndClass
