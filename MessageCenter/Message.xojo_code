#tag Class
Protected Class Message
Inherits Xojo.Core.Dictionary
	#tag Method, Flags = &h0
		Sub Constructor(type as Variant = nil, sender as Object = nil)
		  mType = type
		  mSender = Sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(key as String) As Variant
		  if mStorage <> nil and mStorage.HasKey(key) then
		    return mStorage.Value(key)
		  end
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasData(key as String) As Boolean
		  return mStorage <> nil and mStorage.HasKey(key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(key As Variant)
		  if mStorage <> nil and mStorage.HasKey(key) then
		    mStorage.Remove(key)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sender() As Object
		  return mSender
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(key as String, value as Variant)
		  if mStorage = nil then
		    mStorage = new Dictionary()
		  end
		  
		  mStorage.Value(key) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As Text
		  return mType.AutoTextValue + "(" + me.Join("&", "=") + ")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As Variant
		  return mType
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mSender As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStorage As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As Auto
	#tag EndProperty


	#tag ViewBehavior
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
