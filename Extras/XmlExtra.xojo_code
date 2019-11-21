#tag Module
Protected Module XmlExtra
	#tag Method, Flags = &h0
		Function Child(Extends node as XmlNode, name as String) As XmlNode
		  For i as Integer = 0 to node.ChildCount-1
		    if node.Child(i).Name = name then
		      return node.Child(i)
		    end
		  Next
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Element(Extends node as XmlNode, name as String) As XmlNode
		  For i as Integer = 0 to node.ChildCount-1
		    if node.Child(i).Name = name then
		      return node.Child(i)
		    end
		    
		    dim ret as XmlNode = node.Element(name)
		    if ret <> nil then
		      return ret
		    end
		  Next
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(Extends node as XmlNode) As String
		  dim texts() as String
		  
		  for i as Integer = 0 to (node.ChildCount-1)
		    dim child as XmlNode = node.Child(i)
		    
		    if node.Child(i) IsA XmlTextNode then
		      texts.Append(child.Value)
		    else
		      texts.Append(child.Text)
		    end
		  next
		  
		  return Join(texts, " ")
		End Function
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
