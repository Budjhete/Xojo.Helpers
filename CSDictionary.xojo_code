#tag Class
Protected Class CSDictionary
Inherits Dictionary
	#tag Method, Flags = &h0
		Function HasKey(key As Variant) As Boolean
		  for i as Integer = 0 to mItems.Ubound
		    if StrComp(mItems(i).Left, key, 0) = 0 then
		      return true
		    end
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Key(index As Integer) As Variant
		  return mItems(index).Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keys() As Variant()
		  dim keys() as Variant
		  
		  for i as Integer = 0 to mItems.Ubound
		    keys.Append(mItems(i).Left)
		  next
		  
		  return keys
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key As Variant)
		  for i as Integer = 0 to mItems.UBound
		    if StrComp(mItems(i).Left, key, 0) = 0 then
		      mItems.Remove(i)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key As Variant) As Variant
		  for i as Integer = 0 to mItems.Ubound
		    if StrComp(mItems(i).Left, key, 0) = 0 then
		      return mItems(i).Right
		    end
		  next
		  
		  raise new KeyNotFoundException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key As Variant, Assigns _value As Variant)
		  if HasKey(key) then
		    for i as Integer = 0 to mItems.Ubound
		      if StrComp(mItems(i).Left, key, 0) = 0 then
		        mItems(i) = new Pair(key, _value)
		      end
		    next
		  else
		    dim pair as new Pair(key, _value)
		    mItems.Append(pair)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Values() As Variant()
		  dim values() as Variant
		  
		  for i as Integer = 0 to mItems.Ubound
		    values.Append(mItems(i).Right)
		  next
		  
		  return values
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mItems() As Pair
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BinCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
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
