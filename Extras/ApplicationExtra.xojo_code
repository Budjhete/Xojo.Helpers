#tag Module
Protected Module ApplicationExtra
	#tag Method, Flags = &h0, CompatibilityFlags = false
		Function Args(Extends a as Application) As String()
		  dim args as string = System.CommandLine.Trim
		  return args.Split(" ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function CommandLine(Extends a as Application) As String
		  return System.CommandLine.Trim.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function PID(Extends a as Application) As Integer
		  #if TargetMacOS
		    // For a Mac OS app, we use the system's
		    // getpid function in the kernel framework, which
		    // is automatically included in the system framework.
		    // This is not the same as a Mac OS PSN.
		    Soft Declare Function GetProcessID  Lib "System.framework" alias "getpid" () as Integer
		  #endif
		  
		  #if TargetWin32
		    Soft Declare Function GetProcessID Lib "Kernel32" alias "GetCurrentProcessId" () as Integer
		  #endif
		  
		  #if TargetLinux
		    Soft Declare Function GetProcessID Lib "libc.so" alias "getpid"  () as Integer
		  #endif
		  
		  Dim pid as Integer = GetProcessID
		  if pid <= 0 then
		    //an error occurred -- the Mac OS and Linux functions return -1 in this case -- so we set pid = 0.
		    pid = 0
		  end if
		  return pid
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
