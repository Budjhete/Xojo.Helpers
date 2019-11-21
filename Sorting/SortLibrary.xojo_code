#tag Module
Protected Module SortLibrary
	#tag Method, Flags = &h0
		Sub BubbleSort(obj as SortInterface, indexFrom as Integer = 0, indexTo as Integer)
		  Dim i, j as Integer
		  j = indexTo
		  while indexFrom < j
		    for i = indexFrom to j-1
		      if obj.Compare(i, i+1) > 0 then
		        obj.Swap(i, i+1)
		      end
		    next
		    j = j - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function partition(obj as SortInterface, p0 as Integer, r as Integer) As Integer
		  Dim p, j, mid as Integer
		  mid = (p0 + r) / 2
		  p = p0 - 1
		  j = r + 1
		  do
		    do
		      j = j - 1
		    loop until j = mid or obj.Compare(j, mid) < 0
		    do
		      p = p + 1
		    loop until p = mid or obj.Compare(p, mid) > 0
		    if p < j then
		      if p > mid then
		        mid = p
		      end
		      if j < mid then
		        mid = j
		      end
		      obj.Swap(p, j)
		      if p = mid then
		        mid = j
		        j = j + 1
		      elseif j = mid then
		        mid = p
		        p = p - 1
		      end
		    else
		      if mid = r then
		        return mid-1
		      else
		        return mid
		      end
		    end
		  loop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QuickSort(obj as SortInterface, indexFrom as Integer = 0, indexTo as Integer)
		  Dim f, q as Integer
		  f = indexFrom
		  while f < indexTo
		    q = partition(obj, f, indexTo)
		    QuickSort(obj, f, q)
		    f = q + 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort(obj as SortInterface, indexFrom as Integer = 0, indexTo as Integer)
		  QuickSort(obj, indexFrom, indexTo)
		End Sub
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
