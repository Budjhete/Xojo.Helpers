#tag Module
Protected Module BooleanExtra
	#tag Method, Flags = &h0
		Function IntegerValue(Extends pBoolean As Boolean) As Integer
		  If pBoolean Then
		    Return 1
		  Else
		    Return 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextValue(Extends pBoolean As Boolean) As Text
		  If pBoolean Then
		    Return "True"
		  Else
		    Return "False"
		  End If
		End Function
	#tag EndMethod


End Module
#tag EndModule
