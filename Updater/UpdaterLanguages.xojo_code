#tag Module
Protected Module UpdaterLanguages
	#tag Constant, Name = kErreurDecompressionArchive, Type = String, Dynamic = True, Default = \"Erreur lors de la d\xC3\xA9compression de l\'archive.", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur lors de la d\xC3\xA9compression de l\'archive."
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Error when decompressing the archive."
	#tag EndConstant

	#tag Constant, Name = kFermerMAJ, Type = String, Dynamic = True, Default = \"Fermer", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Close"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fermer"
	#tag EndConstant

	#tag Constant, Name = kLanceurNonDisponible, Type = String, Dynamic = True, Default = \"Lanceur non disponible.", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Launcher not available."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Lanceur non disponible."
	#tag EndConstant

	#tag Constant, Name = kMiseAJourDuLogicielTextNotAuto, Type = String, Dynamic = True, Default = \"Une nouvelle version de $2 est maintenant disponible (vous avez actuellement la version $1). Voulez-vous mettre \xC3\xA0 jour votre logiciel\?", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Une nouvelle version de $2 est maintenant disponible (vous avez actuellement la version $1). Voulez-vous mettre \xC3\xA0 jour votre logiciel\?"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"A newer version of $2 is now available (the version you currently have is $1). Do you want to update your software\?"
	#tag EndConstant

	#tag Constant, Name = kQuitterMAJ, Type = String, Dynamic = True, Default = \"Quitter", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quitter"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quit"
	#tag EndConstant

	#tag Constant, Name = kQuitterRelancer, Type = String, Dynamic = True, Default = \"Quitter et relancer", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Quitter et relancer"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Quit and relaunch"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
