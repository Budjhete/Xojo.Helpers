#tag Class
Protected Class Fx
	#tag Method, Flags = &h0
		Shared Function LinearRatio(pFrom As Double, pTo As Double, pDuration As Double) As Double
		  Return (pTo - pFrom) / pDuration
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(pFrom as Double, pTo As Double)
		  Dim pWhere As Double = pFrom
		  
		  While (pFrom < pTo And pWhere < pTo) Or (pFrom > pTo And pWhere > pTo)
		    
		    pWhere = pWhere + FrameInterval * LinearRatio(pFrom, pTo, Duration)
		    
		    Me.Update(pWhere)
		    
		    App.SleepCurrentThread(FrameInterval)
		    
		  WEnd
		  
		  Me.Update(pTo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(pValue As Double)
		  RaiseEvent Update(pValue)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Update(pValue As Double)
	#tag EndHook


	#tag Property, Flags = &h0
		Duration As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		FPS As Integer = 60
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return 1000 / FPS
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  FPS = value * 1000
			End Set
		#tag EndSetter
		FrameInterval As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Transition As Transitions = Transitions.Linear
	#tag EndProperty


	#tag Enum, Name = Transitions, Type = Integer, Flags = &h0
		Linear
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=true
			Group="Behavior"
			InitialValue="DURATION_NORMAL"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fps"
			Visible=true
			Group="Behavior"
			InitialValue="30"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrameInterval"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transition"
			Visible=false
			Group="Behavior"
			InitialValue="Transitions.Linear"
			Type="Transitions"
			EditorType="Enum"
			#tag EnumValues
				"0 - Linear"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
