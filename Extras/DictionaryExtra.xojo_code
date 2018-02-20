#tag Module
Protected Module DictionaryExtra
	#tag Method, Flags = &h0
		Function Clone(Extends pDictionary as Dictionary) As Dictionary
		  Dim pNewDictionary As New Dictionary
		  
		  For Each pKey As Variant In pDictionary.Keys()
		    pNewDictionary.Value(pKey) = pDictionary.Value(pKey)
		  Next
		  
		  Return pNewDictionary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Dictionary, pKey As Variant) As Boolean
		  Return pDictionary.Value(pKey).BooleanValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Boolean) As Boolean
		  Return pDictionary.Value(pKey, pDefault).BooleanValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCollection(Extends pDictionary As Dictionary, pKey As Variant) As Collection
		  Return Collection(pDictionary.Value(pKey))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCollection(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Collection) As Collection
		  Return Collection(pDictionary.Value(pKey, pDefault))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Extends pDictionary as Dictionary, pKey As Variant) As Date
		  Return pDictionary.Value(pKey).DateValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Extends pDictionary as Dictionary, pKey As Variant, pDefault As Date) As Date
		  Return pDictionary.Value(pKey, pDefault).DateValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As Variant) As Dictionary
		  Return Dictionary(pDictionary.Value(pKey))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Dictionary) As Dictionary
		  Return Dictionary(pDictionary.Value(pKey, pDefault))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Dictionary, pKey As Variant) As Double
		  Return pDictionary.Value(pKey).DoubleValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Double) As Double
		  Return pDictionary.Value(pKey, pDefault).DoubleValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary as Dictionary, pKey As Variant) As Integer
		  Return pDictionary.Value(pKey).IntegerValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Integer) As Integer
		  Return pDictionary.Value(pKey, pDefault).IntegerValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(Extends pDictionary as Dictionary, pKey As Variant) As String
		  Return pDictionary.Value(pKey).StringValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(Extends pDictionary as Dictionary, pKey As Variant, pDefault As String) As String
		  Return pDictionary.Value(pKey, pDefault).StringValue()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(Extends d as Dictionary, assignSep as String, pairSep as String) As String
		  // @deprecated est-ce vraiment utile?
		  
		  dim pairs() as String
		  
		  for each key as Variant in d.Keys
		    pairs.Append(key.StringValue + assignSep + d.Value(key).StringValue)
		  next
		  
		  
		  return Join(pairs, pairSep)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JSONValue(Extends pDictionary As Dictionary) As JSONItem
		  Dim pJSONItem As New JSONItem
		  
		  For Each pKey As String In pDictionary.Keys
		    
		    Dim pValue As Variant = pDictionary.Value(pKey)
		    
		    Select Case pValue
		      
		    Case IsA Collection
		      pJSONItem.Value(pKey) = Collection(pValue).JSONValue
		      
		    Case IsA Dictionary
		      pJSONItem.Value(pKey) = Dictionary(pValue).JSONValue
		      
		    Case IsA Date
		      pJSONItem.Value(pKey) = pValue.DateValue.SQLDateTime
		      
		    Else
		      pJSONItem.Value(pKey) = pValue
		      
		    End Select
		    
		  Next
		  
		  Return pJSONItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Merge(Extends pDictionary As Dictionary, pOtherDictionary As Dictionary)
		  // Merge another dictionary in this dictionary
		  For Each pKey As Variant In pOtherDictionary.Keys()
		    pDictionary.Value(pKey) = pOtherDictionary.Value(pKey)
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Merge(Extends pDictionary As Dictionary, pOtherDictionary As Dictionary) As Dictionary
		  // Merge another dictionary in a copy of this dictionary
		  Return pDictionary.Clone.Merge(pOtherDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(Extends pDictionary As Dictionary, pKey As Variant, pValue As Variant)
		  // @deprecated complètement inutile
		  
		  pDictionary.Value(pKey) = pValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Extends pDictionary as Dictionary, pKey as Variant, pDefault as Variant) As Variant
		  if pDictionary.HasKey(pKey) then
		    return pDictionary.Value(pKey)
		  end
		  
		  return pDefault
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
