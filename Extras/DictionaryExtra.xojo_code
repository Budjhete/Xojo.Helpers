#tag Module
Protected Module DictionaryExtra
	#tag Method, Flags = &h0
		Sub Clear(Extends pDictionary as Dictionary)
		  pDictionary.RemoveAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends pDictionary as Dictionary) As Dictionary
		  
		  Dim pNewDictionary As New Dictionary
		  
		  For Each entry As DictionaryEntry In pDictionary
		    pNewDictionary.Value(entry.Key) = entry.Value
		  Next
		  
		  Return pNewDictionary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EagerlyEvaluateIterable(obj As Iterable) As variant()
		  Var results() As Variant
		  For Each item As Variant In obj
		    results.add(item)
		  Next
		  Return results
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Dictionary, pKey As Variant) As Boolean
		  Dim b as Boolean = pDictionary.Value(pKey)
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBoolean(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Boolean) As Boolean
		  Dim b as Boolean = pDictionary.Lookup(pKey, pDefault)
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDate(Extends pDictionary As Dictionary, pKey As Variant) As DateTime
		  dim d as DateTime = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function GetDate(Extends pDictionary As Dictionary, pKey As Variant, pDefault As DateTime) As DateTime
		  dim d as DateTime
		  try
		    d = pDictionary.Lookup(pKey, pDefault)
		  Catch
		    d = nil
		  end try
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As variant) As Dictionary
		  dim d as Dictionary = pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDictionary(Extends pDictionary As Dictionary, pKey As Variant, pDefault As Dictionary) As Dictionary
		  Return Dictionary(pDictionary.Value(pKey, pDefault))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Dictionary, pKey As Auto) As Double
		  Dim d as double =  pDictionary.Value(pKey)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDouble(Extends pDictionary As Dictionary, pKey As Auto, pDefault As Double) As Double
		  Dim d as Double =  pDictionary.Lookup(pKey, pDefault)
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary As Dictionary, pKey As Variant) As Integer
		  Dim i as integer =  pDictionary.Value(pKey)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInteger(Extends pDictionary As Dictionary, pKey As variant, pDefault As Integer) As Integer
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
		    Dim t as String = pDictionary.Lookup(pKey, pDefault)
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
		Function IntegerValueNilMinusOne(Extends pAuto As Variant) As Integer
		  if pAuto = nil then
		    Return -1
		  end if
		  dim tt as integer = pAuto.Type
		  Select case pAuto.Type
		  case 2, 3 // integer
		    Return pAuto.IntegerValue
		  case 5 // Double
		    Return pAuto.DoubleValue.ToText.IntegerValue
		  Case 8 // string 
		    Return pAuto.StringValue.IntegerValue
		  Case 37 // text
		    Return pAuto.TextValue.IntegerValue
		  Case 6 // Currency
		    Return pAuto.CurrencyValue.ToText.IntegerValue
		    
		  Case 11 // Boolean
		    if pAuto.BooleanValue then
		      Return 1
		    else
		      Return 0
		    end if
		    
		  Case 9 // Object
		    Return -1
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Join(Extends d as Dictionary, assignSep as string, pairSep as String) As String
		  dim pairs() as String
		  
		  for each ent as DictionaryEntry in d
		    dim t1 as String = ent.Key
		    dim t2 as String = ent.Value
		    pairs.Add( t1 + assignSep + t2)
		  next
		  
		  Return String.FromArray(pairs, pairSep)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONCompatible(Extends pDictionary As Dictionary) As Dictionary
		  
		  For Each pEntry As DictionaryEntry In EagerlyEvaluateIterable(pDictionary)
		    
		    Dim pValue As Auto = pEntry.Value
		    
		    
		    
		    Select Case pValue.Type
		      
		    Case 12
		      dim dd as Dictionary = pValue
		      pDictionary.Value(pEntry.Key) = dd.jsoncompatible
		      
		    Case 17
		      pDictionary.Value(pEntry.Key)  = pValue.DateTimeValue .SQLDateTime
		      
		    case 6
		      
		      pDictionary.Value(pEntry.Key)  = pValue.AutoDoubleValue
		      
		      
		    End Select
		    
		  Next
		  
		  Return pDictionary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function JSONText(Extends pDictionary As Dictionary) As String
		  
		  
		  
		  Return xojo.data.GenerateJSON(pDictionary.JSONCompatible)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit))
		Function JSONValue(Extends pDictionaries() As Dictionary) As String
		  return GenerateJSON(pDictionaries)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and false
		Function JSONValue(Extends pDictionary As Dictionary) As JSONItem
		  Dim pJSONItem As New JSONItem
		  
		  For Each pEntry As DictionaryEntry In pDictionary
		    
		    Dim pValue As Auto = pEntry.Value
		    
		    Select Case pValue
		      
		    Case IsA Dictionary
		      pJSONItem.Value(pEntry.Key.IntegerValue) = pValue
		      
		    Case IsA Date
		      pJSONItem.Value(pEntry.Key.IntegerValue) = pValue.DateTimeValue.SQLDateTime
		      
		    Else
		      pJSONItem.Value(pEntry.Key.IntegerValue) = pValue
		      
		    End Select
		    
		  Next
		  
		  Return pJSONItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit))
		Function JSONValue(Extends pDictionary As Dictionary) As String
		  return GenerateJSON(pDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys(Extends pDictionary as Dictionary) As Variant()
		  dim keys() as Variant
		  For each ent as DictionaryEntry in pDictionary
		    keys.Append(ent.Key)
		  Next
		  
		  Return keys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub Merge(Extends pDictionary As Dictionary, pOtherDictionary As Dictionary)
		  // Merge another dictionary in this dictionary
		  For Each entr As DictionaryEntry In pOtherDictionary
		    pDictionary.Value(entr.Key) = entr.Value
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Merge(Extends pDictionary As Dictionary, pOtherDictionary As Dictionary) As Dictionary
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
		Function Value(Extends pDictionary as Dictionary, pKey as Variant, pDefault as Variant) As Variant
		  return pDictionary.Lookup(pKey, pDefault)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Values(Extends pDictionary as Dictionary) As Auto()
		  dim values() as Auto
		  For each ent as DictionaryEntry in pDictionary
		    values.Append(ent.Value)
		  Next
		  
		  Return values
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XojoDictionary(Extends pDictionary as Dictionary) As Dictionary
		  Dim pNewDictionary As New Dictionary
		  
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
