#tag Class
Protected Class Blowfish
	#tag Method, Flags = &h0
		Function BlockToHex(data as MemoryBlock, optional breakAt as Integer = 76) As String
		  Dim returnValue as String
		  Dim temp As String
		  Dim i, j As Integer
		  
		  // dump a MemoryBlock as ascii hex chars
		  
		  for i = 0 to data.Size - 1
		    temp = Hex(data.UInt8Value(i))
		    if len(temp) = 1 then
		      temp = "0" + temp
		    end if
		    returnValue = returnValue + temp
		    j = j + 2
		    // add linebreaks as needed
		    if breakAt > 0 then
		      if j mod breakAt = 0 then
		        // break line
		        returnValue = returnValue + EndOfLine
		      end if
		    end if
		  next
		  
		  return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Dim err as RuntimeException
		  
		  BlowfishHelper.InitializeIfNeeded
		  IV = NewMemoryBlock(8)
		  RndIV = NewMemoryBlock(8)
		  
		  if (IV = nil) or (RndIV = nil) then
		    err = new RuntimeException
		    err.Message = "Insufficient memory to continue!"
		    raise err
		  end if
		  
		  Randomizer = New Random
		  
		  // for cross-platform capability and speed- set these two values in Blowfish Constants
		  #if SETENDIANESS
		    IV.LittleEndian = LITTLEENDIANESS
		    RndIV.LittleEndian = LITTLEENDIANESS
		  #endif
		  
		  // set up the Random IV and offset
		  InitRandomIV()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Decrypt(data as MemoryBlock)
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i as integer
		  dim err as RuntimeException
		  dim word0, word1 as UInt32
		  dim chain0, chain1 as UInt32
		  dim crypt0, crypt1 as UInt32
		  
		  // for cross-platform capability and speed- set these two values in Blowfish Constants
		  #if SETENDIANESS
		    data.LittleEndian = LITTLEENDIANESS
		  #endif
		  
		  if data.Size mod 8 <> 0 then
		    err = new RuntimeException
		    err.Message = "The input should be a multiple of 8 bytes. The data has been corrupted!"
		    raise err
		  end if
		  
		  if Mode = ECB then
		    for i = 0 to data.size - 1 step 8
		      word0 = data.UInt32Value(i)
		      word1 = data.UInt32Value(i+4)
		      
		      DecryptLong(word0, word1)
		      
		      data.UInt32Value(i) = word0
		      data.UInt32Value(i+4) = word1
		    next
		  else
		    if RandomIV then
		      // when using a random IV, the original IV is the last 8 bytes of the data
		      // ...so we have to recover it
		      IV.UInt64Value(0) = data.UInt64Value(data.Size - 8)
		      
		      // trim off the last eight bytes
		      data.Size = data.Size - 8
		    end if
		    
		    // get IV values for the following chained modes
		    chain0 = IV.UInt32Value(0)
		    chain1 = IV.UInt32Value(4)
		    
		    if Mode = CBC then
		      // CBC Mode
		      for i = 0 to data.size - 1 step 8
		        word0 = data.UInt32Value(i)
		        word1 = data.UInt32Value(i+4)
		        
		        crypt0 = word0
		        crypt1 = word1
		        
		        DecryptLong(word0, word1)
		        
		        word0 = BitwiseXor(word0, chain0)
		        word1 = BitwiseXor(word1, chain1)
		        
		        chain0 = crypt0
		        chain1 = crypt1
		        
		        data.UInt32Value(i) = word0
		        data.UInt32Value(i+4) = word1
		      next
		    else
		      // CFB mode using the chain, not decrypt!
		      for i = 0 to data.size - 1 step 8
		        word0 = data.UInt32Value(i)
		        word1 = data.UInt32Value(i+4)
		        
		        // encrypt the chain
		        EncryptLong(chain0, chain1)
		        
		        crypt0 = word0
		        crypt1 = word1
		        
		        word0 = BitwiseXor(word0, chain0)
		        word1 = BitwiseXor(word1, chain1)
		        
		        chain0 = crypt0
		        chain1 = crypt1
		        
		        data.UInt32Value(i) = word0
		        data.UInt32Value(i+4) = word1
		      next
		    end if
		    // save new IV values
		    IV.UInt32Value(0) = chain0
		    IV.UInt32Value(4) = chain1
		  end if
		  
		  // remove any padding bytes
		  i = data.UInt8Value(data.Size - 1)
		  if (i <> 0) and (i < 8) then
		    data.Size = data.Size - i
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecryptFromBase64(db64 as String) As String
		  Dim data as MemoryBlock
		  Dim err As RuntimeException
		  
		  // decrypt data from an Encrypted Base64 string
		  
		  // remove any line breaks
		  db64 = ReplaceLineEndings( db64, "" )
		  
		  if len(db64) mod 4 <> 0 then
		    err = new RuntimeException
		    err.Message = "The input should be a multiple of 4 characters! The data has been corrupted!"
		    raise err
		  end if
		  
		  data = NewMemoryBlock(0)
		  data = DecodeBase64( db64)
		  
		  Decrypt(data)
		  return data.StringValue(0, data.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecryptFromHex(hex as string) As String
		  #if DebugBuild then
		    // Désactivation des break sur exceptions
		    #pragma BreakOnExceptions Off
		  #endif
		  
		  Dim data as MemoryBlock
		  Dim i As Integer
		  Dim err As RuntimeException
		  
		  // decrypt data from an Encrypted Hex string
		  
		  // remove any line breaks
		  hex = ReplaceLineEndings( hex, "" )
		  
		  if len(hex) mod 16 <> 0 then
		    err = new RuntimeException
		    err.Message = "The input should be a multiple of 16 characters! The data has been corrupted!"
		    raise err
		  end if
		  
		  data = NewMemoryBlock(Len(hex) / 2) // 2 hex chars per byte
		  
		  //  make sure we got it!
		  if (data = nil) then
		    err = new RuntimeException
		    err.Message = "Insufficient memory to continue!"
		    raise err
		  end if
		  
		  for i = 0 to data.Size - 1
		    data.UInt8Value(i) = HexToByte(mid(hex, (i * 2 + 1), 2))
		  next
		  
		  Decrypt(data)
		  return data.StringValue(0, data.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecryptLong(byref xl as UInt32, byref xr as UInt32)
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim xxl, xxr, temp as UInt32
		  
		  dim a,b,c,d as Uint32
		  
		  Dim i as Integer
		  
		  xxl = xl
		  xxr = xr
		  
		  for i = 17 downto 2
		    xxl = Bitwise.BitXor(xxl, p(i))
		    
		    // Inlined "F"
		    temp = xxl
		    d = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    c = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    b = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    a = bitwise.BitAnd(temp, &hFF)
		    
		    temp = s(0,a) + s(1,b)
		    temp = Bitwise.BitXor(temp,s(2,c))
		    temp = temp + s(3,d)
		    // End Inline
		    
		    xxr = Bitwise.BitXor(temp, xxr)
		    
		    temp = xxl
		    xxl = xxr
		    xxr = temp
		  next
		  
		  temp = xxl
		  xxl = xxr
		  xxr = temp
		  
		  xxr = Bitwise.BitXor(xxr, p(1))
		  xxl = Bitwise.BitXor(xxl, p(0))
		  
		  xl = xxl
		  xr = xxr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  IV = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Encrypt(data as MemoryBlock)
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i, j, offset, originalSize as integer
		  dim err as RuntimeException
		  dim word0, word1 as UInt32
		  dim chain0, chain1 as UInt32
		  
		  // make sure we have a good mode
		  if (Mode < ECB) or (Mode > CFB) then
		    err = new RuntimeException
		    err.Message = "Blowfish set to unknown mode!"
		    raise err
		  end if
		  
		  // for cross-platform capability and speed - set these two values in Blowfish Constants
		  #if SETENDIANESS
		    data.LittleEndian = LITTLEENDIANESS
		  #endif
		  
		  // housekeeping for next call to use the random IV
		  if RandomIV then
		    UpdateRandomIV()
		  end if
		  
		  // Blowfish requires the input to be an even multiple of 8 bytes...pad if necessary
		  if (data.Size mod 8) <> 0 Then
		    // pad the block to be mod 8
		    j = 8 - (data.Size mod 8)
		    originalSize = data.Size
		    
		    data.Size = originalSize + j
		    
		    // initialize the new pad bytes as recommended in standards [PKCS5], [PKCS7], and [RFC3369].
		    for offset = originalSize to data.Size - 1
		      data.UInt8Value(offset) = j
		    next
		  end  if
		  
		  if Mode = ECB then
		    // ECB mode
		    for i = 0 to data.size - 1 step 8
		      word0 = data.UInt32Value(i)
		      word1 = data.UInt32Value(i+4)
		      
		      EncryptLong(word0, word1)
		      
		      data.UInt32Value(i) = word0
		      data.UInt32Value(i+4) = word1
		    next
		  else
		    // get IV values for the following chained modes
		    
		    if RandomIV then
		      // copy in the random IV
		      IV.UInt64Value(0) = RndIV.UInt64Value(0)
		    end if
		    
		    chain0 = IV.UInt32Value(0)
		    chain1 = IV.UInt32Value(4)
		    
		    if Mode = CBC then
		      // CBC mode
		      for i = 0 to data.size - 1 step 8
		        word0 = data.UInt32Value(i)
		        word1 = data.UInt32Value(i+4)
		        
		        // add in the IV
		        word0 = Bitwise.BitXor( word0, chain0)
		        word1 = Bitwise.BitXor( word1, chain1)
		        
		        EncryptLong(word0, word1)
		        
		        // save new IV values
		        chain0 = word0
		        chain1 = word1
		        
		        data.UInt32Value(i) = word0
		        data.UInt32Value(i+4) = word1
		      next
		    else
		      // CFB mode
		      for i = 0 to data.size - 1 step 8
		        // encrypt the chain
		        EncryptLong(chain0, chain1)
		        
		        word0 = data.UInt32Value(i)
		        word1 = data.UInt32Value(i+4)
		        
		        // add in the IV
		        word0 = Bitwise.BitXor( word0, chain0)
		        word1 = Bitwise.BitXor( word1, chain1)
		        
		        // save new IV values
		        chain0 = word0
		        chain1 = word1
		        
		        data.UInt32Value(i) = word0
		        data.UInt32Value(i+4) = word1
		      next
		    end if
		    // save new IV values
		    IV.UInt32Value(0) = chain0
		    IV.UInt32Value(4) = chain1
		    
		    // if we used a random IV, then add the IV to the end of the data block
		    if RandomIV then
		      // add 8 bytes to the data block
		      i = data.Size
		      data.Size = i + 8
		      // copy in the random IV
		      data.UInt64Value(i) = RndIV.UInt64Value(0)
		      
		      // re-randomize the Random IV for next time
		      InitRandomIV()
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EncryptLong(byref xl as UInt32, byref xr as Uint32)
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim xxl, xxr, temp as UInt32
		  
		  dim a,b,c,d as UInt32
		  
		  Dim i as Integer
		  
		  xxl = xl
		  xxr = xr
		  
		  for i = 0 to 15
		    xxl = Bitwise.BitXor(xxl, p(i))
		    
		    // Inlined "F"
		    temp = xxl
		    d = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    c = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    b = Bitwise.BitAnd(temp, &hFF)
		    temp = Bitwise.ShiftRight(temp, 8, 32)
		    a = bitwise.BitAnd(temp, &hFF)
		    
		    temp = s(0,a) + s(1,b)
		    temp = Bitwise.BitXor(temp,s(2,c))
		    temp = temp + s(3,d)
		    // End Inline
		    
		    xxr = Bitwise.BitXor(temp, xxr)
		    
		    temp = xxl
		    xxl = xxr
		    xxr = temp
		  next
		  
		  temp = xxl
		  xxl = xxr
		  xxr = temp
		  
		  xxr = Bitwise.BitXor(xxr, p(16))
		  xxl = Bitwise.BitXor(xxl, p(17))
		  
		  xl = xxl
		  xr = xxr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncryptToBase64(data as MemoryBlock, optional breakAt as Integer = 76) As String
		  // Encrypt and return a Base64 string
		  
		  Encrypt(data)
		  return EncodeBase64(data, BreakAt)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncryptToHex(data As MemoryBlock, optional breakAt as Integer = 76) As String
		  // Encrypt and return a Hexadecimal string
		  
		  Encrypt(data)
		  return BlockToHex(data, BreakAt)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function F(x as Uint32) As UInt32
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim a,b,c,d as UInt32
		  dim y as UInt32
		  
		  d = Bitwise.BitAnd(x, &hFF)
		  x = Bitwise.ShiftRight(x, 8, 32)
		  c = Bitwise.BitAnd(x, &hFF)
		  x = Bitwise.ShiftRight(x, 8, 32)
		  b = Bitwise.BitAnd(x, &hFF)
		  x = Bitwise.ShiftRight(x, 8, 32)
		  a = Bitwise.BitAnd(x, &hFF)
		  
		  y = s(0,a) + s(1,b)
		  y = Bitwise.BitXor(y,s(2,c))
		  y = y + s(3,d)
		  
		  return y
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIVHex() As String
		  // return the current value of the IV in Hexadecimal
		  
		  return BlocktoHex(IV)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HexToByte(HexValue as String) As UInt8
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  Dim returnValue as Uint8
		  Dim i as Integer
		  Dim err as RuntimeException
		  
		  // make sure the given string has 2 hex values
		  if len(HexValue) <> 2 then
		    err = new RuntimeException
		    err.Message = "Blowfish HexToByte(value) requires the value to be 2 hexadecimal characters."
		    raise err
		  end if
		  
		  i = asc(HexValue) // get the first hex value
		  if (i > &h2F) and (i < &h3A) then
		    i = i - &h30
		  else
		    if (i > &h40) and (i < &h47) then
		      i = i - &h37
		    else
		      // error! not a hex digit!
		      err = new RuntimeException
		      err.Message = "Blowfish HexToByte(value) received a non-hexadecimal character: " + Left(HexValue, 1)
		      raise err
		    end if
		  end if
		  returnValue = Bitwise.ShiftLeft( i, 4)
		  
		  i = asc(mid(HexValue,2,1)) // get the second hex value
		  if (i > &h2F) and (i < &h3A) then
		    i = i - &h30
		  else
		    if (i > &h40) and (i < &h47) then
		      i = i - &h37
		    else
		      // error! not a hex digit!
		      err = new RuntimeException
		      err.Message = "Blowfish HexToByte(value) received a non-hexadecimal character: " + Left(HexValue, 1)
		      raise err
		    end if
		  end if
		  
		  returnValue = returnValue + i
		  
		  return returnValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitRandomIV()
		  // initialize the random IV
		  Dim err as RuntimeException
		  Dim t as MemoryBlock
		  t = NewMemoryBlock(8)
		  Dim tmp as String
		  Dim i As  Integer
		  
		  if t = Nil then
		    err = new RuntimeException
		    err.Message = "Insufficient memory to continue!"
		    raise err
		  end if
		  
		  // for cross-platform capability and speed- set these two values in Blowfish Constants
		  #if SETENDIANESS
		    t.LittleEndian = LITTLEENDIANESS
		  #endif
		  
		  // import the current microsecond timer
		  t.UInt64Value(0) = Microseconds
		  tmp = MD5(str(Microseconds))
		  
		  // Initialize the Random IV with a random double value
		  RndIV.DoubleValue(0) = Randomizer.Number()
		  
		  // xor the middle with the Microseconds
		  RndIV.Int32Value(1) = BitwiseXor(t.Int32Value(0), RndIV.Int32Value(2))
		  RndIV.Int32Value(0) = BitwiseXor(RndIV.Int32Value(0), RndIV.Int32Value(4))
		  
		  // add in the 16 byte MD5 digest
		  for i = 0 to 7
		    RndIV.Int8Value(i) = BitwiseXor(RndIV.Int8Value(i), BitwiseXor(asc(mid(tmp, i + 1)), asc(mid(tmp, i + 9))))
		  next
		  
		  // and update the offset pointer for next update time
		  RndIVOffset = Randomizer.InRange(0,7)
		  
		  UpdateRandomIV()
		  UpdateRandomIV()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Key(assigns newKey as MemoryBlock)
		  #if SpeedUpAsPossible and not DebugBuild
		    #pragma BackgroundTasks false
		    #pragma BoundsChecking false
		    #pragma NilObjectChecking false
		    #pragma StackOverflowChecking false
		  #endif
		  
		  dim i, j, k as Integer
		  dim data, datal, datar as UInt32
		  
		  // housekeeping
		  
		  UpdateRandomIV()
		  
		  for i = 0 to 3
		    for j = 0 to 255
		      s(i,j) = BlowfishHelper.ORIG_S(i,j)
		    next
		  next
		  
		  j = 0
		  
		  for i = 0 to 17
		    data = 0
		    for k = 0 to 3
		      data = Bitwise.BitOr(Bitwise.ShiftLeft(data, 8, 32), _
		      newKey.Byte(j))
		      
		      j = j + 1
		      
		      if j >= newKey.Size then
		        j = 0
		      end if
		    next
		    P(i) = Bitwise.BitXor(BlowfishHelper.ORIG_P(i), data)
		  next
		  
		  datal = 0
		  datar = 0
		  
		  for i = 0 to 17 step 2
		    EncryptLong(datal, datar)
		    
		    p(i) = datal
		    p(i+1) = datar
		  next
		  
		  for i = 0 to 3
		    for j = 0 to 255 step 2
		      EncryptLong(datal, datar)
		      s(i,j) = datal
		      s(i,j+1) = datar
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetIV()
		  // reset all 8 bytes of the IV to zero
		  IV.UInt64Value(0) = 0
		  
		  // housekeeping
		  InitRandomIV()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIVHex(IVValue as String)
		  // Set the IV with a given string of 16 hexadecimal characters
		  
		  // make sure the given string has 16 hex values
		  Dim i as Integer
		  Dim err as RuntimeException
		  
		  if len(IVValue) <> 16 then
		    err = new RuntimeException
		    err.Message = "Blowfish SetIV(value) requires the value to be 16 hexadecimal characters."
		    raise err
		  end if
		  
		  IVValue = Uppercase(IVValue)
		  
		  // load the 8 bytes of the IV with the input values
		  for i = 0 to 7
		    IV.UInt8Value(i) = HexToByte(mid(IVValue, (i * 2 + 1), 2))
		  next
		  
		  // make sure we won't be using the random IV
		  RandomIV = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateRandomIV()
		  // add a new random byte to the IV
		  RndIV.UInt8Value(RndIVOffset) = Randomizer.InRange(0,255)
		  
		  // and update the offset pointer for next time
		  RndIVOffset = Randomizer.InRange(0,7)
		End Sub
	#tag EndMethod


	#tag Note, Name = About Blowfish
		This is based off of source code found on this website: http://www.schneier.com/blowfish.html
		
		The UnitTest method is only called in debug builds. If it ever fails, something is
		seriously wrong. Please report it immediately.
		
		This class was written by Jonathan Johnson. More information is available at
		http://realbasic.maccoding.com/. This class is public domain. Jonathan Johnson
		is not responsible for any damages this class may cause and does not claim any
		liability for its usage.
		
		This class was modified as follows by Mike Faulkner of Sky Dancer Studios 
		(http://www.skydancerstudios.com) on 8-11-2006:
		
		 1. Added the Blowfish modes "ECB", "CBC" and "CFB", along with the needed Initialization
		   Vector (IV).
		
		 2. Added global capability of setting the "Endianess" of the memory blocks. If
		   the Blowfish class is going to be used on one processor type ONLY, leaving "SETENDIANESS"
		   to "false" (not set) is the fastest. However, for cross-platform use (encrypting on one
		   platform and decrypting on another) or for Macintoshes (which may contain EITHER
		   processor) change "SETENDIANESS" to "True" and set "LITTLEENDIANESS" to either
		   "False" (if the most common processors the code is to be used on are PowerPCs)
		   or "True" (if the most common processors the code is to be used on are Intels).
		
		   NOTE: This advice is subject to how REAL Software implements the "Universal Binary"
		   update of REALBasic...it depends on how they handle "endianess" of Memoryblocks
		   between the PowerPC and Intel binary libraries. This advice could end up being
		   reversed! As soon as I know, I'll update this note and the software. - mf
		
		 3. Added a "pad" routine to the "Encrypt" method to pad the input block to a multiple of
		   8 bytes (as required by Blowfish.) and as recommended in the security standards [PKCS5],
		   [PKCS7], and [RFC3369].
		
		 4. Added the capability to use a "randomized IV" for the modes "CBC" and "CFB". When
		   this mode is set, the IV is initialized to a random value and is "tacked onto" the
		   end of the encrypted data. When "Decrypt" is called with the "random IV" set, the
		   last 8 bytes of the encrypted input data is stripped off and the IV is loaded with
		   that value (which was the random IV value used when the data was encrypted.)
		   This will give a different encrypted data stream every time, even if the password is
		   not changed, for increased security!
		
		 5. Added a "EncryptToHex" methods which creates "hexadecimal" a string for the 
		   encrypted output and "DecryptFromHex" which uses the hexadecimal encrypted
		   string as input to decode the original text. The "EncryptToHex" method will add
		   "line-breaks" at every 76 characters unless you pass a "breakAt" value. Then 
		   the hexadecimal output will break the lines at the value you pass. If you pass a zero
		   for the "breakAt" value, no line breaks will occur. (This is similar to the operation
		   of the "Base64Encoding" routine built into REALBasic.)
		
		 6. Added a "EncryptToBase64" methods which creates "Base64Encoded" string for the
		   encrypted output and "DecryptFromBase64" which uses the Base64Encoded
		   string as input to decode the original text. The "EncryptToBase64" method will add
		   "line-breaks" at every 76 characters unless you pass a "breakAt" value. Then
		   the Base64Encoded output will break the lines at the value you pass. If you pass a zero
		   for the "breakAt" value, no line breaks will occur. (This is similar to the operation
		   of the "Base64Encoding" routine built into REALBasic.)
		
		This class is still in the public domain. Neither Jonathan Johnson, nor Mike Faulkner
		is responsible for any damages this class may cause and does not claim any
		liability for its usage, merchantability or suitability for any particular purpose.
	#tag EndNote


	#tag Property, Flags = &h0
		IV As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		P(17) As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		RandomIV As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Randomizer As Random
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RndIV As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RndIVOffset As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		S(3,255) As UInt32
	#tag EndProperty


	#tag Constant, Name = CBC, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CFB, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ECB, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LITTLEENDIANESS, Type = Boolean, Dynamic = False, Default = \"false", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SETENDIANESS, Type = Boolean, Dynamic = False, Default = \"True", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SpeedUpAsPossible, Type = Boolean, Dynamic = False, Default = \"false", Scope = Private
	#tag EndConstant


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
			Name="Mode"
			Visible=false
			Group="Behavior"
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
			Name="RandomIV"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
