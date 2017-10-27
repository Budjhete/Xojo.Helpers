#tag Class
Protected Class Version
	#tag Method, Flags = &h0
		Sub Constructor(major as Integer, minor as Integer, bug as Integer = 0, release as Integer = 0)
		  Me.Major = major
		  Me.Minor = minor
		  Me.Bug = bug
		  Me.Release = release
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pVersion as String)
		  dim chunk() as String = pVersion.Split(".")
		  
		  if chunk.Ubound >= 0 then
		    Me.Major = chunk(0).IntegerValue
		  end
		  
		  if chunk.Ubound >= 1 then
		    Me.Minor = chunk(1).IntegerValue
		  end
		  
		  if chunk.Ubound >= 2 then
		    Me.Bug = chunk(2).IntegerValue
		  end
		  
		  if chunk.Ubound >= 3 then
		    Me.Release = chunk(3).IntegerValue
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue() As Integer
		  // Get an integer representing the version relative value
		  
		  Return 1000000 * Me.Major + 1000 * Me.Minor + Me.Bug
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(pVersion as Version) As Integer
		  If pVersion = Nil Then
		    Return -1
		  End
		  
		  dim a, b as Integer
		  
		  a = me.IntegerValue
		  b = pVersion.IntegerValue
		  
		  If Me.IntegerValue > pVersion.IntegerValue Then Return 1
		  If Me.IntegerValue = pVersion.IntegerValue Then Return 0
		  If Me.IntegerValue < pVersion.IntegerValue Then Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParsedVersion(pString as String) As Version
		  if not pString.Test("^\d+(\.\d+)?(\.\d+)?(\.\d+)?$") then
		    return nil
		  end
		  
		  return new Version(pString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  dim version as String = Str(Major) + "." + Str(Minor)
		  
		  if bug > 0 then
		    version = version + "." + Str(bug)
		  end
		  
		  return version
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Bug As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Major As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Minor As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Release As Integer = 0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bug"
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
			Name="Major"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minor"
			Group="Behavior"
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
			Name="Release"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
