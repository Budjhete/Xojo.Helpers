#tag Class
Protected Class ZipPackage
	#tag Method, Flags = &h0
		Sub AddEmptyDir(name as String)
		  dim header as LocalFileHeader
		  
		  header.version = 0
		  header.flag = 0
		  header.compression = CompressionStore
		  header.modificationTime = 0
		  header.modificationDate = 0
		  header.crc32 = 0
		  header.compressedSize = 0
		  header.uncompressedSize = 0
		  header.nameLength = name.Len
		  header.extraLength = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(content as BinaryStream, localName as String, comment as String = "")
		  dim header as LocalFileHeader
		  
		  header.version = 0
		  header.flag = 0
		  header.compression = CompressionStore
		  header.modificationTime = 0
		  header.modificationDate = 0
		  header.crc32 = 0
		  header.compressedSize = content.Length
		  header.uncompressedSize = content.Length
		  header.nameLength = localName.Len
		  header.extraLength = 0
		  
		  
		  stream_.Position = eocd_.startOffset
		  
		  stream_.WriteUInt32(SignatureLocalFileHeader)
		  stream_.Write(header.StringValue(stream_.LittleEndian))
		  
		  stream_.Write(content.Read(content.Length))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(file as FolderItem, comment as String = "", localName as String = "")
		  if localName = "" then
		    localName = file.Name
		  end
		  
		  AddFile(BinaryStream.Open(file), localName, comment)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  stream_.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(file as FolderItem, override as Boolean = false) As ZipPackage
		  if file.Exists then
		    file.Delete()
		  end
		  
		  dim zip as new ZipPackage
		  zip.file_ = file
		  zip.stream_ = BinaryStream.Open(file, true)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteIndex(index as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteName(name as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Extract(destination as FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetStream()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(file as FolderItem, readwrite as Boolean = true) As ZipPackage
		  dim zip as new ZipPackage
		  zip.file_ = file
		  zip.encoding_ = Encodings.UTF8
		  
		  if readwrite and not file.Exists then
		    zip.stream_ = file.CreateBinaryFile("")
		    if zip.stream_ = nil then
		      Raise new RuntimeException
		    end
		    
		    zip.stream_.LittleEndian = True
		  else
		    zip.stream_ = BinaryStream.Open(file, readwrite)
		    if zip.stream_ = nil then
		      Raise new RuntimeException
		    end
		    
		    zip.stream_.LittleEndian = True
		    call zip.ReadEndOfCentralDirectory()
		  end
		  
		  return zip
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadCentralDirectory() As Boolean
		  stream_.Position = eocd_.startOffset
		  
		  while stream_.Position < (eocd_.startOffset+eocd_.centralDirectorySize)
		    dim sig as Uint32 = stream_.ReadUInt32()
		    
		    if sig <> SignatureCentralDirectory then
		      return false
		    end
		    
		    dim directory as CentralDirectory
		    directory.StringValue(stream_.LittleEndian) = stream_.Read(42, encoding_)
		    
		    dim name as String = stream_.Read(directory.nameLength, encoding_)
		    stream_.Position = stream_.Position + directory.extraLength
		    dim comment as String = stream_.Read(directory.commentLength, encoding_)
		  wend
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadEndOfCentralDirectory() As Boolean
		  if stream_.Length < 22 then
		    return false
		  end
		  
		  stream_.Position = (stream_.Length-17)
		  while stream_.Position > 3
		    stream_.Position = (stream_.Position-5)
		    
		    dim sig as Uint32 = stream_.ReadUInt32()
		    if sig = SignatureEndOfCentralDirectory then
		      eocd_.StringValue(stream_.LittleEndian) = stream_.Read(18, encoding_)
		      
		      if (stream_.Position + eocd_.commentLength) <> stream_.Length then
		        return false
		      end
		      
		      Comment = stream_.Read(eocd_.commentLength)
		      return ReadCentralDirectory()
		    end
		  wend
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadLocalHeader()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteCentralDirRecord(entry as ZipFileEntry)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteEndRecord()
		  stream_.WriteUInt32(SignatureEndOfCentralDirectory)
		  stream_.Write(eocd_.StringValue(stream_.LittleEndian))
		  stream_.Write(Comment)
		  
		  stream_.Length = stream_.Position
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteLocalHeader()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Comment As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private encoding_ As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eocd_ As EndOfCentralDirectory
	#tag EndProperty

	#tag Property, Flags = &h21
		Private files_() As ZipFileEntry
	#tag EndProperty

	#tag Property, Flags = &h21
		Private file_ As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private stream_ As BinaryStream = nil
	#tag EndProperty


	#tag Constant, Name = CompressionDeflate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CompressionStore, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureCentralDirectory, Type = Double, Dynamic = False, Default = \"&h02014b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureDataDescriptor, Type = Double, Dynamic = False, Default = \"&h08074b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureEndOfCentralDirectory, Type = Double, Dynamic = False, Default = \"&h06054b50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureLocalFileHeader, Type = Double, Dynamic = False, Default = \"&h04034b50", Scope = Public
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

	#tag Structure, Name = DataDescriptor, Flags = &h0
		crc32 as UInt32
		  compressedSize as UInt32
		uncompressedSize as UInt32
	#tag EndStructure

	#tag Structure, Name = EndOfCentralDirectory, Flags = &h0
		diskNumber as Uint16
		  diskStart as Uint16
		  centralDirectoryDiskCount As Uint16
		  centralDirectoryCount As Uint16
		  centralDirectorySize as Uint32
		  startOffset as Uint32
		commentLength as Uint16
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
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
