#tag Module
Protected Module iOSSQLDatabaseExtra
	#tag Method, Flags = &h0
		Sub Commit(Extends pDB as iOSSQLiteDatabase)
		  pDB.SQLExecute("COMMIT")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldSchema(Extends pDB as iOSSQLiteDatabase, pTable as text) As iOSSQLiteRecordSet
		  Return pDB.SQLSelect("PRAGMA table_info("+pTable+");")
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
