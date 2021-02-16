#tag Class
Protected Class ZipArchive
	#tag Method, Flags = &h0
		Sub AddDirectory(directory as FolderItem)
		  AddDirectory(directory, directory.Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDirectory(directory as FolderItem, local_name as String)
		  if local_name.Right(1) <> "/" then
		    local_name = local_name + "/"
		  end
		  
		  dim entry as ZipEntry = ZipEntry.Create(Me, local_name)
		  AddEntry(entry)
		  
		  ' Récursion pour ajouter tous les fichiers contenus dans le répertoire
		  for i as Integer = 1 to directory.Count
		    AddItem(directory.Item(i), local_name + directory.Item(i).Name)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDirectory(localName as String)
		  if localName.Right(1) <> "/" then
		    localName = localName + "/"
		  end
		  
		  dim entry as ZipEntry = ZipEntry.Create(Me, localName)
		  AddEntry(entry)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddEntry(entry as ZipEntry)
		  mEntries.append(entry)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(file as BinaryStream, localName as String, date as Date)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(file as FolderItem)
		  AddFile(file, file.Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(file as FolderItem, localName as String)
		  dim entry as ZipEntry = ZipEntry.Create(Me, localName)
		  entry.Content = file
		  
		  AddEntry(entry)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(item as FolderItem)
		  AddItem(item, item.Name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(item as FolderItem, localName as String)
		  if item.Directory then
		    AddDirectory(item, localName)
		  else
		    AddFile(item, localName)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildrenOf(directory as String) As ZipEntry()
		  dim children() as ZipEntry
		  
		  if directory.Right(1) <> "/" then
		    directory = directory + "/"
		  end
		  
		  for each child as ZipEntry in mEntries
		    if child.Directory = directory then
		      children.Append(child)
		    end
		  next
		  
		  return children
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  for i as integer = 0 to mEntries.Ubound
		    mEntries(i).Close()
		  next
		  
		  if mStream <> nil then
		    mStream.Close()
		    mStream = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(encoding as TextEncoding)
		  Me.Encoding = encoding
		  
		  IgnoresOnExtract = Array("__MACOSX/")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  return (mEntries.Ubound + 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create() As ZipArchive
		  return Create(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(zip_file as FolderItem) As ZipArchive
		  return Create(zip_file, Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(zip_file as FolderItem, encoding as TextEncoding) As ZipArchive
		  dim zip as new ZipArchive(encoding)
		  zip.mFile = zip_file
		  return zip
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(encoding as TextEncoding) As ZipArchive
		  return new ZipArchive(encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DescendentsOf(directory as String) As ZipEntry()
		  dim descendents() as ZipEntry
		  
		  if directory.Right(1) <> "/" then
		    directory = directory + "/"
		  end
		  
		  for each child as ZipEntry in mEntries
		    if child.LocalName.ToText.BeginsWith(directory.ToText) then
		      descendents.Append(child)
		    end
		  next
		  
		  return descendents
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Extract(destination as FolderItem, localName as String, overwrite as Boolean = false)
		  dim item as ZipEntry = Item(localName)
		  
		  if item <> nil then
		    item.ExtractTo(destination, overwrite)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractAll(destination as FolderItem, overwrite as Boolean = false)
		  if not destination.Exists() then
		    destination.CreateAsFolder()
		  end
		  
		  dim items() as ZipEntry = RootItems()
		  
		  for each item as ZipEntry in items
		    if not IsIgnored(item) then
		      item.ExtractTo(destination, overwrite)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsIgnored(item as ZipEntry) As Boolean
		  for each ignore as string in IgnoresOnExtract
		    if Ignore.EndsWith("/") and item.LocalName.BeginsWith(ignore) then
		      return true
		    elseif item.LocalName = ignore then
		      return true
		    end
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(index as Integer) As ZipEntry
		  if index < 0 or index > mEntries.Ubound then
		    Raise new OutOfBoundsException()
		  end
		  
		  return mEntries(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(local_name as String) As ZipEntry
		  for i as Integer = 0 to mEntries.Ubound
		    if mEntries(i).LocalName = local_name then
		      return mEntries(i)
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As ZipResource
		  return ZipResource.Open(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(zip_file as FolderItem, read_only as Boolean = true) As ZipArchive
		  return Open(zip_file, Encodings.UTF8, read_only)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(zip_file as FolderItem, encoding as TextEncoding, read_only as Boolean = true) As ZipArchive
		  dim zip as new ZipArchive(Encoding)
		  zip.Read(zip_file, read_only)
		  return zip
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RandomString(len As Integer, source as String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890") As String
		  Dim str, num As String
		  Dim nbChars, start, i As Integer
		  nbChars = source.Len( )
		  
		  for i = 1 To len
		    Dim r as New Random
		    start = r.InRange(1, nbChars)
		    num = source.Mid( start, 1 )
		    str = str + num
		  Next
		  
		  return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Read(source as FolderItem, read_only as Boolean = true)
		  // On s'assure de tout fermer avant
		  Close()
		  
		  // Définition des quelques propriétés
		  mReadOnly = read_only
		  mFile = source
		  
		  // On s'assure que le fichier existe
		  if not source.Exists() then
		    Raise new ZipException(source.name + "File not found")
		  end
		  
		  
		  // Ouverture du flux binaire
		  mStream = BinaryStream.Open(source, not read_only)
		  
		  if mStream = nil then
		    Raise new ZipException("Can't open the zip archive.")
		  end
		  
		  // On charge les détails des différents éléments du fichier zip
		  mStream.LittleEndian = true
		  
		  dim eocf as EndOfCentralDirectory = ReadEndOfCentralDirectory()
		  call ReadCentralDirectory(eocf)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadCentralDirectory(eocd as EndOfCentralDirectory)
		  mStream.Position = eocd.startOffset
		  
		  // Lecture des CentralDirectory
		  while mStream.Position < (eocd.startOffset + eocd.centralDirectorySize)
		    // On vérifie qu'il s'agit bel et bien d'un CentralDirectory
		    if mStream.ReadUInt32() <> ZipEntry.SignatureCentralDirectory then
		      raise new ZipException("Invalid CentralDirectory location")
		    end
		    
		    // Lecture du central directory
		    dim cd as CentralDirectory
		    cd.StringValue(mStream.LittleEndian) = mStream.Read(cd.Size, Encoding)
		    
		    // Lecture du nom, des champs extras et des commentraires
		    dim name as String = mStream.Read(cd.nameLength, Encoding)
		    mStream.Position = mStream.Position + cd.extraLength
		    mStream.Position = mStream.Position + cd.commentLength
		    
		    dim positionSave as UInt64 = mStream.position
		    
		    // On effectue la lecture du l'entry
		    dim entry as ZipEntry = ZipEntry.Read(Me, mStream, cd.headerOffset, cd.crc32, cd.uncompressedSize, cd.compressedSize)
		    Me.AddEntry(entry)
		    
		    mStream.position = positionSave
		    'oldPosition = cd.headerOffset
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadEndOfCentralDirectory() As EndOfCentralDirectory
		  // On vérifie que le EndOfCentralDirectory est présent
		  if mStream.Length < 22 then
		    raise new ZipException("EndOfCentralDirectory not found")
		  end if
		  
		  mStream.Position = (mStream.Length - 17)
		  
		  while mStream.Position > 3
		    mStream.Position = (mStream.Position - 5)
		    
		    // On véfifie si on a trouvé le EndOfCentralDirectory
		    dim sig as Uint32 = mStream.ReadUInt32()
		    
		    if sig = SignatureEndOfCentralDirectory then
		      
		      // Lecture du EndOfCentralDirectory
		      dim eocd as EndOfCentralDirectory
		      eocd.StringValue(mStream.LittleEndian) = mStream.Read(eocd.Size, Encoding)
		      
		      // Lecture du commentaire
		      if (mStream.Position + eocd.commentLength) <> mStream.Length then
		        raise new ZipException("Invalid comment length in EndOfCentralDirectory")
		      end
		      
		      // On défini le commentaire
		      Comment = mStream.Read(eocd.commentLength)
		      
		      return eocd
		    end if
		  wend
		  
		  raise new ZipException("EndOfCentralDirectory not found")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RootItems() As ZipEntry()
		  dim root() as ZipEntry
		  
		  for each child as ZipEntry in mEntries
		    if child.Directory = "" then
		      root.Append(child)
		    end
		  next
		  
		  return root
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(override as Boolean = false)
		  Save(nil, override)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(destination as FolderItem = nil, override as Boolean = false)
		  if mReadOnly then
		    Raise new ZipException("The zip archive is in read only mode.")
		  end
		  
		  ' Test de la taille maximym
		  if Count() >= &hFFFF then
		    Raise new ZipException("The number of entries is 65535 or greater")
		  end
		  
		  // On s'assure que la destination est valide
		  if destination <> nil then
		    mFile = destination
		  end
		  
		  if mFile = nil then
		    Raise new ZipException("No destination file defined for save")
		  end
		  
		  // On vérifie si le fichier de destination existe déjà
		  if mFile.Exists then
		    if override then
		      mFile.RecursiveDelete()
		    else
		      Raise new ZipException("Destination file already exists for save")
		    end
		  end
		  
		  
		  //========================================================
		  
		  
		  // Création d'un fichier de sauvegarde temporaire
		  dim temporaryFile as FolderItem = SpecialFolder.Temporary.Child(RandomString(10)+"."+Extension)
		  
		  dim writeStream as BinaryStream = BinaryStream.Create(temporaryFile, true)
		  writeStream.LittleEndian = True
		  
		  //mStream = BinaryStream.Create(mFile)
		  
		  if writeStream = nil then
		    Raise new ZipException("Can't open the zip archive for save.")
		  end
		  
		  // dim temporaryFile as FolderItem = nil
		  // dim writeStream as BinaryStream
		  //
		  // if mFileAlreadyExists then
		  // ' Si le fichier n'existe pas, on crée un flux d'écriture temporaire
		  // temporaryFile = SpecialFolder.Temporary.Child(RandomString(10)+"."+Extension)
		  // writeStream = BinaryStream.Create(temporaryFile, true)
		  // writeStream.LittleEndian = True
		  // else
		  // ' Sinon on récupère le flux existant
		  // writeStream = mStream
		  // end
		  
		  //========================================================
		  
		  // On écrit tous les fichiers dans le flux du zip
		  writeStream.Position = 0
		  
		  for i as Integer = 0 to mEntries.Ubound
		    mEntries(i).Write(writeStream)
		  next
		  
		  // On écrit le répertoire central
		  WriteCentralDirectory(writeStream)
		  
		  writeStream.Close()
		  
		  // Préparation du stream d'écriture
		  if mStream <> nil then
		    mStream.Close()
		    mStream = nil
		  end
		  
		  if mFile.Exists() then
		    mFile.RecursiveDelete()
		  end
		  
		  temporaryFile.MoveFileTo(mFile)
		  mStream = BinaryStream.Open(mFile, true)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteCentralDirectory(stream as BinaryStream)
		  dim eocd as EndOfCentralDirectory
		  
		  eocd.startOffset = stream.Position
		  
		  eocd.diskNumber = 0
		  eocd.diskStart = 0
		  eocd.centralDirectoryDiskCount = mEntries.Ubound + 1
		  eocd.centralDirectoryCount = mEntries.Ubound + 1
		  
		  dim centralDirectorySize as UInt32 = 0
		  
		  for i as Integer = 0 to mEntries.Ubound
		    centralDirectorySize = centralDirectorySize + mEntries(i).WriteCentralDirectory(stream)
		  next
		  eocd.centralDirectorySize = centralDirectorySize
		  
		  eocd.commentLength = Me.Comment.Len
		  
		  stream.WriteUInt32(SignatureEndOfCentralDirectory)
		  stream.Write(eocd.StringValue(stream.LittleEndian))
		  stream.Write(Comment)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Comment As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Encoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h0
		Extension As String = "zip"
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoresOnExtract() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContentsChanged As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEntries() As ZipEntry
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFileAlreadyExists As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadOnly As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		UseAbsolutePath As Boolean = False
	#tag EndProperty


	#tag Constant, Name = CompressionDeflate, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SignatureEndOfCentralDirectory, Type = Double, Dynamic = False, Default = \"&h06054b50", Scope = Public
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
			Name="Extension"
			Visible=false
			Group="Behavior"
			InitialValue="zip"
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
		#tag ViewProperty
			Name="UseAbsolutePath"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
