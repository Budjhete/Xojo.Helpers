#tag Module
Protected Module DictionaryExtra
	#tag Method, Flags = &h0
		Sub Clear(Extends pDictionary as Xojo.Core.Dictionary)
		  pDictionary.RemoveAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends pDictionary as Xojo.Core.Dictionary) As Xojo.Core.Dictionary
		  Using Xojo.Core
		  Dim pNewDictionary As New Dictionary
		  
		  For Each entry As DictionaryEntry In pDictionary
		    pNewDictionary.Value(entry.Key) = entry.Value
		  Next
		  
		  Return pNewDictionary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EagerlyEvaluateIterable(obj As Xojo.Core.Iterable) As auto()
		  Var results() As Auto
		  For Each item As Auto In obj
		    results.Append(item)
		  Next
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetBoolean(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Boolean) As Boolean
		  Dim b as Boolean = pDictionary.Lookup(pKey, pDefault)
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto) As Boolean
		  Dim b as Boolean = pDictionary.Value(pKey)
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pDefault As Boolean) As Boolean
		  Dim b as Boolean = pDictionary.Lookup(pKey, pDefault)
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetDate(Extends pDictionary As Dictionary, pKey As Variant) As Xojo.Core.Date
		  dim d as Xojo.Core.Date = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetDate(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Xojo.Core.Date) As Xojo.Core.Date
		  dim d as Xojo.Core.Date
		  try
		    d = pDictionary.Lookup(pKey, pDefault)
		  Catch
		    d = nil
		  end try
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto) As Xojo.Core.Date
		  dim d as Xojo.Core.Date = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pDefault As Xojo.Core.Date) As Xojo.Core.Date
		  dim d as Xojo.Core.Date = pDictionary.Lookup(pKey, pDefault)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As variant) As Dictionary
		  dim d as Dictionary = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Dictionary) As Dictionary
		  Return Dictionary(pDictionary.Value(pKey, pDefault))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Xojo.core.Dictionary, pKey As Auto) As Xojo.core.Dictionary
		  dim d as Xojo.Core.Dictionary = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pDefault As Xojo.Core.Dictionary) As Xojo.Core.Dictionary
		  Dim d as Xojo.Core.Dictionary = pDictionary.Lookup(pKey, pDefault)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto) As Double
		  Dim d as double =  pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pDefault As Double) As Double
		  Dim d as Double =  pDictionary.Lookup(pKey, pDefault)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetInteger(Extends pDictionary As Dictionary, pKey As Variant) As Integer
		  Dim i as integer =  pDictionary.Value(pKey)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetInteger(Extends pDictionary as Dictionary, pKey as Variant, Default as Integer) As Integer
		  Dim i as integer =  pDictionary.Value(pKey, Default)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto) As Integer
		  Dim i as integer =  pDictionary.Value(pKey)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pDefault As Integer) As Integer
		  Dim i as integer = pDictionary.Lookup(pKey, pDefault)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetString(Extends pDictionary As Dictionary, pKey As String) As String
		  Dim t as string = pDictionary.Value(pKey)
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetString(Extends pDictionary As Dictionary, pKey As String, pDefault As String) As String
		  Dim t as String = pDictionary.Lookup(pKey, pDefault)
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(Extends pDictionary As Xojo.Core.Dictionary, pKey As Text) As Text
		  Dim t as text = pDictionary.Value(pKey)
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(Extends pDictionary As Xojo.Core.Dictionary, pKey As Text, pDefault As Text) As Text
		  Dim t as text = pDictionary.Lookup(pKey, pDefault)
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function GetText(Extends pDictionary As Dictionary, pKey As Text) As Text
		  #if TargetIOS then
		    Dim t as Text = pDictionary.Value(pKey)
		    Return t
		  #else
		    Dim s as String = pKey
		    Dim d as string = pDictionary.Value(s)
		    Return d.ToText
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function GetText(Extends pDictionary As Dictionary, pKey As Text, pDefault As Text) As Text
		  #if TargetIOS then
		    Dim t as Text = pDictionary.Lookup(pKey, pDefault)
		    Return t
		  #else
		    Dim p as String = pKey
		    Dim d as string = pDefault
		    Dim s as string = pDictionary.Lookup(p, d)
		    Return s.ToText
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(Extends d as Xojo.Core.Dictionary, assignSep as Text, pairSep as Text) As Text
		  // @deprecated est-ce vraiment utile?
		  
		  dim pairs() as Text
		  
		  for each ent as Xojo.Core.DictionaryEntry in d
		    dim t1 as text = ent.Key
		    dim t2 as text = ent.Value
		    pairs.Append( t1 + assignSep + t2)
		  next
		  
		  
		  return Text.Join(pairs, pairSep)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONCompatible(Extends pDictionary As Xojo.Core.Dictionary) As Xojo.Core.Dictionary
		  Using Xojo.Core
		  
		  For Each pEntry As DictionaryEntry In EagerlyEvaluateIterable(pDictionary)
		    
		    Dim pValue As Auto = pEntry.Value
		    
		    
		    
		    Select Case pValue.Type
		      
		    Case 12
		      dim dd as Xojo.Core.Dictionary = pValue
		      pDictionary.Value(pEntry.Key) = dd.jsoncompatible
		      
		    Case 17
		      pDictionary.Value(pEntry.Key)  = pValue.AutoDateValue.SQLDateTime
		      
		    case 6
		      
		      pDictionary.Value(pEntry.Key)  = pValue.AutoDoubleValue
		      
		      
		    End Select
		    
		  Next
		  
		  Return pDictionary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONText(Extends pDictionary As Xojo.Core.Dictionary) As Text
		  Using Xojo.Core
		  
		  
		  Return xojo.data.GenerateJSON(pDictionary.JSONCompatible)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONValue(Extends pDictionaries() As Xojo.Core.Dictionary) As Text
		  return Xojo.Data.GenerateJSON(pDictionaries)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONValue(Extends pDictionary As Xojo.Core.Dictionary) As JSONItem
		  Using Xojo.Core
		  
		  Dim pJSONItem As New JSONItem
		  
		  For Each pEntry As DictionaryEntry In pDictionary
		    
		    Dim pValue As Auto = pEntry.Value
		    
		    Select Case pValue
		      
		    Case IsA Xojo.Core.Dictionary
		      pJSONItem.Value(pEntry.Key.AutoIntegerValue) = pValue
		      
		    Case IsA Date
		      pJSONItem.Value(pEntry.Key.AutoIntegerValue) = pValue.AutoDateValue.SQLDateTime
		      
		    Else
		      pJSONItem.Value(pEntry.Key.AutoIntegerValue) = pValue
		      
		    End Select
		    
		  Next
		  
		  Return pJSONItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JSONValue(Extends pDictionary As Xojo.Core.Dictionary) As Text
		  return Xojo.Data.GenerateJSON(pDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys(Extends pDictionary as Xojo.Core.Dictionary) As Auto()
		  dim keys() as Auto
		  For each ent as Xojo.Core.DictionaryEntry in pDictionary
		    keys.Append(ent.Key)
		  Next
		  
		  Return keys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub Merge(Extends pDictionary As Xojo.Core.Dictionary, pOtherDictionary As Xojo.Core.Dictionary)
		  // Merge another dictionary in this dictionary
		  For Each entr As Xojo.Core.DictionaryEntry In pOtherDictionary
		    pDictionary.Value(entr.Key) = entr.Value
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Merge(Extends pDictionary As Xojo.Core.Dictionary, pOtherDictionary As Xojo.Core.Dictionary) As Xojo.Core.Dictionary
		  // Merge another dictionary in a copy of this dictionary
		  Return pDictionary.Clone.Merge(pOtherDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Set(Extends pDictionary As Dictionary, pKey As Variant, pValue As Variant)
		  // @deprecated complètement inutile
		  
		  pDictionary.Value(pKey) = pValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(Extends pDictionary As Xojo.Core.Dictionary, pKey As Auto, pValue As Auto)
		  // @deprecated complètement inutile
		  
		  pDictionary.Value(pKey) = pValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Value(Extends pDictionary as Dictionary, pKey as variant, pDefault as Variant) As Auto
		  return pDictionary.Lookup(pKey, pDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Extends pDictionary as Xojo.Core.Dictionary, pKey as Auto, pDefault as Auto) As Auto
		  return pDictionary.Lookup(pKey, pDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Values(Extends pDictionary as Xojo.Core.Dictionary) As Auto()
		  dim values() as Auto
		  For each ent as Xojo.Core.DictionaryEntry in pDictionary
		    values.Append(ent.Value)
		  Next
		  
		  Return values
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XojoDictionary(Extends pDictionary as Dictionary) As Xojo.Core.Dictionary
		  Dim pNewDictionary As New Xojo.Core.Dictionary
		  
		  For Each pKey As String In pDictionary.Keys
		    pNewDictionary.Value(pKey) = pDictionary.Value(pKey) 
		  Next
		  
		  Return pNewDictionary
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
