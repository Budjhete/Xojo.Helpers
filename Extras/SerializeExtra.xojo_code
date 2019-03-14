#tag Module
Protected Module SerializeExtra
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Serialize(value as Auto) As Text
		  dim json as Auto = SerializeObject(value)
		  
		  if json IsA JSONItem then
		    return JSONItem(json).ToString()
		  end
		  
		  return json.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Serialize(Extends ref as Dictionary) As Text
		  return Serialize(ref)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SerializeObject(value as Auto) As Auto
		  Using Xojo.Core
		  if value.IsArray() then
		    
		    dim j as new JSONItem()
		    
		    if value.ArrayElementType = Auto.TypeString then
		      // Tableaux de string
		      dim arr() as Text = value
		      for each item as Auto in arr
		        j.Append(item)
		      next
		    elseif value.ArrayElementType = Auto.TypeInteger then
		      // Tableaux de Integer
		      dim arr() as Integer = value
		      for each item as Auto in arr
		        j.Append(item)
		      next
		    elseif value.ArrayElementType = Auto.TypeDouble then
		      // Tableaux de Double
		      dim arr() as Double = value
		      for each item as Auto in arr
		        j.Append(item)
		      next
		    elseif value.ArrayElementType = Auto.TypeBoolean then
		      // Tableaux de Double
		      dim arr() as Boolean = value
		      for each item as Auto in arr
		        j.Append(item)
		      next
		    elseif value.ArrayElementType = Auto.TypeObject then
		      // Tableaux de Double
		      dim arr() as Dictionary = value
		      for each item as Auto in arr
		        j.Append(item)
		      next
		    else
		      return nil
		    end
		    
		    return j
		    
		  elseif value IsA Dictionary then
		    
		    dim j as new JSONItem()
		    dim d as Dictionary = Dictionary(value)
		    
		    for each ent as DictionaryEntry in d
		      j.Value(ent.key) = SerializeObject(ent.Value)
		    next
		    
		    return j
		    
		  end
		  
		  return value
		  
		  
		  //dim j as new JSONItem
		  //
		  //for each key as String in ref.Keys
		  //if ref.Value(key).IsArray then
		  //// Tableaux
		  //dim contents as JSONItem
		  //
		  //for each value as Auto in
		  //
		  //j.Value(key) = contents
		  //elseif ref.Value(key) IsA Dictionary then
		  //// Dictionary
		  //j.Value(key) = Dictionary(ref.Value(key)).SerializeObject()
		  //else
		  //// Autres types
		  //j.Value(key) = ref.Value(key)
		  //end
		  //next
		  //
		  //return j
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Unserialize(serialize as String) As Auto
		  dim j as new JSONItem(serialize)
		  
		  return UnserializeObject(j)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function UnserializeObject(obj as Auto) As Auto
		  if obj IsA JSONItem then
		    dim j as JSONItem = JSONItem(obj)
		    
		    if not j.IsArray() then
		      
		      // JSON OBJECT
		      dim d as new Dictionary()
		      
		      for i as Integer = 0 to j.Count-1
		        dim name as Text = j.Name(i)
		        d.Value(name) = UnserializeObject(j.Value(name))
		      next
		      
		      return d
		      
		    else
		      
		      // JSON ARRAY
		      Raise new BHApplicationException("JSON ARRAY NOT FINISHED") // BUG 1075
		      
		    end
		  end
		  
		  
		  return obj
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
