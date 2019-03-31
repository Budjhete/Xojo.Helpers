#tag Class
Protected Class MessageCenter
	#tag Method, Flags = &h0
		Sub Constructor()
		  mReceivers = new Xojo.Core.Dictionary
		  
		  mTimer = new Timer
		  mTimer.Mode = Timer.ModeOff
		  mTimer.Period = 50
		  
		  AddHandler mTimer.Action, AddressOf TimerAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsRegistered(receiver as MessageReceiver, msgType as Auto) As Boolean
		  if not mReceivers.HasKey(msgType) then
		    return false
		  end if
		  
		  dim receivers() as Object = mReceivers.Value(msgType)
		  
		  for i as Integer = 0 to receivers.Ubound
		    if receivers(i) = receiver then
		      return true
		    end
		  next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Register(receiver as MessageReceiver, msgType as Auto)
		  if IsRegistered(receiver, msgType) then
		    Raise new BHApplicationException(kReceveurDejaEnregistre) // BUG 1075
		  end
		  
		  dim receivers() as Object
		  
		  if mReceivers.HasKey(msgType) then
		    receivers = mReceivers.Value(msgType)
		  end if
		  
		  receivers.Append(receiver)
		  
		  mReceivers.Value(msgType) = receivers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(msg as Message)
		  System.Log(System.LogLevelInformation, msg.ToString)
		  mQueue.Append(msg)
		  
		  //start timer if stopped.
		  if mTimer.Mode = Timer.ModeOff then
		    mTimer.Mode = Timer.ModeMultiple
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(msgType as String, sender as Object = nil)
		  SendMessage(new Message(msgType, sender))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimerAction(timer as Timer)
		  //timer tick... send the next queued msg
		  if mQueue.Ubound < 0 then
		    return
		  end
		  
		  dim msg as Message = mQueue(0)
		  mQueue.Remove(0)
		  
		  if mReceivers.HasKey(msg.Type) then
		    dim receivers() as Object = mReceivers.Value(msg.Type)
		    
		    for i as Integer = 0 to receivers.Ubound
		      MessageReceiver(receivers(i)).ReceiveMessage(msg)
		    next
		  end
		  
		  //if queue empty, stop timer
		  if mQueue.Ubound < 0 then
		    mTimer.Mode = Timer.ModeOff
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unregister(receiver as MessageReceiver)
		  for each key as Variant in mReceivers.Keys
		    Unregister(receiver, key)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unregister(receiver as MessageReceiver, msgType as Variant)
		  if not mReceivers.HasKey(msgType) then
		    return
		  end if
		  
		  dim receivers() as Object = mReceivers.Value(msgType)
		  
		  for i as Integer = 0 to receivers.Ubound
		    if receivers(i) = receiver then
		      receivers.Remove(i)
		      
		      if receivers.Ubound >= 0 then
		        mReceivers.Value(msgType) = receivers
		      else
		        mReceivers.Remove(msgType)
		      end
		    end
		  next
		End Sub
	#tag EndMethod


	#tag Note, Name = Exemple d'utilisation
		Un receveur doit implémenter l'interface MessageReceiver.
		
		Pour enregistrer un objet pour qu'il écoute les message d'un type donné :
		
		MessageCenter.Instance.Register(le dit receveur, "nom de l'évènement")
		
		------------------
		
		Pour arrêter d'écouter un type de message :
		
		MessageCenter.Instance.Unregister(le receveur)
		
		------------------
		
		Pour envoyer un message sans paramètres
		
		MessageCenter.Instance.SendMessage("nom de l'évènement")
		
		
		------------------
		
		Pour envoyer un message avec paramètres, on doit absolument créer un message avant.
		
		dim message as new Message("nom de l'évènement")
		
		message.Set("key #1", "valeur")
		message.Set("key #2", 42)
		
		MessageCenter.Instance.SendMessage(message)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mInstance = nil then
			    mInstance = new MessageCenter()
			  end
			  
			  return mInstance
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mInstance = value
			End Set
		#tag EndSetter
		Shared Instance As MessageCenter
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As MessageCenter
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mQueue(-1) As Message
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReceivers As Xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Timer = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
