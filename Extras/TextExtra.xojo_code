#tag Module
Protected Module TextExtra
	#tag Method, Flags = &h0
		Function Asc(Extends pChar as Text) As integer
		  // will return the LAST carracter Code
		  dim c as integer
		  For Each codePoint As UInt32 In pChar.Codepoints
		    c = codePoint
		  Next
		  Return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(Extends str as Text, ParamArray vars as Text) As Text
		  dim i as Integer = 1
		  For Each v as Text in vars
		    str = str.ReplaceAll("$"+i.ToText, v)
		    i = i + 1
		  Next
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(str as Text, ParamArray vars as Text) As Text
		  dim i as Integer = 1
		  For Each v as Text in vars
		    str = str.ReplaceAll("$"+i.ToText, v)
		    i = i + 1
		  Next
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AssignVars(str as Text, vars as Xojo.Core.Dictionary) As Text
		  Using Xojo.Core
		  
		  for each ent as DictionaryEntry in vars
		    str = str.ReplaceAll("$"+ent.Key, ent.Value)
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoValue(Extends pStrings() As Text) As Auto()
		  Dim pAutos() As Auto
		  
		  For Each pString As Text In pStrings
		    pAutos.Append(pString)
		  Next
		  
		  Return pAutos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseConvert(Extends str as Text, fromBase as Integer, toBase as Integer) As Text
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BaseTable(base as Integer) As Text
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
		Function BooleanValue(Extends pString As Text) As Boolean
		  pString = pString.ReplaceAll(" ", "")
		  
		  dim pAuto as Auto = pString
		  
		  if pAuto.IsNumeric then
		    return pAuto.AutoBooleanValue
		  else
		    if pString = "True" or pString = "Vrai" or pString = "1" then
		      return True
		    else
		      return False
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Capitalize(extends s as Text) As Text
		  dim first as Text = s.CharAt(1)
		  
		  if first.asc < 97 or first.Asc > 122 then
		    return s
		  end if
		  
		  #if TargetIOS then
		    first = Chr(first.Asc - &h20)
		  #else
		    first = Chr(first.Asc - &h20).ToText
		  #endif
		  return first + s.Mid(2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharAt(Extends str as Text, position as Integer) As Text
		  return str.Mid(position, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CharAt(Extends  ByRef str as Text, position as Integer, Assigns char as Text)
		  if position > str.Length then
		    raise new OutOfBoundsException
		  end if
		  str = str.Left(position -1) + char + str.Mid(position + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Chop(s As Text, charsToCut As Integer) As Text
		  // Return s with the rightmost 'charsToCut' chars removed.
		  
		  Dim charsLeft As Integer = s.Length - charsToCut
		  if charsLeft <= 0 then return ""
		  return s.Left( s.Length - charsToCut )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Chop(s As Text, stringToCut As Text) As Text
		  // Chops 'stringToCut' off of s, if stringToCut is found at the end.
		  // Useful for removing file extensions, trailing punctuation, etc.
		  
		  Dim cutLen As Integer = stringToCut.Length
		  If s.Right(cutLen) = stringToCut then
		    return s.Left( s.Length - cutLen )
		  else
		    return s
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function Chr(i as integer) As Text
		  return Text.FromUnicodeCodepoint(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clean(Extends str as Text) As Text
		  return str.ReplaceRegExp("\s+", " ").Trim()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends str as Text, search() as Text) As Boolean
		  for i as Integer = 0 to search.Ubound
		    if str.Contains(search(i)) then
		      Return true
		    end if // you need StringExtra.Contains
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends str as Text, search as Text) As Boolean
		  return str.IndexOf(search) > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsB(Extends str as Text, search as Text) As Boolean
		  return str.IndexOf(search, Text.CompareCaseSensitive) > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountAll(Extends str as Text, find as Text) As Integer
		  dim total as Integer = 0
		  dim position as Integer = 1
		  
		  while position > 0
		    position = str.IndexOf(position, find)
		    
		    if position > 0 then
		      total = total + 1
		      position = position + 1
		    end
		  wend
		  
		  return total
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CsvSplit(Extends str as Text, separator as Text = ",", enclose as Text = "", escape as Text = "\") As Text()
		  #if TargetIOS
		    using JKRegEx
		  #endif
		  dim parts() as Text = str.Split(separator)
		  
		  if enclose <> "" then
		    for i as Integer = 0 to parts.Ubound
		      dim ret as RegExMatch = parts(i).Search("^\s*"+enclose+"(.*)"+enclose+"\s*$")
		      if ret <> nil then
		        parts(i) = ret.SubExpressionText(1)
		      end
		    next
		  end
		  
		  return parts
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Function CurrencyValue(Extends pString As Text) As Currency
		  #Pragma BreakOnExceptions False
		  
		  pString = pString.ReplaceAll(" ", "")
		  
		  Dim pAuto As Text = pString.ReplaceAll(",", ".")
		  
		  if pAuto="" then Return 0.0
		  
		  Try
		    return Double.FromText(pAuto)
		  Catch e As Xojo.Core.BadDataException
		    Return 0.00
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Decimal(Extends str as Text, default as Text = "") As Text
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  elseif not str.test("^\-?\d+") then
		    return default
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.\-]+", "")
		  
		  return str.DoubleValue.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function DecodeBase6(Extends aText As Text) As Text
		  Return DecodeBase64(aText).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function DecodeBase64(Extends aText As Text) As Text
		  #Pragma BreakOnExceptions False
		  
		  Dim str as string = aText
		  dim decoded as string = DecodeBase64(str, Encodings.UTF8)
		  dim t as text
		  Try
		    t = decoded.ToText
		    Return t
		  Catch
		    Return ""
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function DecodeBase64(Extends aText As Text) As Text
		  Declare Function initWithBase64EncodedString Lib FoundationLib Selector "initWithBase64EncodedString:options:" _
		  (obj_id As Ptr, Str As CFStringRef, options As Integer) As Ptr
		  Declare Function alloc Lib FoundationLib Selector "alloc" (clsRef As Ptr) As Ptr
		  Declare Function NSClassFromString Lib FoundationLib (clsName As CFStringRef) As Ptr
		  
		  Dim mData As Ptr = initWithBase64EncodedString(alloc(NSClassFromString("NSData")), aText, 1)
		  
		  Const NSUTF8StringEncoding = 4
		  
		  Declare Function initWithData Lib FoundationLib Selector "initWithData:encoding:" (obj_id As Ptr, data As Ptr, Encoding As Integer) As CFStringRef
		  Return initWithData(alloc(NSClassFromString("NSString")), mData, NSUTF8StringEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function DecodeBase64MemoryBlock(Extends aText As Text) As MemoryBlock
		  #Pragma BreakOnExceptions False
		  
		  Dim str as string = aText
		  dim XMB as MemoryBlock = DecodeBase64(str, Encodings.UTF8)
		  return xmb
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function DecodeURLComponent(url As Text) As Text
		  Declare Function CFURLCreateStringByReplacingPercentEscapes Lib "Foundation" _
		  (allocator As Ptr, origString As CFStringRef, charactersToLeaveEscaped As CFStringRef) As CFStringRef
		  
		  Dim encodedURL As Text
		  encodedURL = CFURLCreateStringByReplacingPercentEscapes(Nil, url, Nil)
		  Return encodedURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete(Extends str as Text, text as Text) As Text
		  return str.ReplaceAll(text, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(Extends pString As Text) As Double
		  pString = pString.ReplaceAll(" ", "")
		  
		  Dim pAuto As Text = pString.ReplaceAll(" ", "")
		  
		  if pAuto="" then Return 0.0
		  
		  Return Double.FromText(pAuto)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function EncodeBase64(Extends aText As Text) As Text
		  Return EncodeBase64(aText).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function EncodeBase64(Extends aText As Text) As Text
		  Declare Function dataUsingEncoding Lib FoundationLib Selector "dataUsingEncoding:" (obj_id As Ptr, Encoding As Integer) As Ptr
		  Declare Function stringWithString Lib FoundationLib Selector "stringWithString:" (obj_id As Ptr, Str As CFStringRef) As Ptr
		  Declare Function NSClassFromString Lib FoundationLib (clsName As CFStringRef) As Ptr
		  
		  Const NSUTF8StringEncoding = 4
		  Dim str As Ptr = stringWithString(NSClassFromString("NSString"), aText)
		  Dim mData As ptr = dataUsingEncoding(Str,NSUTF8StringEncoding)
		  
		  Declare Function base64EncodedStringWithOptions Lib FoundationLib Selector "base64EncodedStringWithOptions:" _
		  (obj_id As Ptr, options As Integer) As CFStringRef
		  
		  Return base64EncodedStringWithOptions(mData, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function EncodeBase64(Extends bytes As Xojo.Core.MemoryBlock) As Text
		  Declare Function NSClassFromString Lib FoundationLib (clsName As CFStringRef) As Ptr
		  
		  // Convert MemoryBlock to NSData
		  Static NSData As ptr = NSClassFromString("NSData")
		  
		  Declare Function alloc Lib FoundationLib selector "alloc" (clsRef As ptr) As ptr
		  
		  Declare Function initWithBytes_ Lib FoundationLib selector "initWithBytes:length:" (obj_id As ptr, bytes As ptr, length As UInteger) As ptr
		  Dim nsd As Ptr = initWithBytes_(alloc(NSData), bytes.Data, bytes.Size)
		  
		  // Convert the bytes to Base64 encoded Text
		  Declare Function base64EncodedStringWithOptions Lib FoundationLib Selector "base64EncodedStringWithOptions:" _
		  (obj_id As Ptr, options As Integer) As CFStringRef
		  
		  Return base64EncodedStringWithOptions(nsd, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function EncodeURLComponent(url As Text) As Text
		  Declare Function CFURLCreateStringByAddingPercentEscapes Lib "Foundation" _
		  (allocator As Ptr, origString As CFStringRef, charactersToLeaveUnescaped As CFStringRef, _
		  legalURLCharactersToBeEscaped As CFStringRef, encoding As UInt32) As CFStringRef
		  
		  Dim encodedURL As Text
		  encodedURL = CFURLCreateStringByAddingPercentEscapes(Nil, url, Nil, Nil, &h08000100)
		  Return encodedURL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndOfLine_() As Text
		  return Text.FromUnicodeCodepoint(10)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndsWith(Extends str as Text, search() as Text) As Boolean
		  for i as Integer = 0 to search.Ubound
		    if str.Right(search(i).Length) = search(i) then
		      Return true
		    end if // you need StringExtra.Contains
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entier(Extends str as Text, default as Text = "") As Text
		  if not str.test("^\d+") then
		    return default
		  end
		  
		  return str.IntegerValue.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapeRegExMetacharacters(Extends str as Text) As Text
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
		Function FillLeft(Extends str As Text, padding As Text, length As Integer) As Text
		  while str.Length < length
		    str = padding + str
		  wend
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FillRight(Extends str As Text, padding As Text, length As Integer) As Text
		  while str.Length < length
		    str = str + padding
		  wend
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Format(Extends pString As Text, ParamArray pReplacements As Pair) As Text
		  Using Xojo.Core
		  Dim pDictionary As New Dictionary
		  
		  For Each pReplacement As Pair In pReplacements
		    pDictionary.Value(pReplacement.Left) = pReplacement.Right
		  Next
		  
		  Return pString.Format(pDictionary)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As Text, pReplacements() As Text) As Text
		  For pIndex As Integer = 0 To pReplacements.Ubound
		    pString = pString.ReplaceAll("{" + pIndex.ToText + "}", pReplacements(pIndex))
		  Next
		  
		  For Each pReplacement As Text In pReplacements
		    pString = pString.Replace("{}", pReplacement)
		  Next
		  
		  Return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As Text, ParamArray pReplacements As Text) As Text
		  Return pString.Format(pReplacements)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(Extends pString As Text, pReplacements As Xojo.Core.Dictionary) As Text
		  Using Xojo.Core
		  For Each pRepl As DictionaryEntry In pReplacements
		    pString = pString.ReplaceAll("{" + pRepl.Key.AutoTextValue + "}", pRepl.Value.AutoTextValue)
		  Next
		  
		  Return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FromBase(Extends str as Text, base as Integer) As Integer
		  dim num as Integer = 0
		  dim exponent as Integer = 0
		  dim facteur as Integer
		  dim table as Text = BaseTable(base)
		  
		  
		  for i as Integer = str.Length DownTo 1
		    dim char as Text = str.CharAt(i)
		    facteur = (table.IndexOf(char) - 1)
		    if facteur < 0 then
		      Raise new InvalidArgumentsException
		    end
		    
		    num = num + facteur * (base ^ exponent)
		    exponent = exponent + 1
		  next
		  
		  return num
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexToInt(Extends str as Text) As Integer
		  dim t as text = "&h"+str
		  return T.IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hyphenate(Extends str as Text) As Text
		  return str.Clean.Lowercase.ReplaceAll(" ", "-")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function InStrRegEx(Extends str as Text, pattern as Text, params as Text = "") As Integer
		  dim match as RegExMatch = str.Search("^(.*?)"+pattern, params)
		  if match = nil then
		    return 0
		  end
		  
		  return (match.SubExpressionString(1).Len+1)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function InStrRegEx(Extends str as Text, pattern as Text, params as Text = "") As Integer
		  using JKRegEx
		  
		  dim match as RegExMatch = str.Search("^(.*?)"+pattern, params)
		  if match = nil then
		    return 0
		  end
		  
		  return (match.SubExpressionString(1).Length+1)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrReverse(Extends source As Text, startPos As Integer = -1, substr As Text) As Integer
		  // Similar to InStr, but searches backwards from the given position
		  // (or if startPos = -1, then from the end of the string).
		  // If substr can't be found, returns 0.
		  
		  Dim srcLen As Integer = source.Length
		  if startPos = -1 then startPos = srcLen
		  
		  // Here's an easy way...
		  // There may be a faster implementation, but then again, there may not -- it probably
		  // depends on the particulars of the data.
		  Dim reversedSource As Text = Reverse(source)
		  Dim reversedSubstr As Text = Reverse(substr)
		  Dim reversedPos As Integer
		  reversedPos = reversedSource.IndexOf( srcLen - startPos + 1, reversedSubstr )
		  if reversedPos < 1 then return 0
		  return srcLen - reversedPos - substr.Length + 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(Extends pString As Text) As Integer
		  if pString = "" then Return -1
		  return Integer.FromText(pString)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmpty(extends s As Text) As Boolean
		  // Return true if the string is empty.
		  
		  return s = ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isNumeric(extends s As Text) As Boolean
		  #Pragma BreakOnExceptions False
		  
		  Using Xojo.core
		  
		  Dim value As Integer
		  Try
		    value = Integer.FromText(s)
		  Catch e As BadDataException
		    Return False
		  End Try
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function JoinCSV(Extends pTexts() As Text) As Text
		  // RFC 4180
		  
		  Dim pValues() As Text
		  
		  For pIndex As Integer = 0 To pTexts.Ubound
		    // Quote quote and quote that
		    pValues.Append(Text.FromUnicodeCodepoint(34) + pTexts(pIndex).Replace(Text.FromUnicodeCodepoint(34), Text.FromUnicodeCodepoint(34) + Text.FromUnicodeCodepoint(34)) + Text.FromUnicodeCodepoint(34))
		  Next
		  
		  Return Text.Join(pValues, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastIndexOf(Extends str as Text, find as Text) As Integer
		  dim chunks() as Text = str.Split(find)
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

	#tag Method, Flags = &h0
		Function LTrim(Extends source As Text, charsToTrim As Text = " ") As Text
		  // This is an extended version of RB's LTrim function that lets you specify
		  // a set of characters to trim.
		  
		  Dim srcLen As Integer = source.Length
		  Dim leftPos, i As Integer
		  for i = 1 to srcLen
		    if source.IndexOf(i, charsToTrim ) = 0 then exit
		  next
		  leftPos = i
		  if leftPos > srcLen then return ""
		  
		  return source.Mid(leftPos)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Money(Extends str as Text, default as Text = "") As Text
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.-]+", "")
		  
		  if not str.test("\-?\d+") then
		    return default
		  end
		  
		  return str.MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyPositive(Extends str as Text, default as Text = "") As Text
		  str = str.ReplaceAll(",", ".")
		  
		  if str.test("^\.\d+") then
		    str = "0"+str
		  end
		  
		  str = str.ReplaceAllRegExp("[^\d\.]", "")
		  
		  if not str.test("\d+") then
		    return default
		  end
		  
		  return str.MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pString As Text) As Text
		  Return pString.CurrencyValue.MoneyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyValue(Extends pString As Text, pUnit As Text) As Text
		  Return pString.CurrencyValue.MoneyValue(pUnit)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NthField(Extends str as Text, separator as Text, idX as Integer) As Text
		  dim t() as text = str.Split(separator)
		  return t(idX)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Number(Extends str as Text, default as Text = "") As Text
		  if not str.test("^\d+") then
		    return default
		  end
		  
		  str = str.ReplaceAll(",", ".")
		  str = str.ReplaceAllRegExp("[^\d\.]+", "")
		  
		  return str.IntegerValue.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Padding(Extends str as Text, width as Integer, character as Text = " ", alignment as PaddingAlignment = PaddingAlignment.Right) As Text
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
		Function RandomText(len as Integer, source as Text = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890") As Text
		  Dim str, num As Text
		  Dim nbChars, start, i As Integer
		  nbChars = source.Length
		  
		  for i = 1 To len
		    
		    start = Xojo.Math.RandomInt(1, nbChars)
		    num = source.Mid( start, 1 )
		    str = str + num
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Repeat(Extends str As Text, multiplier As Integer) As Text
		  dim result As Text = ""
		  
		  while multiplier > 0
		    result = result + str
		    multiplier = multiplier - 1
		  wend
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAccents(Extends pString as Text) As Text
		  // Remplace les caractères accentués par leurs équivalents non-accentués
		  
		  Dim pFrom As Text = "à,á,â,ã,ä,ç,è,é,ê,ë,ì,í,î,ï,ñ,ò,ó,ô,õ,ö,ù,ú,û,ü,ý,ÿ,À,Á,Â,Ã,Ä,Ç,È,É,Ê,Ë,Ì,Í,Î,Ï,Ñ,Ò,Ó,Ô,Õ,Ö,Ù,Ú,Û,Ü,Ý"
		  Dim pTo As Text = "a,a,a,a,a,c,e,e,e,e,i,i,i,i,n,o,o,o,o,o,u,u,u,u,y,y,A,A,A,A,A,C,E,E,E,E,I,I,I,I,N,O,O,O,O,O,U,U,U,U,Y"
		  
		  Dim pFromS() as text = pFrom.Split(",")
		  Dim pToS() as Text = pTo.Split(",")
		  For pIndex As Integer = 0 To pFromS.Ubound
		    pString = pString.ReplaceAll(pFromS(pIndex), pToS(pIndex), text.CompareCaseSensitive)
		  next
		  
		  return pString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAllRegExp(Extends str as Text, pattern as Text, replace as Text, params as Text = "") As Text
		  #if TargetIOS
		    using JKRegEx
		  #endif
		  
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  #if not TargetIOS then
		    opts.Greedy = params.Contains("U")
		  #endif
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  #if not TargetIOS then
		    opts.ReplaceAllMatches = True
		  #endif
		  reg.SearchPattern = pattern
		  reg.ReplacementPattern = replace
		  reg.Options = opts
		  
		  #if TargetIOS then
		    Return reg.ReplaceAll(str)
		  #else
		    return reg.Replace(str).ToText
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceRegExp(Extends str as Text, pattern as Text, replace as Text, params as Text = "") As Text
		  #if TargetIOS
		    using JKRegEx
		  #endif
		  
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  #if NOT TargetIOS then
		    opts.Greedy = params.Contains("U")
		  #endif
		  
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  #if not TargetIOS then
		    
		    opts.ReplaceAllMatches = False
		    
		  #endif
		  
		  reg.SearchPattern = pattern
		  reg.ReplacementPattern = replace
		  reg.Options = opts
		  
		  #if TargetIOS then
		    return reg.ReplaceAll(str)
		  #else
		    return reg.Replace(str).ToText
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Reverse(s As Text) As Text
		  // Return s with the characters in reverse order.
		  
		  if s.Length < 2 then return s
		  
		  Dim characters() as Text = s.Split()
		  Dim leftIndex as Integer = 0
		  Dim rightIndex as Integer = UBound(characters)
		  #pragma BackgroundTasks False
		  While leftIndex < rightIndex
		    Dim temp as Text = characters(leftIndex)
		    characters(leftIndex) = characters(rightIndex)
		    characters(rightIndex) = temp
		    leftIndex = leftIndex + 1
		    rightIndex = rightIndex - 1
		  Wend
		  Return Text.Join( characters, "" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function Search(Extends str as Text, pattern as Text, params as Text = "") As JKRegEx.RegExMatch
		  #if TargetIOS
		    using JKRegEx
		  #endif
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  opts.TreatTargetAsOneLine = (not params.Contains("m"))
		  
		  reg.SearchPattern = pattern
		  reg.Options = opts
		  
		  return reg.search(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Search(Extends str as Text, pattern as Text, params as Text = "") As RegExMatch
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function SearchAll(Extends str as Text, pattern as Text, params as Text = "") As JKRegEx.RegExMatch()
		  #if TargetIOS
		    using JKRegEx
		  #endif
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  dim match as RegExMatch
		  dim matches() as RegExMatch
		  dim doLoop as Boolean = false
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  #if not TargetIOS then
		    opts.Greedy = params.Contains("U")
		  #endif
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SearchAll(Extends str as Text, pattern as Text, params as Text = "") As RegExMatch()
		  Dim reg as New RegEx
		  dim opts as new RegExOptions
		  dim match as RegExMatch
		  dim matches() as RegExMatch
		  dim doLoop as Boolean = false
		  
		  opts.CaseSensitive = (not params.Contains("i"))
		  opts.DotMatchAll = params.Contains("s")
		  #if not TargetIOS then
		    opts.Greedy = params.Contains("U")
		  #endif
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
		Function Slugalize(Extends pString as Text) As Text
		  Return pString.ReplaceAccents. _
		  ReplaceAllRegExp("[\W\s]+", " "). _ // replace non-word and space by space
		  Trim. _ // trim beginning and ending spaces
		  ReplaceAll(" ", "-")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitAndKeep(Extends source as Text, delimiter as Text = " ") As Text()
		  dim parts() as Text
		  
		  parts = source.Split(delimiter)
		  
		  for i as Integer = (parts.Ubound-1) DownTo 0
		    parts.Insert(i+1, delimiter)
		  next
		  
		  return parts
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function SplitCSV(Extends pString As Text) As Text()
		  Dim Sss() as string = SplitCommaSeparatedValuesMBS(pString)
		  dim Ttt() as text
		  for each s as string in Sss
		    
		    Ttt.Append(s.ToText)
		    
		  next
		  
		  Return Ttt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitMultiple(Extends source as Text, delimiters() as Text) As Text()
		  dim parts() as Text
		  dim parts2() as Text
		  dim result() as Text
		  
		  delimiters = delimiters.Clone()
		  dim delimiter as Text = delimiters.Pop()
		  
		  parts = source.Split(delimiter)
		  if delimiters.Ubound < 0 then
		    return parts
		  end
		  
		  for each part as Text in parts
		    parts2 = part.SplitMultiple(delimiters)
		    result.AppendAll(parts2)
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitMultiple(Extends source as Text, delimiters as Text) As Text()
		  return source.SplitMultiple(delimiters.Split(""))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitMultipleAndKeep(Extends source as Text, delimiters() as Text) As Text()
		  dim parts() as Text
		  dim parts2() as Text
		  dim result() as Text
		  
		  delimiters = delimiters.Clone()
		  dim delimiter as Text = delimiters.Pop()
		  
		  parts = source.SplitAndKeep(delimiter)
		  if delimiters.Ubound < 0 then
		    return parts
		  end
		  
		  for each part as Text in parts
		    parts2 = part.SplitMultipleAndKeep(delimiters)
		    result.AppendAll(parts2)
		  next
		  
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitMultipleAndKeep(Extends source as Text, delimiters as Text) As Text()
		  return source.SplitMultipleAndKeep(delimiters.Split(""))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS and (Target32Bit or Target64Bit))
		Function Sprintf(format as Text, ParamArray args as Auto) As Text
		  
		  dim matches() as JKRegEx.RegExMatch = format.SearchAll("%(b|c|d|u|f|o|s|x|X)")
		  dim match as JKRegEx.RegExMatch
		  
		  dim replace as Text
		  dim arg as Auto
		  
		  if matches.Ubound <> Ubound(args) then
		    Raise new InvalidArgumentsException
		  end
		  
		  for i as Integer = 0 to matches.Ubound
		    replace = ""
		    match = matches(i)
		    arg = args(i)
		    
		    Select Case match.SubExpressionString(1)
		    Case "s"
		      replace = arg.AutoTextValue
		    Case "d"
		      replace = arg.AutoIntegerValue.ToText
		    Case "f"
		      replace = arg.AutoDoubleValue.ToText
		    Case "u"
		      replace = arg.AutoIntegerValue.ToText
		    Case "c"
		      replace = Text.FromUnicodeCodepoint(arg.AutoIntegerValue)
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Sprintf(format as Text, ParamArray args as Auto) As Text
		  
		  dim matches() as RegExMatch = format.SearchAll("%(b|c|d|u|f|o|s|x|X)")
		  dim match as RegExMatch
		  
		  dim replace as Text
		  dim arg as Auto
		  
		  if matches.Ubound <> Ubound(args) then
		    Raise new InvalidArgumentsException
		  end
		  
		  for i as Integer = 0 to matches.Ubound
		    replace = ""
		    match = matches(i)
		    arg = args(i)
		    
		    Select Case match.SubExpressionString(1)
		    Case "s"
		      replace = arg.AutoTextValue
		    Case "d"
		      replace = arg.AutoIntegerValue.ToText
		    Case "f"
		      replace = arg.AutoDoubleValue.ToText
		    Case "u"
		      replace = arg.AutoIntegerValue.ToText
		    Case "c"
		      replace = Text.FromUnicodeCodepoint(arg.AutoIntegerValue)
		    Case "b"
		      ' Integer -> binaire
		    Case "o"
		      ' Integer -> octal
		    Case "x"
		      ' Integer -> hexadecimal
		    Case "X"
		      ' Integer -> hexadecimal
		    End
		    
		    format = format.Replace(match.SubExpressionText(0), replace)
		  next
		  
		  return format
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Test(Extends str as Text, pattern as Text, params as Text = "") As Boolean
		  return str.Search(pattern, params) <> nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toCurrency(Extends str as Text) As Currency
		  return Currency.FromText(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toDouble(Extends str as Text) As Double
		  return Double.FromText(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ToSrings(Extends str() as Text) As String()
		  dim s() as string
		  for each t as text in str
		    s.Append(t)
		  next
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToText(Extends str as Text) As Text
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Trim(Extends source As Text, charsToTrim As Text) As Text
		  // This is an extended version of RB's Trim function that lets you specify
		  // a set of characters to trim.
		  
		  Dim srcLen As Integer = source.Length
		  Dim leftPos, i As Integer
		  for i = 1 to srcLen
		    if source.IndexOf(i, charsToTrim ) = 0 then exit
		  next
		  leftPos = i
		  if leftPos > srcLen then return ""
		  
		  Dim rightPos As Integer
		  for i = srcLen DownTo 1
		    if source.IndexOf(i, charsToTrim ) = 0 then exit
		  next
		  rightPos = i
		  
		  return source.Mid(leftPos, rightPos - leftPos + 1 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLDecode(Extends pString As Text) As Text
		  Return DecodeURLComponent(pString).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URLEncode(Extends pString As Text) As Text
		  Return EncodeURLComponent(pString).ToText
		End Function
	#tag EndMethod


	#tag Constant, Name = kBaseTable10, Type = Text, Dynamic = False, Default = \"0123456789", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable16, Type = Text, Dynamic = False, Default = \"0123456789ABCDEF", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable2, Type = Text, Dynamic = False, Default = \"01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable36, Type = Text, Dynamic = False, Default = \"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable64, Type = Text, Dynamic = False, Default = \"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBaseTable8, Type = Text, Dynamic = False, Default = \"01234567", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Tabulation, Type = Text, Dynamic = False, Default = \"\t", Scope = Public, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
	#tag EndConstant


	#tag Enum, Name = PaddingAlignment, Type = Integer, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
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
End Module
#tag EndModule
