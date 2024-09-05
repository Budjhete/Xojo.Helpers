#tag Module
Protected Module StringExtra
	#tag Method, Flags = &h0
		Function AssignVars(Extends str as String, ParamArray vars as Pair) As String
		  For Each p as Pair in vars
		    str = str.ReplaceAll("$"+p.Left, p.Right)
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(Extends str as String, ParamArray vars as String) As String
		  dim i as Integer = 1
		  For Each v as String in vars
		    str = str.ReplaceAll("$"+Str(i), v)
		    i = i + 1
		  Next
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(str as String, vars as Dictionary) As String
		  for each key as String in vars.Keys
		    str = str.ReplaceAll("$"+key, vars.Value(key))
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(str as String, ParamArray vars as String) As String
		  dim i as Integer = 1
		  For Each v as String in vars
		    str = str.ReplaceAll("$"+Str(i), v)
		    i = i + 1
		  Next
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseConvert(Extends str as String, fromBase as Integer, toBase as Integer) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseTable(base as Integer) As String
		  if base = 2 then
		    return kBaseTable2
		  elseif base = 8 then
		    return kBaseTable8
		  elseif base = 10 then
		    return kBaseTable10
		  elseif base = 16 then
		    return kBaseTable16
		  elseif base <=36 then
		    return kBaseTable36.Left(base+1)
		  elseif base = 34 then
		    return kBaseTable64
		  end
		  
		  Raise new InvalidArgumentsException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(Extends pString As String) As Boolean
		  pString = pString.ReplaceAll(" ", "")
		  
		  
		  if pString.IsNumeric then
		    return pString.ToInteger.BooleanValue
		  else
		    if pString = "True" or pString = "Vrai" then
		      return True
		    else
		      return False
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Capitalize(extends s as String) As String
		  dim first as String = s.CharAt(0)
		  
		  if first.Asc < 97 or first.Asc > 122 then
		    return s
		  end if
		  
		  first = Chr(first.Asc - &h20)
		  return first + s.Middle(1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharAt(Extends str as String, position as Integer) As String
		  return str.Middle(position, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CharAt(Extends ByRef str As String, position as Integer, Assigns char as String)
		  if position > str.Length then
		    raise new OutOfBoundsException
		  end if
		  str = str.Left(position -1) + char + str.Middle(position + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Chop(s As String, charsToCut As Integer) As String
		  // Return s with the rightmost 'charsToCut' chars removed.
		  
		  Dim charsLeft As Integer = s.Length - charsToCut
		  if charsLeft <= 0 then return ""
		  return s.Left( s.Length - charsToCut )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Chop(s As String, stringToCut As String) As String
		  // Chops 'stringToCut' off of s, if stringToCut is found at the end.
		  // Useful for removing file extensions, trailing punctuation, etc.
		  
		  Dim cutLen As Integer = stringToCut.Length
		  if s.Right( cutLen) = stringToCut then
		    return s.Left( s.Length - cutLen )
		  else
		    return s
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ChopB(s As String, bytesToCut As Integer) As String
		  // Return s with the rightmost 'bytesToCut' bytes removed.
		  
		  Dim bytesLeft As Integer = s.Bytes - bytesToCut
		  if bytesLeft <= 0 then return ""
		  return s.LeftBytes( s.LenB - bytesToCut )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ChopB(s As String, stringToCut As String) As String
		  // Chops 'stringToCut' off of s, if stringToCut is found at the end.
		  // Useful for removing file extensions, trailing punctuation, etc.
		  
		  Dim cutLenB As Integer = stringToCut.LenB
		  if StrComp( s.RightBytes(cutLenB), stringToCut, 0 ) = 0 then
		    return s.LeftBytes( s.LenB - cutLenB )
		  else
		    return s
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
		Function CHR(numchar as Integer) As string
		  Var enc As TextEncoding = Encodings.UTF8 
		  return enc.Chr(numchar)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clean(Extends str as String) As String
		  return str.ReplaceRegExp("\s+", " ").Trim()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function cleanCSV(Extends str as String) As String
		  str = str.ReplaceAll(Encodings.UTF8.Chr(22), Encodings.UTF8.Chr(22)+Encodings.UTF8.Chr(22)+Encodings.UTF8.Chr(22)) // return carriage
		  return str
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function cleanJSON(Extends str as String) As String
		  str = str.ReplaceAll(Encodings.UTF8.Chr(13), "\r") // return carriage
		  str = str.ReplaceAll(Encodings.UTF8.Chr(12), "\f")  // form feed
		  str = str.ReplaceAll(Encodings.UTF8.Chr(10), "\n") // new line
		  str = str.ReplaceAll(Encodings.UTF8.Chr(9), "\t") // tab
		  
		  return str
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends str as String, search() as String) As Boolean
		  for i as Integer = 0 to search.Ubound
		    if str.Contains(search(i)) then
		      Return true
		    end if // you need StringExtra.Contains
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API1Only or true
		Function Contains(Extends str as String, search as String) As Boolean
		  return str.InStr(search) > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsB(Extends str as String, search as String) As Boolean
		  return str.InStrB(search) > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountAll(Extends str as String, find as String) As Integer
		  dim total as Integer = 0
		  dim position as Integer = 1
		  
		  while position > 0
		    position = str.InStr(position, find)
		    
		    if position > 0 then
		      total = total + 1
		      position = position + 1
		    end
		  wend
		  
		  return total
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CsvSplit(Extends str as String, separator as String = ",", enclose as String = "", escape as String = "\") As String()
		  dim parts() as String = str.Split(separator)
		  
		  if enclose <> "" then
		    for i as Integer = 0 to parts.Ubound
		      dim ret as RegExMatch = parts(i).Search("^\s*"+enclose+"(.*)"+enclose+"\s*$")
		      if ret <> nil then
		        parts(i) = ret.SubExpressionString(1)
		      end
		    next
		  end
		  
		  return parts
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrencyValue(Extends pString As String) As Currency
		  pString = pString.ReplaceAll(" ", "")
		  
		  Dim pVariant As Variant = pString.ReplaceAll(",", ".").ToDouble
		  
		  Return pVariant.CurrencyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Decimal(Extends str as String, default as String = "") As String
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  elseif not str.test("^\-?\d+") then
		    return default
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.\-]+", "")
		  
		  return str.DoubleValue.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete(Extends str As String, text as String) As String
		  return str.ReplaceAll(text, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(Extends pString As String) As Double
		  pString = pString.ReplaceAll(" ", "")
		  
		  Dim pVariant As Variant = pString.ReplaceAll(" ", "").ToDouble
		  
		  Return pVariant.DoubleValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function EndsWith(Extends str as String, search() as String) As Boolean
		  for i as Integer = 0 to search.Ubound
		    if str.Right(search(i).Len) = search(i) then
		      Return true
		    end if // you need StringExtra.Contains
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entier(Extends str as String, default as String = "") As String
		  if not str.test("^\d+") then
		    return default
		  end
		  
		  return str(str.IntegerValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapeJSON(Extends str as String) As String
		  'str = str.ReplaceAll("\", "\\")
		  str = str.ReplaceAll(Encodings.UTF8.Chr(13), "\r") // return carriage
		  str = str.ReplaceAll(Encodings.UTF8.Chr(12), "\f")  // form feed
		  str = str.ReplaceAll(Encodings.UTF8.Chr(10), "\n") // new line
		  str = str.ReplaceAll(Encodings.UTF8.Chr(9), "\t") // tab
		  str = str.ReplaceAll(Encodings.UTF8.Chr(34), "\"+Encodings.UTF8.Chr(34)) // double quote
		  
		  return str
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapeRegExMetacharacters(Extends str as String) As String
		  str = str.ReplaceAll("\", "\\")
		  str = str.ReplaceAll("[", "\[")
		  str = str.ReplaceAll("^", "\^")
		  str = str.ReplaceAll("$", "\$")
		  str = str.ReplaceAll(".", "\.")
		  str = str.ReplaceAll("|", "\|")
		  str = str.ReplaceAll("?", "\?")
		  str = str.ReplaceAll("*", "\*")
		  str = str.ReplaceAll("+", "\+")
		  str = str.ReplaceAll("(", "\(")
		  str = str.ReplaceAll(")", "\(")
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillLeft(Extends str as String, padding As String, length As Integer) As String
		  while str.Length < length
		    str = padding + str
		  wend
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillRight(Extends str as String, padding As String, length As Integer) As String
		  while str.Length < length
		    str = str + padding
		  wend
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As String, pReplacements As Dictionary) As String
		  For Each pKey As String In pReplacements.Keys
		    pString = pString.ReplaceAll("{" + pKey + "}", pReplacements.Value(pKey))
		  Next
		  
		  Return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As String, ParamArray pReplacements As Pair) As String
		  Dim pDictionary As New Dictionary
		  
		  For Each pReplacement As Pair In pReplacements
		    pDictionary.Value(pReplacement.Left) = pReplacement.Right
		  Next
		  
		  Return pString.Format(pDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As String, pReplacements() As String) As String
		  For pIndex As Integer = 0 To pReplacements.Ubound
		    pString = pString.ReplaceAll("{" + Str(pIndex) + "}", pReplacements(pIndex))
		  Next
		  
		  For Each pReplacement As String In pReplacements
		    pString = pString.Replace("{}", pReplacement)
		  Next
		  
		  Return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As String, ParamArray pReplacements As String) As String
		  Return pString.Format(pReplacements)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FromBase(Extends str as String, base as Integer) As Integer
		  dim num as Integer = 0
		  dim exponent as Integer = 0
		  dim facteur as Integer
		  dim table as String = BaseTable(base)
		  
		  
		  for i as Integer = str.Length DownTo 1
		    dim char as String = str.CharAt(i)
		    facteur = (table.IndexOf(char) - 1)
		    if facteur < 0 then
		      Raise new InvalidArgumentsException
		    end
		    
		    num = num + facteur * pow(base, exponent)
		    exponent = exponent + 1
		  next
		  
		  return num
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Hash(s As String) As Integer
		  // Return the hash value of the given string, as used by RB's
		  // Variant and Dictionary classes.
		  
		  Dim v As Variant
		  v = s
		  return v.Hash
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexToInt(Extends str as String) As Integer
		  return Val("&h"+str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hyphenate(Extends str as String) As String
		  return str.Clean.Lowercase.ReplaceAll(" ", "-")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrRegEx(Extends str as String, pattern as String, params as String = "") As Integer
		  dim match as RegExMatch = str.Search("^(.*?)"+pattern, params)
		  if match = nil then
		    return 0
		  end
		  
		  return (match.SubExpressionString(1).Length+1)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrReverse(Extends source As String, startPos As Integer = - 1, substr As String) As Integer
		  // Similar to InStr, but searches backwards from the given position
		  // (or if startPos = -1, then from the end of the string).
		  // If substr can't be found, returns 0.
		  
		  Dim srcLen As Integer = source.Length
		  if startPos = -1 then startPos = srcLen
		  
		  // Here's an easy way...
		  // There may be a faster implementation, but then again, there may not -- it probably
		  // depends on the particulars of the data.
		  Dim reversedSource As String = Reverse(source)
		  Dim reversedSubstr As String = Reverse(substr)
		  Dim reversedPos As Integer
		  reversedPos = reversedSource.IndexOf( srcLen - startPos + 1, reversedSubstr )
		  if reversedPos < 1 then return 0
		  return srcLen - reversedPos - substr.Length + 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrReverseB(Extends source As String, startPosB As Integer = - 1, substr As String) As Integer
		  // Similar to InStrB, but searches backwards from the given position
		  // (or if startPosB = -1, then from the end of the string).
		  // If substr can't be found, returns 0.
		  
		  Dim srcLen As Integer = source.LenB
		  Dim subLen As Integer = substr.LenB
		  if startPosB = -1 then startPosB = srcLen
		  
		  // We'll do a simple sequential search.  A Boyer-Moore algorithm
		  // would work better in many cases, but we'd have to rewrite the
		  // whole algorithm to work backwards.  The sequential search will
		  // be good enough in most cases anyway.
		  Dim posB As Integer
		  for posB = Min( srcLen - subLen + 1, startPosB ) downTo 1
		    if StrComp( source.MiddleBytes( posB, subLen ), substr, 0 ) = 0 then return posB
		  next posB
		  
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends pString As String) As Integer
		  return CType(Val(pString), Integer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinCSV(Extends pStrings() As String) As String
		  // RFC 4180
		  
		  Dim pValues() As String
		  
		  For pIndex As Integer = 0 To pStrings.Ubound
		    // Quote quote and quote that
		    pValues.Append(Chr(34) + pStrings(pIndex).Replace(Chr(34), Chr(34) + Chr(34)) + Chr(34))
		  Next
		  
		  Return String.FromArray(pValues, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastIndexOf(Extends str as String, find as String) As Integer
		  dim chunks() as String = str.Split(find)
		  if chunks.Ubound = 0 then
		    return -1
		  end
		  
		  dim pos as Integer = chunks.Ubound * find.Length
		  for i as Integer = 0 to (chunks.Ubound-1)
		    pos = pos + chunks(i).Length
		  next
		  
		  return pos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function LTrim(Extends source As String, charsToTrim As String) As String
		  // This is an extended version of RB's LTrim function that lets you specify
		  // a set of characters to trim.
		  
		  Dim srcLen As Integer = source.Len
		  Dim leftPos, i As Integer
		  for i = 1 to srcLen
		    if InStr( charsToTrim, Mid(source, i, 1) ) = 0 then exit
		  next
		  leftPos = i
		  if leftPos > srcLen then return ""
		  
		  return Mid( source, leftPos )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function Money(Extends str as String, default as String = "") As String
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.-]+", "")
		  
		  if not str.test("\-?\d+") then
		    return default
		  end
		  
		  return Val(str).MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function MoneyPositive(Extends str as String, default as String = "") As String
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.]", "")
		  
		  if not str.test("\d+") then
		    return default
		  end
		  
		  return Val(str).MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pString As String) As String
		  Return pString.CurrencyValue.MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
		Function MoneyValue(Extends pString As String, pUnit As String) As String
		  Return pString.CurrencyValue.MoneyValue(pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function MoneyValue(Extends pString as String, pUnit as String, pDecimal as integer = 2) As String
		  dim nFormat as string = "-##0.00"
		  
		  for i as Integer = 2 to pDecimal
		    nFormat = nFormat + "#"
		  next
		  
		  Return pString.CurrencyValue.MoneyValue(nFormat, pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
		Function MoneyValue(Extends pString as String, pUnit as String, pDecimal as integer = 2, pFormat as string = "##0.00;-##0.00;0.00") As String
		  
		  for i as Integer = 2 to pDecimal
		    pFormat = pFormat + "#"
		  next
		  
		  Return pString.CurrencyValue.MoneyValue(pFormat, pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function Number(Extends str as String, default as String = "") As String
		  if not str.test("^\d+") then
		    return default
		  end
		  
		  str = str.ReplaceAll(",", ".")
		  str = str.ReplaceAllRegExp("[^\d\.]+", "")
		  
		  return Str(str.toInt)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Padding(Extends str as String, width as Integer, character as String = " ", alignment as PaddingAlignment = PaddingAlignment.Right) As String
		  if character.Length <> 1 then
		    Raise new InvalidArgumentsException()
		  end
		  
		  dim diff as Integer = (width - str.Length)
		  if diff <= 0 then
		    return str
		  end
		  
		  if alignment = PaddingAlignment.Left then
		    return str.FillLeft(character, width)
		  elseif alignment = PaddingAlignment.Right then
		    return str.FillRight(character, width)
		  else
		    dim left as Integer = diff/2
		    
		    return str.FillLeft(character, str.Length+left).FillRight(character, width)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomString(len As Integer, source as String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890") As String
		  Dim str, num As String
		  Dim nbChars, start, i As Integer
		  nbChars = source.Length( )
		  
		  for i = 1 To len
		    Dim r as New Random
		    start = r.InRange(1, nbChars)
		    num = source.Middle( start, 1 )
		    str = str + num
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Repeat(Extends str As String, multiplier As Integer) As String
		  dim result As String = ""
		  
		  while multiplier > 0
		    result = result + str
		    multiplier = multiplier - 1
		  wend
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAccents(Extends pString as String) As String
		  // Remplace les caractères accentués par leurs équivalents non-accentués
		  
		  Dim pFrom As String = "à,á,â,ã,ä,ç,è,é,ê,ë,ì,í,î,ï,ñ,ò,ó,ô,õ,ö,ù,ú,û,ü,ý,ÿ,À,Á,Â,Ã,Ä,Ç,È,É,Ê,Ë,Ì,Í,Î,Ï,Ñ,Ò,Ó,Ô,Õ,Ö,Ù,Ú,Û,Ü,Ý"
		  Dim pTo As String = "a,a,a,a,a,c,e,e,e,e,i,i,i,i,n,o,o,o,o,o,u,u,u,u,y,y,A,A,A,A,A,C,E,E,E,E,I,I,I,I,N,O,O,O,O,O,U,U,U,U,Y"
		  
		  For pIndex As Integer = 0 To pFrom.CountFields(",")
		    pString = pString.ReplaceAll(pFrom.NthField(",", pIndex), pTo.NthField(",", pIndex))
		  next
		  
		  return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit))
		Function ReplaceAllRegExp(Extends str as String, pattern as String, replace as String, params as String = "") As String
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  opts.Greedy = params.Contains("U")
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  opts.ReplaceAllMatches = True
		  
		  reg.SearchPattern = pattern
		  reg.ReplacementPattern = replace
		  reg.Options = opts
		  
		  return reg.Replace(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceRegExp(Extends str as String, pattern as String, replace as String, params as String = "") As String
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  opts.Greedy = params.Contains("U")
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  opts.ReplaceAllMatches = False
		  
		  reg.SearchPattern = pattern
		  reg.ReplacementPattern = replace
		  reg.Options = opts
		  
		  return reg.Replace(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Reverse(s As String) As String
		  // Return s with the characters in reverse order.
		  
		  if s.Length < 2 then return s
		  
		  Dim characters() as String = s.Split( "" )
		  Dim leftIndex as Integer = 0
		  Dim rightIndex as Integer = UBound(characters)
		  #pragma BackgroundTasks False
		  While leftIndex < rightIndex
		    Dim temp as String = characters(leftIndex)
		    characters(leftIndex) = characters(rightIndex)
		    characters(rightIndex) = temp
		    leftIndex = leftIndex + 1
		    rightIndex = rightIndex - 1
		  Wend
		  Return String.FromArray(characters,"")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Search(Extends str as String, pattern as String, params as String = "") As RegExMatch
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  opts.Greedy = params.Contains("U")
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  
		  reg.SearchPattern = pattern
		  reg.Options = opts
		  
		  return reg.search(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SearchAll(Extends str as String, pattern as String, params as String = "") As RegExMatch()
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  dim match as RegExMatch
		  dim matches() as RegExMatch
		  dim doLoop as Boolean = false
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  opts.Greedy = params.Contains("U")
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  
		  reg.SearchPattern = pattern
		  reg.Options = opts
		  
		  match = reg.Search(str)
		  if match <> nil then
		    matches.Append(match)
		    doLoop = true
		  end
		  
		  while doLoop
		    match = reg.Search()
		    
		    if match <> nil then
		      matches.Append(match)
		    else
		      doLoop = false
		    end
		  wend
		  
		  
		  return matches
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Slugalize(Extends pString as String) As String
		  Return pString.ReplaceAccents. _
		  ReplaceAllRegExp("[\W\s]+", " "). _ // replace non-word and space by space
		  Trim. _ // trim beginning and ending spaces
		  ReplaceAll(" ", "-")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SlugalizeButKeepDots(Extends pString as String) As String
		  Return pString.ReplaceAccents. _
		  ReplaceAllRegExp("[^0-9a-zA-Z.-]+", " "). _ // replace non-word and space by space
		  Trim. _ // trim beginning and ending spaces
		  ReplaceAll(" ", "_").ReplaceAll("\", "-")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitAndKeep(Extends source as String, delimiter as String = " ") As String()
		  dim parts() as String
		  
		  parts = source.Split(delimiter)
		  
		  for i as Integer = (parts.Ubound-1) DownTo 0
		    parts.Insert(i+1, delimiter)
		  next
		  
		  return parts
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SplitCSV(Extends pString As String) As String()
		  Return SplitCommaSeparatedValuesMBS(pString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function SplitMultiple(Extends source as String, delimiters() as String) As String()
		  dim parts() as String
		  dim parts2() as String
		  dim result() as String
		  
		  delimiters = delimiters.Clone()
		  dim delimiter as String = delimiters.Pop()
		  
		  parts = source.Split(delimiter)
		  if delimiters.Ubound < 0 then
		    return parts
		  end
		  
		  for each part as String in parts
		    parts2 = part.SplitMultiple(delimiters)
		    result.AppendAll(parts2)
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function SplitMultiple(Extends source as String, delimiters as String) As String()
		  return source.SplitMultiple(delimiters.Split(""))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function SplitMultipleAndKeep(Extends source as String, delimiters as String) As String()
		  return source.SplitMultipleAndKeep(delimiters.Split(""))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = API2Only and ( (TargetConsole and (Target64Bit)) or  (TargetWeb and (Target64Bit)) or  (TargetDesktop and (Target64Bit)) or  (TargetIOS and (Target64Bit)) )
		Function Sprintf(format as String, args() as Variant) As String
		  
		  dim matches() as RegExMatch = format.SearchAll("%(b|c|d|u|f|o|s|x|X)")
		  dim match as RegExMatch
		  
		  dim replace as String
		  dim arg as Variant
		  
		  if matches.Ubound <> Ubound(args) then
		    Raise new InvalidArgumentsException
		  end
		  
		  for i as Integer = 0 to matches.Ubound
		    replace = ""
		    match = matches(i)
		    arg = args(i)
		    
		    Select Case match.SubExpressionString(1)
		    Case "s"
		      replace = arg.StringValue
		    Case "d"
		      replace = arg.IntegerValue.ToString
		    Case "f"
		      replace = arg.DoubleValue.ToString
		    Case "u"
		      replace = arg.IntegerValue.ToString
		    Case "c"
		      replace = Text.FromUnicodeCodepoint(arg.IntegerValue)
		    Case "b"
		      ' Integer -> binaire
		    Case "o"
		      ' Integer -> octal
		    Case "x"
		      ' Integer -> hexadecimal
		    Case "X"
		      ' Integer -> hexadecimal
		    End
		    
		    format = format.Replace(match.SubExpressionString(0), replace)
		  next
		  
		  return format
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Test(Extends str as String, pattern as String, params as String = "") As Boolean
		  return str.Search(pattern, params) <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toCurrency(Extends str as String) As Currency
		  return Val(str.MoneyValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function toDouble(Extends str as String) As Double
		  return Val(str.Decimal())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toInt(Extends str as String) As Integer
		  return CType(Val(str), Integer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToText(Extends s() as String) As String()
		  dim Tss() as String
		  For each ss as string in s
		    tss.Append(ss.ToText)
		  Next
		  
		  return tss
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetAndroid and (Target64Bit))
		Function Trim(Extends source As String, charsToTrim As String) As String
		  // This is an extended version of RB's Trim function that lets you specify
		  // a set of characters to trim.
		  
		  Dim srcLen As Integer = source.Length
		  Dim leftPos, i As Integer
		  for i = 1 to srcLen
		    if charsToTrim.IndexOf( source.Middle( i, 1) ) = 0 then exit
		  next
		  leftPos = i
		  if leftPos > srcLen then return ""
		  
		  Dim rightPos As Integer
		  for i = srcLen DownTo 1
		    if charsToTrim.IndexOf( source.Middle( i, 1) ) = 0 then exit
		  next
		  rightPos = i
		  
		  return  source.Middle(leftPos, rightPos - leftPos + 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLDecode(Extends pString As String) As String
		  Return DecodeURLComponent(pString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLEncode(Extends pString As String) As String
		  Return EncodeURLComponent(pString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantValue(Extends pStrings() As String) As Variant()
		  Dim pVariants() As Variant
		  
		  For Each pString As String In pStrings
		    pVariants.Append(pString)
		  Next
		  
		  Return pVariants
		End Function
	#tag EndMethod


	#tag Note, Name = Required
		
		TextExtra
	#tag EndNote


	#tag Constant, Name = kBaseTable10, Type = String, Dynamic = False, Default = \"0123456789", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable16, Type = String, Dynamic = False, Default = \"0123456789ABCDEF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable2, Type = String, Dynamic = False, Default = \"01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable36, Type = String, Dynamic = False, Default = \"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable64, Type = String, Dynamic = False, Default = \"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable8, Type = String, Dynamic = False, Default = \"01234567", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Tabulation, Type = String, Dynamic = False, Default = \"\t", Scope = Public, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
	#tag EndConstant


	#tag Enum, Name = PaddingAlignment, Flags = &h0
		Left
		  Center
		Right
	#tag EndEnum


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
