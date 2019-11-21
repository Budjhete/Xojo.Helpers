#tag Class
Protected Class Crc32
	#tag Method, Flags = &h0
		Sub Constructor()
		  if not estTableCree_ then
		    CreerTable()
		  end
		  
		  reset()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub CreerTable()
		  if estTableCree_ then
		    return
		  end
		  
		  Dim n As Uint32
		  Dim k As Uint32
		  Dim c As Uint32
		  
		  For n = 0 To 255
		    c = n
		    For k = 1 To 8
		      if Bitwise.BitAnd(c, 1) <> 0 then
		        c = Bitwise.BitXor(&hEDB88320, Bitwise.ShiftRight(c, 1))
		      else
		        c = Bitwise.ShiftRight(c, 1)
		      end
		    Next
		    table_.Append(c)
		  Next
		  
		  estTableCree_ = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getHexValue() As String
		  return hex(getValue())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getValue() As Integer
		  return Bitwise.BitXor(crc_, &hFFFFFFFF)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reset()
		  crc_ = &hFFFFFFFF
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(bytes() as Byte)
		  for i as Integer = 0 to bytes.Ubound
		    update(bytes(i))
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(c as Byte)
		  dim index as Integer = Bitwise.BitAnd(Bitwise.BitXor(crc_, c), &hFF)
		  crc_ = Bitwise.BitXor(Bitwise.ShiftRight(crc_, 8), table_(index))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(mb as MemoryBlock)
		  for i as Integer = 0 to (mb.Size-1)
		    update(mb.Byte(i))
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update(str as String)
		  dim mb as MemoryBlock
		  mb = str
		  
		  update(mb)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private crc_ As Uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared estTableCree_ As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared table_() As Uint32
	#tag EndProperty


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
End Class
#tag EndClass
