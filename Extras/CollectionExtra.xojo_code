#tag Module
Protected Module CollectionExtra
	#tag Method, Flags = &h0
		Function Contains(Extends c as Collection, value as Variant) As Boolean
		  For i as Integer = 1 to c.Count
		    if c.Item(i) = value then
		      return true
		    end
		  Next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JSONValue(Extends pCollection As Collection) As JSONItem
		  Dim pJSONItem As New JSONItem
		  
		  For pIndex As Integer = 1 To pCollection.Count
		    
		    Dim pValue As Variant = pCollection.Item(pIndex)
		    
		    Select Case pValue
		      
		    Case IsA Collection
		      pJSONItem.Value(pIndex) = Collection(pValue).JSONValue
		      
		    Case IsA Dictionary
		      pJSONItem.Value(pIndex) = Dictionary(pValue).JSONValue
		      
		    Case IsA Date
		      pJSONItem.Value(pIndex) = pValue.DateValue.SQLDateTime
		      
		    Else
		      pJSONItem.Value(pIndex) = pValue
		      
		    End Select
		    
		  Next
		  
		  Return pJSONItem
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
End Module
#tag EndModule
