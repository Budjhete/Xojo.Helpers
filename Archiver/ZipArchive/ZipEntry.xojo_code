#tag Class
Protected Class ZipEntry
	#tag Method, Flags = &h21
		Private Function CalculerAdler32() As UInt32
		  //
		  // POURQUOI CETTE MÉTHODE??????
		  //
		  
		  const BASE = 65521
		  
		  dim adler1 as UInt32 = 1
		  dim adler2 as UInt32 = 0
		  
		  for i as Integer = 1 to Me.Content.Len
		    adler1 = (adler1 + AscB(Me.Content.MidB(i, 1))) Mod BASE
		    adler2 = (adler2 + adler1) Mod BASE
		  next
		  
		  dim result as UInt32 = Bitwise.BitOr(Bitwise.ShiftLeft(adler2, 16), adler1)
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CalculerCRC32(value as String) As UInt32
		  dim crc as new Crc32
		  crc.update(value)
		  return crc.getValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(name as String) As ZipEntry
		  dim children() as ZipEntry = mZip.ChildrenOf(LocalName)
		  
		  for each child as ZipEntry in children
		    if child.Name = name then
		      return child
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  if mStream <> nil then
		    mStream.Close()
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Compressed() As String
		  if mStream <> nil then
		    
		    //
		    // Un nouvelle version du fichier a été assigné
		    //
		    dim value as String = Content()
		    
		    if CompressionMethod = Compression_Deflate then
		      // Le deflate ajoute 2 octets d'identification à la fin
		      value = zlibCompress(value)  // NEED zLib 
		      return value.LeftB(value.LenB - 2)
		    elseif CompressionMethod = Compression_Store then
		      return value
		    end
		    
		    Raise new ZipException("Unsupported compression method.")
		    
		  elseif mPosition <> 0 and mZipStream <> nil then
		    
		    //
		    // On lit le contenu directement de l'archive
		    //
		    mZipStream.Position = mPosition
		    return mZipStream.Read(mCompressedSize, Encodings.UTF8)
		    
		  end
		  
		  
		  Raise new ZipException("No compressed content defined.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompressedSize() As UInt32
		  if IsDirectory() then
		    return 0
		  end
		  
		  return Compressed().LenB()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(zip as ZipArchive)
		  mZip = zip
		  mPosition = 0
		  
		  // Valeurs par défaut
		  Version = SupportedVersion
		  Flags = BitFlag
		  CompressionMethod = Compression_Deflate
		  CreationDate = new Date()
		  ModificationDate = new Date()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Content() As String
		  if mStream <> nil then
		    
		    //
		    // Un nouvelle version du fichier a été assigné
		    //
		    
		    mStream.Position = 0
		    return mStream.Read(mStream.Length)
		    
		  elseif mPosition <> 0 and mZipStream <> nil then
		    
		    //
		    // On lit le contenu directement de l'archive
		    //
		    dim value as String
		    
		    if CompressionMethod = Compression_Deflate then
		      value = zlibUncompress(Compressed(), mUncompressedSize)
		    elseif CompressionMethod = Compression_Store then
		      value = Compressed()
		    else
		      Raise new ZipException("Unsupported compression method.")
		    end if
		    
		    // On vérifie que le contenu est bon
		    if mCRC32 <> CalculerCRC32(value) then
		      Raise new ZipException("CRC32 invalide")
		    end
		    
		    return value
		    
		  end
		  
		  
		  Raise new ZipException("No content defined.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Content(Assigns stream as BinaryStream)
		  Close()
		  mStream = stream
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Content(Assigns fi as FolderItem)
		  Close()
		  
		  mStream = BinaryStream.Open(fi)
		  
		  CreationDate = fi.CreationDate
		  ModificationDate = fi.ModificationDate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Content(Assigns mb as MemoryBlock)
		  Close()
		  mStream = new BinaryStream(mb)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Content(Assigns value as String)
		  Close()
		  mStream = new BinaryStream(value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC32() As UInt32
		  if IsDirectory() then
		    return 0
		  end
		  
		  return CalculerCRC32(Compressed())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(zip as ZipArchive, local_name as String) As ZipEntry
		  dim entry as new ZipEntry(zip)
		  entry.LocalName = local_name
		  return entry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DosDate(datetime as Date) As UInt64
		  dim date  as UInt64
		  
		  date = BitWise.ShiftLeft(datetime.Day, 11)
		  date = BitWise.BitOr(date, BitWise.ShiftLeft(datetime.Month, 7))
		  date = BitWise.BitOr(date, datetime.Year - 1980)
		  
		  return date
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DosDateTime(date as UInt64, time as UInt64) As Date
		  dim day as Integer = Bitwise.ShiftRight(date, 11)
		  dim month as Integer = Bitwise.BitAnd(Bitwise.ShiftRight(date, 7), &hF)
		  dim year as Integer = Bitwise.BitAnd(date, &h7F) + 1980
		  
		  dim second as Integer = Bitwise.ShiftRight(time, 11) * 2
		  dim minute as Integer = Bitwise.BitAnd(Bitwise.ShiftRight(time, 5), &h3F)
		  dim hour as Integer = Bitwise.BitAnd(time, &h1F)
		  
		  return new Date(year, month, day, hour, minute, second)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DosTime(datetime as Date) As UInt64
		  dim time as UInt64
		  
		  time = BitWise.ShiftLeft(datetime.Second/2, 11)
		  time = BitWise.BitOr(time, BitWise.ShiftLeft(datetime.Minute, 5))
		  time = BitWise.BitOr(time, datetime.Hour)
		  
		  return time
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractTo(destination as FolderItem, overwrite as Boolean = false)
		  ExtractTo(destination, Name, overwrite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractTo(destination as FolderItem, name as String, overwrite as Boolean = false)
		  dim fi as FolderItem = destination.Child(name)
		  
		  // Gestion de l'overwrite
		  if overwrite and fi.Exists() then
		    fi.RecursiveDelete()
		  end
		  
		  if IsFile() then
		    
		    // Extraction d'un fichier
		    dim stream as BinaryStream = BinaryStream.Create(fi)
		    stream.Write(Content())
		    stream.Close()
		    
		  else
		    
		    //Extraction d'un dossier
		    fi.CreateAsFolder()
		    
		    for i as Integer = 0 to Count-1
		      Me.Item(i).ExtractTo(fi)
		    next
		    
		  end
		  
		  Exception err as IOException
		    if err.ErrorNumber = 104 then
		      MsgBox "kLe fichier " + fi.Name + " "+"kEst en cours d'utilisation. Quittez le logiciel ou fermer votre session d'ordinateur."
		    end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCompressed() As Boolean
		  return IsFile() and CompressionMethod <> Compression_Store
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirectory() As Boolean
		  return LocalName.Right(1) = "/"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFile() As Boolean
		  return not IsDirectory()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(index as Integer) As ZipEntry
		  dim children() as ZipEntry = mZip.ChildrenOf(LocalName)
		  
		  return children(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As ZipResource
		  return ZipResource.Open(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function OpenAsMovie() As Movie
		  return Open().OpenAsMovie()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenAsPicture() As Picture
		  return Picture.Open(Open())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function OpenAsSound() As Sound
		  return Open().OpenAsSound()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
		Function OpenAsVectorPicture() As Picture
		  return Open().OpenAsVectorPicture()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Read(zip as ZipArchive, stream as BinaryStream, offset as UInt32, cd_crc32 as UInt32, cd_uncompressed_size as UInt32, cd_compressed_size as UInt32) As ZipEntry
		  // On positionne notre pointeur au début du fichier
		  stream.Position = offset
		  
		  // On s'assure que la signature locale de fichier est bien présente
		  dim sig as Uint32 = stream.ReadUInt32()
		  
		  if sig <> SignatureLocalFileHeader then
		    raise new ZipException("La signature d'un fichier local n'est pas correctement placée.")
		  end
		  
		  dim entry as new ZipEntry(zip)
		  
		  // On récupère le header local
		  dim lfh as LocalFileHeader
		  
		  lfh.StringValue(stream.LittleEndian) = stream.Read(lfh.Size, Encodings.UTF8)
		  
		  entry.Version = lfh.version
		  entry.Flags = lfh.flag
		  entry.CompressionMethod = lfh.compression
		  
		  entry.ModificationDate = DosDateTime(lfh.modificationDate, lfh.modificationTime)
		  
		  entry.mCRC32 = lfh.crc32
		  entry.mCompressedSize = lfh.compressedSize
		  entry.mUncompressedSize = lfh.uncompressedSize
		  
		  // On récupère le nom et les champs extras
		  entry.LocalName = stream.Read(lfh.nameLength, Encodings.UTF8)
		  entry.ExtraField = stream.Read(lfh.extraLength, Encodings.UTF8)
		  
		  if Bitwise.BitAnd(entry.Flags, &h08) <> 0 then
		    dim old_position as Integer = stream.Position
		    
		    stream.Position = stream.Position + cd_compressed_size
		    
		    if stream.ReadUint32() <> SignatureDataDescriptor then
		      stream.Position = stream.Position - 4
		    end
		    
		    dim fdd as FileDataDescriptor
		    
		    fdd.StringValue(stream.LittleEndian) = stream.Read(fdd.Size, Encodings.UTF8)
		    
		    if fdd.crc32 <> cd_crc32 or fdd.compressedSize <> cd_compressed_size or fdd.uncompressedSize <> cd_uncompressed_size then
		      Raise new ZipException("Invalid File Data Descriptor")
		    end
		    
		    entry.mCRC32 = cd_crc32
		    entry.mUncompressedSize = cd_uncompressed_size
		    entry.mCompressedSize = cd_compressed_size
		    
		    stream.Position = old_position
		  end if
		  
		  // On défini la position du contenu
		  entry.mPosition = stream.Position
		  entry.mZipStream = stream
		  
		  // On récupère le contenu
		  // if entry.CompressionMethod = Compression_Deflate then
		  // zipE.Content = zlibUncompress(stream.Read(zipE.CompressedSize, Encodings.UTF8), zipE.UncompressedSize)
		  // elseif entry.CompressionMethod = Compression_Store then
		  // zipE.Content = stream.Read(zipE.UncompressedSize, Encodings.UTF8)
		  // else
		  // Raise new
		  // end if
		  //zipE.CurrentFile = new BinaryStream(zipE.content)
		  
		  return entry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UncompressedSize() As UInt32
		  if IsDirectory() then
		    return 0
		  end
		  
		  return Content.LenB()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(stream as BinaryStream)
		  mPosition = stream.Position
		  
		  // On crée le header local
		  dim lfh as LocalFileHeader
		  
		  lfh.version = Version
		  lfh.flag = Flags
		  lfh.compression = CompressionMethod
		  lfh.modificationTime = DosTime(ModificationDate)
		  lfh.modificationDate = DosDate(ModificationDate)
		  lfh.crc32 = CRC32()
		  lfh.compressedSize = CompressedSize()
		  lfh.uncompressedSize = UncompressedSize()
		  lfh.nameLength = LocalName.Len()
		  lfh.extraLength = ExtraField.LenB()
		  
		  stream.WriteUInt32(SignatureLocalFileHeader)
		  stream.Write(lfh.StringValue(stream.LittleEndian))
		  
		  stream.Write(LocalName)
		  stream.Write(ExtraField)
		  
		  // On sauvegarde le contenu
		  dim begin_position as UInt32 = stream.Position
		  
		  if IsFile() then
		    stream.Write(Compressed())
		  end if
		  
		  // On met à jour le stream
		  if mStream <> nil then
		    mStream.Close()
		  end
		  
		  mStream = stream
		  mPosition = begin_position
		  mCRC32 = lfh.crc32
		  mCompressedSize = lfh.compressedSize
		  mUncompressedSize = lfh.uncompressedSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteCentralDirectory(stream as BinaryStream) As UInt32
		  dim cd as CentralDirectory
		  
		  cd.madeBy = MadeBy
		  cd.versionNeeded = Version
		  cd.flag = Flags
		  cd.compression = CompressionMethod
		  cd.lastModificationTime = DosTime(ModificationDate)
		  cd.lastModificationDate = DosDate(ModificationDate)
		  cd.crc32 = CRC32()
		  cd.compressedSize = CompressedSize()
		  cd.uncompressedSize = UncompressedSize()
		  cd.nameLength = LocalName.Len()
		  cd.extraLength = ExtraField.LenB()
		  cd.commentLength = Comment.Len()
		  cd.diskStart = 0
		  cd.internalFileAttributes = 0
		  cd.externalFileAttributes = 0
		  cd.headerOffset = Position
		  
		  stream.WriteUInt32(SignatureCentralDirectory)
		  stream.Write(cd.StringValue(stream.LittleEndian))
		  
		  stream.Write(LocalName)
		  stream.Write(ExtraField)
		  stream.Write(Comment)
		  
		  return 4 + cd.Size + LocalName.Len + ExtraField.Len + Comment.Len
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Comment As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CompressionMethod As UInt16 = Compression_Store
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if IsFile() then
			    return 0
			  end
			  
			  return mZip.ChildrenOf(LocalName).Ubound + 1
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		CreationDate As Date
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim value as String = LocalName.RTrim("/")
			  dim pos as Integer = value.LastIndexOf("/")
			  
			  if pos >= 0 then
			    return value.Left(pos)
			  else
			    return ""
			  end
			End Get
		#tag EndGetter
		Directory As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim value as String = Name
			  dim pos as Integer = value.LastIndexOf(".")
			  
			  if pos >= 0 then
			    return value.Mid(pos+1)
			  else
			    return ""
			  end
			End Get
		#tag EndGetter
		Extension As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ExtraField As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Flags As UInt16 = BitFlag
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLocalName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLocalName = value
			End Set
		#tag EndSetter
		LocalName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCompressedSize As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCRC32 As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLocalName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ModificationDate As Date
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPosition As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStream As BinaryStream = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUncompressedSize As UInt32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mZip As ZipArchive
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mZipStream As BinaryStream
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim value as String = LocalName.RTrim("/")
			  dim pos as Integer = value.LastIndexOf("/")
			  
			  if pos >= 0 then
			    return value.Mid(pos+1)
			  else
			    return value
			  end
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if Directory <> "" then
			    return mZip.Item(Directory)
			  end
			  
			  return nil
			End Get
		#tag EndGetter
		Parent As ZipEntry
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPosition
			End Get
		#tag EndGetter
		Position As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Version As UInt16 = SupportedVersion
	#tag EndProperty


	#tag Constant, Name = BitFlag, Type = Double, Dynamic = False, Default = \"&h00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Compression_Deflate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Compression_Store, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MadeBy, Type = Double, Dynamic = False, Default = \"63", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureCentralDirectory, Type = Double, Dynamic = False, Default = \"&h02014b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureDataDescriptor, Type = Double, Dynamic = False, Default = \"&h08074b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureLocalFileHeader, Type = Double, Dynamic = False, Default = \"&h04034b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SupportedVersion, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CentralDirectory, Flags = &h0
		madeBy as Uint16
		  versionNeeded as Uint16
		  flag as Uint16
		  compression as Uint16
		  lastModificationTime as Uint16
		  lastModificationDate as Uint16
		  crc32 as Uint32
		  compressedSize as Uint32
		  uncompressedSize as Uint32
		  nameLength as Uint16
		  extraLength as Uint16
		  commentLength as Uint16
		  diskStart as Uint16
		  internalFileAttributes as Uint16
		  externalFileAttributes as Uint32
		headerOffset as Uint32
	#tag EndStructure

	#tag Structure, Name = FileDataDescriptor, Flags = &h0
		crc32 as Uint32
		  compressedSize as UInt32
		uncompressedSize as UInt32
	#tag EndStructure

	#tag Structure, Name = LocalFileHeader, Flags = &h0
		version as UInt16
		  flag as UInt16
		  compression as UInt16
		  modificationTime as UInt16
		  modificationDate as UInt16
		  crc32 as Uint32
		  compressedSize as UInt32
		  uncompressedSize as UInt32
		  nameLength as UInt16
		extraLength as UInt16
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompressionMethod"
			Group="Behavior"
			InitialValue="Compression_Store"
			Type="UInt16"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Directory"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Extension"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtraField"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flags"
			Group="Behavior"
			InitialValue="BitFlag"
			Type="UInt16"
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
			Name="LocalName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Group="Behavior"
			Type="UInt32"
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
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			InitialValue="SupportedVersion"
			Type="UInt16"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
