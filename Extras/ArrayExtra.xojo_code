#tag Module
Protected Module ArrayExtra
	#tag Method, Flags = &h0
		Sub Append(Extends arr() As Double, arr2() As Double)
		  // Concatenate arr2 to arr.
		  
		  Dim ub2 As Integer = UBound( arr2 )
		  if ub2 < 0 then return
		  
		  Dim base As Integer = UBound( arr ) + 1
		  Redim arr( base + ub2 )
		  
		  Dim index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(Extends arr() As Integer, arr2() As Integer)
		  // Concatenate arr2 to arr.
		  
		  Dim ub2 As Integer = UBound( arr2 )
		  if ub2 < 0 then return
		  
		  Dim base As Integer = UBound( arr ) + 1
		  Redim arr( base + ub2 )
		  
		  Dim index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(Extends arr() as String, arr2() as String)
		  // Concatenate arr2 to arr.
		  
		  Dim ub2 As Integer = UBound( arr2 )
		  if ub2 < 0 then return
		  
		  Dim base As Integer = UBound( arr ) + 1
		  Redim arr( base + ub2 )
		  
		  Dim index As Integer
		  for index = 0 to ub2
		    arr( base + index ) = arr2( index )
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendAll(Extends  ByRef arr() as String, source() as String)
		  for i as Integer = 0 to source.Ubound
		    arr.Append(source(i))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendAll(Extends  ByRef arr() as Text, source() as Text)
		  for i as Integer = 0 to source.Ubound
		    arr.Append(source(i))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoArray(ParamArray pAutos as Auto) As Auto()
		  return pAutos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Average(Extends arr() As Double) As Double
		  // Return the arithmetic mean of the values in the array.
		  Dim item, sum As Double
		  for each item in arr
		    sum = sum + item
		  next
		  return sum / (UBound(arr) + 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Average(Extends arr() As Integer) As Double
		  // Return the arithmetic mean of the values in the array.
		  Dim item, sum As Integer
		  for each item in arr
		    sum = sum + item
		  next
		  return sum / (UBound(arr) + 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As Auto) As Auto()
		  // Return an independent copy of this array.
		  
		  Dim out() As Auto
		  Dim ub As Integer = UBound( arr )
		  if ub >= 0 then
		    Redim out( ub )
		    Dim index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As Double) As Double()
		  // Return an independent copy of this array.
		  
		  Dim out() As Double
		  Dim ub As Integer = UBound( arr )
		  if ub >= 0 then
		    Redim out( ub )
		    Dim index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() As Integer) As Integer()
		  // Return an independent copy of this array.
		  
		  Dim out() As Integer
		  Dim ub As Integer = UBound( arr )
		  if ub >= 0 then
		    Redim out( ub )
		    Dim index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() as String) As String()
		  // Return an independent copy of this array.
		  
		  Dim out() as String
		  Dim ub As Integer = UBound( arr )
		  if ub >= 0 then
		    Redim out( ub )
		    Dim index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends arr() as Text) As Text()
		  // Return an independent copy of this array.
		  
		  Dim out() as Text
		  Dim ub As Integer = UBound( arr )
		  if ub >= 0 then
		    Redim out( ub )
		    Dim index As Integer
		    for index = 0 to ub
		      out( index ) = arr( index )
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() As Double, arr2() As Double) As Double()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Dim out() As Double
		  Dim ub1 As Integer = UBound( arr1 )
		  Dim ub2 As Integer = UBound( arr2 )
		  Redim out( ub1 + ub2 + 1 )
		  Dim index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() As Integer, arr2() As Integer) As Integer()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Dim out() As Integer
		  Dim ub1 As Integer = UBound( arr1 )
		  Dim ub2 As Integer = UBound( arr2 )
		  Redim out( ub1 + ub2 + 1 )
		  Dim index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Concat(Extends arr1() as String, arr2() as String) As String()
		  // Concatenate arr2 to arr1 and return the result as a new array.
		  Dim out() as String
		  Dim ub1 As Integer = UBound( arr1 )
		  Dim ub2 As Integer = UBound( arr2 )
		  Redim out( ub1 + ub2 + 1 )
		  Dim index, base As Integer
		  for index = 0 to ub1
		    out( index ) = arr1( index )
		  next
		  base = ub1 + 1
		  for index = 0 to ub2
		    out( base + index ) = arr2( index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends  ByRef arr() as Auto, search as Auto) As Boolean
		  for i as Integer = 0 to arr.Ubound
		    if arr(i) = search then
		      return true
		    end
		  Next
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends arr() as Integer, value as Integer) As Boolean
		  for i as Integer = 0 to arr.Ubound
		    if arr(i) = value then
		      Return true
		    end if
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends arr() as String, value as String) As Boolean
		  for i as Integer = 0 to arr.Ubound
		    if arr(i).Contains(value) then
		      return true
		    end  // you need TextExtra.Contains
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Difference(Extends arr() as String, values() as String) As String()
		  dim Result() as string
		  
		  For Each element As String In values
		    If Not arr.IndexOf(element)>-1 Then
		      result.Append(element)
		    End If
		  Next
		  
		  return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max(Extends arr() As Double) As Double
		  // Return the greatest of the items in the array, or 0 for an empty array.
		  Dim index, ub As Integer
		  Dim out As Double
		  ub = UBound(arr)
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) > out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max(Extends arr() As Integer) As Integer
		  // Return the greatest of the items in the array, or 0 for an empty array.
		  Dim index, ub As Integer
		  Dim out As Integer
		  ub = UBound(arr)
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) > out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Min(Extends arr() As Double) As Double
		  // Return the least of the items in the array, or 0 for an empty array.
		  Dim index, ub As Integer
		  Dim out As Double
		  ub = UBound(arr)
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) < out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Min(Extends arr() As Integer) As Integer
		  // Return the least of the items in the array, or 0 for an empty array.
		  Dim index, ub As Integer
		  Dim out As Integer
		  ub = UBound(arr)
		  if ub >= 0 then
		    out = arr(0)
		    for index = 1 to ub
		      if arr(index) < out then out = arr(index)
		    next
		  end if
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveByValue(Extends arr() As Double, value as Double)
		  for i as Integer = arr.Ubound DownTo 0
		    if arr(i) = value then
		      arr.Remove(i)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveByValue(Extends arr() As Integer, value as Integer)
		  for i as Integer = arr.Ubound DownTo 0
		    if arr(i) = value then
		      arr.Remove(i)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveByValue(Extends arr() as String, value as String)
		  for i as Integer = arr.Ubound DownTo 0
		    if arr(i) = value then
		      arr.Remove(i)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As Double, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex > toIndex - 1 then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just redim and be done
		  if toIndex - 1 = ub then
		    Redim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Arary.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.Remove fromIndex
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Dim dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  Redim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As Integer, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex >= toIndex then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just redim and be done
		  if toIndex - 1 = ub then
		    Redim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Array.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.Remove fromIndex
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Dim dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  Redim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveSlice(Extends arr() As String, fromIndex As Integer = 0, toIndex As Integer = 0)
		  // Deletes a portion of the array.
		  // See "Slice Indexing" note.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  if fromIndex > toIndex - 1 then return  // empty (or invalid) range
		  
		  // easy case: deleting the end of the array, we can just redim and be done
		  if toIndex -1 = ub then
		    Redim arr( fromIndex - 1 )
		    return
		  end if
		  
		  // another easy case: deleting just one element (equivalent to Arary.Remove)
		  if fromIndex = toIndex - 1 then
		    arr.Remove fromIndex
		    return
		  end if
		  
		  // harder case: copy the data down, and THEN redim
		  Dim dest, src As Integer
		  dest = fromIndex
		  for src = toIndex to ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  next
		  Redim arr( dest - 1 )
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() As Double)
		  // Reverse the order of the elements in the array, in place.
		  
		  Dim low, high, midpoint As Integer
		  high = UBound( arr )
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Dim temp As Double = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() As Integer)
		  // Reverse the order of the elements in the array, in place.
		  
		  Dim low, high, midpoint As Integer
		  high = UBound( arr )
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Dim temp As Integer = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reverse(Extends arr() as String)
		  // Reverse the order of the elements in the array, in place.
		  
		  Dim low, high, midpoint As Integer
		  high = UBound( arr )
		  if high < 1 then return
		  
		  midpoint = (high + 1) \ 2
		  while low < midpoint
		    Dim temp as String = arr(low)
		    arr(low) = arr(high)
		    arr(high) = temp
		    low = low + 1
		    high = high - 1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As Double, fromIndex As Integer = 0, toIndex As Integer = 0) As Double()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Dim out() As Double
		  Dim outbound As Integer = toIndex - fromIndex - 1
		  Redim out( outbound )
		  Dim index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As Integer, fromIndex As Integer = 0, toIndex As Integer = 0) As Integer()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Dim out() As Integer
		  Dim outbound As Integer = toIndex - fromIndex - 1
		  Redim out( outbound )
		  Dim index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slice(Extends arr() As String, fromIndex As Integer = 0, toIndex As Integer = 0) As String()
		  // Return a subset of the given array.
		  // See "Slice Indexing" note.
		  
		  // Note that if fromIndex and toIndex span the entire array, then
		  // this function is equivalent to Clone.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  Dim out() as String
		  Dim outbound As Integer = toIndex - fromIndex - 1
		  Redim out( outbound )
		  Dim index As Integer
		  for index = 0 to outbound
		    out( index ) = arr( fromIndex + index )
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As Double, fromIndex As Integer, toIndex As Integer, arrayToInsert() As Double, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Dim srcub As Integer = UBound( arrayToInsert )
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Dim qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Dim qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Dim roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Dim srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.Insert destPos, arrayToInsert( srcPos )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As Integer, fromIndex As Integer, toIndex As Integer, arrayToInsert() As Integer, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Dim srcub As Integer = UBound( arrayToInsert )
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Dim qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Dim qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Dim roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Dim srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.Insert destPos, arrayToInsert( srcPos )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Splice(Extends arr() As String, fromIndex As Integer, toIndex As Integer, arrayToInsert() As String, srcFrom As Integer = 0, srcTo As Integer = 0)
		  // This function replaces a section (or slice) of the base array with the contents
		  // of another array.  The range replaced is specified with from/to indices, which
		  // may be negative, in which case they count from the end of the array (just as
		  // with the Slice method).  The data to insert comes from arrayToInsert, and is
		  // specified in the same way -- by default, this is the entire source array.
		  
		  Dim ub As Integer = UBound( arr )
		  if fromIndex < 0 then fromIndex = ub + 1 + fromIndex
		  if toIndex <= 0 then toIndex = ub + 1 + toIndex
		  
		  Dim srcub As Integer = UBound( arrayToInsert )
		  if srcFrom < 0 then srcFrom = srcub + 1 + srcFrom
		  if srcTo <= 0 then srcTo = srcub + 1 + srcTo
		  
		  // First, see whether we need to insert or remove items to make room.
		  Dim qtyRemoving As Integer = toIndex - fromIndex
		  if qtyRemoving < 0 then return
		  Dim qtyInserting As Integer = srcTo - srcFrom
		  if qtyInserting < 0 then qtyInserting = 0  // this is OK, just removes the dest slice
		  Dim roomNeeded As Integer = qtyInserting - qtyRemoving
		  
		  // Use RemoveSlice to remove any extra space.
		  if roomNeeded < 0 then
		    arr.RemoveSlice fromIndex, fromIndex - roomNeeded
		  end if
		  
		  // Replace or insert values as needed.
		  Dim srcPos, destPos As Integer
		  destPos = fromIndex
		  for srcPos = srcFrom to srcTo - 1
		    if destPos < toIndex then
		      arr(destPos) = arrayToInsert( srcPos )
		    else
		      arr.Insert destPos, arrayToInsert( srcPos )
		    end if
		    destPos = destPos + 1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Total(Extends arr() As Double) As Double
		  // Return the total sum of the items in the array.
		  Dim item, out As Double
		  for each item in arr
		    out = out + item
		  next
		  return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Total(Extends arr() As Integer) As Integer
		  // Return the total sum of the items in the array.
		  Dim item, out As Integer
		  for each item in arr
		    out = out + item
		  next
		  return out
		  
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
