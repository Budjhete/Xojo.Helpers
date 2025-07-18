#tag Module
Protected Module RecordSetExtra
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function CurrencyValueClean(Extends field as DatabaseColumn, default as Currency = 0.00) As Currency
		  if field.StringValue.Contains("e") then
		    Return 0.0000
		  else
		    Return field.CurrencyValue
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function CurrencyValueClean(Extends field as DatabaseField, default as Currency = 0.00) As Currency
		  if field.StringValue.Contains("e") then
		    Return 0.0000
		  else
		    Return field.CurrencyValue
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function TextValue(Extends str as DatabaseField) As Text
		  Return str.StringValue.DefineEncoding(Encodings.UTF8).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
		Function Utf8StringValue(Extends field as DatabaseColumn, default as String = "") As String
		  if field.Value.IsNull() then
		    return default
		  end
		  
		  
		  return field.StringValue.DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function Utf8StringValue(Extends field as DatabaseField, default as String = "") As String
		  if field.Value.IsNull() then
		    return default
		  end
		  
		  return field.StringValue.DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
