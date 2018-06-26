#tag Module
Protected Module ListboxExtra
	#tag Method, Flags = &h0
		Sub cellPrependControl(extends lb as WebListBox, wc as webcontrol, row as integer, column as integer)
		  dim script() as string
		  script.append wc.JqeurySelector+".detach().prependTo("+lb.cellSelector(row, column)+");"
		  script.append wc.JqeurySelector+".css('position','relative');"
		  lb.ExecuteJavaScript(join(script, EndOfLine.Windows))
		  wc.Left = 0
		  wc.Top = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function cellSelector(extends lb as WebListBox, row as integer, column as Integer) As String
		  return "$('#" +lb.ControlID + "_userrows tr').eq(" + str(Row) + ").find('td').eq(" + str(Column) + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function jQeurySelector(extends wc as WebControl) As String
		  return "$('#"+wc.ControlID+"')"
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
