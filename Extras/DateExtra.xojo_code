#tag Module
Protected Module DateExtra
	#tag Method, Flags = &h0
		Sub BeginOfTheDay(Extends d As Date)
		  d.Hour = 0
		  d.Minute = 0
		  d.Second = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BeginOfTime(Extends d As Date) As Date
		  
		  return new Date(1970, 1, 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends d as Date) As Date
		  return new Date(d)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatesMatch(d1 as Date, d2 as Date) As Boolean
		  return d1.DayOfYear = d2.DayOfYear and d1.Year = d2.Year
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekName(Extends d as Date) As String
		  return kDayOfWeek.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekNameShort(Extends d as Date) As String
		  return kDayOfWeekShort.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DaysInMonth(Extends d as Date) As Integer
		  dim d1 as new Date(d)
		  d1.Day = 1
		  
		  dim d2 as new Date(d1)
		  d2.Month = (d2.Month + 1)
		  d2.Day = (d2.Day - 1)
		  
		  return (d2.Day - d1.Day) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndOfTheDay(Extends d As Date)
		  d.Hour = 23
		  d.Minute = 59
		  d.Second = 59
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(extends d As Date, format as String = "") As String
		  if format = "" then
		    if d.IsToday() then
		      return kToday
		    elseif d.IsYesterday() then
		      return kYesterday
		    elseif d.IsTomorrow() then
		      return kTomorrow
		    end
		    
		    return d.LongishDate()
		  end
		  
		  dim map as new CSDictionary
		  
		  map.Value("d") = Str(d.Day).FillLeft("0", 2)
		  map.Value("D") = d.DayOfWeekNameShort
		  map.Value("j") = d.Day
		  map.Value("l") = d.DayOfWeekName
		  'map.Value("N") = d.DayOfWeek
		  map.Value("w") = d.DayOfWeek
		  map.Value("W") = d.WeekOfYear
		  
		  map.Value("F") = d.MonthName
		  map.Value("m") = Str(d.Month).FillLeft("0", 2)
		  map.Value("M") = d.MonthNameShort
		  map.Value("n") = d.Month
		  map.Value("t") = d.DaysInMonth
		  
		  map.Value("Y") = d.Year
		  map.Value("y") = Str(d.Year).Right(2)
		  
		  
		  if d.IsAnteMeridiem() then
		    map.Value("a") = kAnteMeridiem.Lowercase
		    map.Value("A") = kAnteMeridiem
		  else
		    map.Value("a") = kPostMeridiem.Lowercase
		    map.Value("A") = kPostMeridiem
		  end
		  
		  map.Value("g") = (d.Hour mod 13)
		  map.Value("G") = d.Hour
		  map.Value("h") = Str(d.Hour mod 13).FillLeft("0", 2)
		  map.Value("H") = Str(d.Hour).FillLeft("0", 2)
		  map.Value("i") =  Str(d.Minute).FillLeft("0", 2)
		  map.Value("s") =  Str(d.Second).FillLeft("0", 2)
		  
		  map.Value("O") = d.GMTHourOffset.Replace(":", "")
		  map.Value("P") = d.GMTHourOffset
		  'map.Value("T") = Str(d.GMTOffset)
		  
		  if format.Contains("c") then
		    map.Value("c") = d.FormatISO8601
		  end
		  
		  if format.Contains("r") then
		    map.Value("r") = d.FormatRFC2822
		  end
		  
		  if format.Contains("U") then
		    map.Value("U") = d.UnixTime
		  end
		  
		  return format.Map(map)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatISO8601(extends d As Date) As String
		  ' 2004-02-12T15:19:21+00:00
		  return d.SQLDateTime.Replace(" ", "T") + d.GMTHourOffset
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatRFC2822(extends d As Date) As String
		  ' Thu, 21 Dec 2000 16:01:07 +0200
		  return d.DayOfWeekNameShort + ", " + _
		  Str(d.Day) + " " + d.MonthNameShort + " " + Str(d.Year) + " " + _
		  Str(d.Hour).FillLeft("0", 2) + ":" + Str(d.Minute).FillLeft("0", 2) + ":" + Str(d.Second).FillLeft("0", 2) + " " + _
		  d.GMTHourOffset.Replace(":", "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GMTHourOffset(Extends d as Date) As String
		  dim ret as String
		  
		  if d.GMTOffset >= 0 then
		    ret = ret + "+"
		  else
		    ret = ret + "-"
		  end
		  
		  dim min as Integer = 60 * (d.GMTOffset - Floor(d.GMTOffset))
		  
		  ret = ret + Str(Floor(d.GMTOffset)).FillLeft("0", 2) + ":" + _
		  Str(min).FillLeft("0", 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAnteMeridiem(Extends d as Date) As Boolean
		  return (d.Hour < 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFuture(Extends d as Date) As Boolean
		  Dim now As New Date
		  return (d > now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPast(Extends d as Date) As Boolean
		  Dim now As New Date
		  return (d < now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPostMeridiem(Extends d as Date) As Boolean
		  return (d.Hour >= 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsToday(Extends d as Date) As Boolean
		  // Return True if this date is the same day as today.
		  Dim now As New Date
		  return DatesMatch( d, now )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTomorrow(extends d As Date) As Boolean
		  // Return True if this date is the same day as tomorrow.
		  Dim tomorrow As New Date
		  tomorrow.TotalSeconds = tomorrow.TotalSeconds + kSecondsPerDay
		  return DatesMatch( d, tomorrow )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsYesterday(extends d As Date) As Boolean
		  // Return True if this date is the same day as yesterday.
		  Dim yesterday As New Date
		  yesterday.TotalSeconds = yesterday.TotalSeconds - kSecondsPerDay
		  return DatesMatch( d, yesterday )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthEnd(Extends d As Date) As Date
		  dim aDate As new Date(IIF(d.Month = 1, d.Year - 1, d.Year), IIF(d.Month = 1, 12, d.Month - 1), 1)
		  aDate.Day = aDate.DaysInMonth()
		  aDate.Hour = 23
		  aDate.Minute = 59
		  aDate.Second = 59
		  
		  return aDate// 31 decembre de l'annee
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthStart(Extends d As Date, firstDay As Date = Nil) As Date
		  dim dd as new Date(IIF(d.Month = 1, d.Year - 1, d.Year), IIF(d.Month = 1, 12, d.Month - 1), 1)
		  dd.Hour = 0
		  dd.Minute = 0
		  dd.Second = 1
		  
		  return dd
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterEnd(Extends d As Date, firstDay As Date = Nil) As Date
		  dim start as Date = d.QuarterEnd(firstDay)
		  start.Month = start.Month - 3
		  start.day = start.day - 1
		  start.Hour = 23
		  start.Minute = 59
		  start.Second = 59
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterStart(Extends d As Date, firstDay As Date = Nil) As Date
		  dim start as Date = d.QuarterStart(firstDay)
		  start.Month = start.Month - 3
		  start.Hour =  0
		  start.Minute = 0
		  start.Second = 1
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearEnd(Extends d As Date, firstDay As Date = nil) As Date
		  dim aDate as Date = d.YearEnd(firstDay)
		  aDate.Year = aDate.Year - 1
		  aDate.Hour = 23
		  aDate.Minute = 59
		  aDate.Second = 59
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearStart(Extends d As Date, firstDay As Date = nil) As Date
		  dim aDate as Date = d.YearStart(firstDay)
		  aDate.Year = aDate.Year - 1
		  aDate.Hour = 0
		  aDate.Minute = 0
		  aDate.Second = 1
		  
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongishDate(extends d As Date) As String
		  // Return a date in the format: <month name> <day>, <year>
		  return d.MonthName + " " + Str( d.Day ) + ", " + Str( d.Year )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthEnd(Extends d As Date) As Date
		  return new Date(d.Year , d.Month, d.DaysInMonth())
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthName(Extends d as Date) As String
		  return kMonths.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthNameShort(Extends d as Date) As String
		  return kMonthsShort.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthStart(Extends d As Date) As Date
		  return new Date(d.Year , d.Month, 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterEnd(Extends d As Date, firstDay As Date = Nil) As Date
		  d.Month = d.Month + 3
		  d.Hour = 23
		  d.Minute = 59
		  d.Second = 59
		  return d.QuarterEnd(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterStart(Extends d As Date, firstDay As Date = Nil) As Date
		  d.Month = d.Month + 3
		  d.Hour = 0
		  d.Minute = 0
		  d.Second = 1
		  return d.QuarterStart(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextYear(Extends d As Date) As Date
		  d.Year = d.Year + 1
		  return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Quarter(Extends d As Date, firstDay as Date = Nil) As Integer
		  // Trimestre civil
		  if firstDay = nil then
		    return Ceil(d.Month / 3)
		  end
		  
		  dim q1, q2, q3, q4 as Date
		  
		  q1 = d.YearStart(firstDay)
		  
		  q2 = new Date(q1)
		  q3 = new Date(q1)
		  q4 = new Date(q1)
		  
		  q2.Month = q2.Month + 3
		  q3.Month = q3.Month + 6
		  q4.Month = q4.Month + 9
		  
		  if d < q2 then
		    return 1
		  elseif d < q3 then
		    return 2
		  elseif d < q4 then
		    return 3
		  else
		    return 4
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuarterEnd(Extends d As Date, firstDay As Date = Nil) As Date
		  dim ThisQuarterEnd As Date = d.QuarterStart(firstDay)
		  ThisQuarterEnd.Month = ThisQuarterEnd.Month + 3
		  ThisQuarterEnd.Hour = 23
		  ThisQuarterEnd.Minute = 59
		  ThisQuarterEnd.Second = 59
		  return ThisQuarterEnd
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuarterStart(Extends d As Date, firstDay as Date = Nil) As Date
		  firstDay = d.YearStart(firstDay)
		  
		  dim quarterStart as Date = new Date(firstDay)
		  
		  quarterStart.Month = quarterStart.Month + 3 * (d.Quarter(firstDay) - 1)
		  
		  return quarterStart
		  
		  // // Trimestre civil
		  // dim quarterStart as Date = new Date(d.Year, 3 * (Ceil(d.Month / 3) - 1) + 1, 1)
		  //
		  // if firstDay <> nil then
		  // // Ajustement
		  // firstDay.Year = d.Year
		  // dim days as Integer = new Date(
		  //
		  //
		  // end
		  //
		  // // if(firstDay <> Nil) then
		  // // // Ajustement
		  // //
		  // // ThisQuarterStart.Month = ThisQuarterStart.Month + (now.Month - firstDay.Month) + 3
		  // // ThisQuarterStart.Day = firstDay.Day
		  // //
		  // // end if
		  //
		  // return quarterStart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLTime(Extends d as Date) As String
		  return d.SQLDateTime.Mid(11)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixTime(extends d As Date) As UInt64
		  Return (d.TotalSeconds - 2082844800)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekEnd(Extends d As Date) As Date
		  dim aDate as Date = new Date(d)
		  
		  aDate.Day = aDate.Day + 7 - d.DayOfWeek
		  aDate.Hour = 23
		  aDate.Minute = 59
		  aDate.Second = 59
		  return aDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekStart(Extends d As Date) As Date
		  dim aDate as Date = new Date(d)
		  
		  aDate.Day = aDate.Day - d.DayOfWeek + 1
		  aDate.Hour = 0
		  aDate.Minute = 0
		  aDate.Second = 1
		  return aDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearEnd(Extends d As date, firstDay As Date = Nil) As Date
		  dim aDate as Date = d.YearStart(firstDay)
		  aDate.Year = aDate.Year + 1
		  aDate = aDate.Yesterday
		  
		  aDate.Hour = 23
		  aDate.Minute = 59
		  aDate.Second = 59
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearStart(Extends d As Date, firstDate As Date = Nil) As Date
		  // Année fiscale
		  if firstDate <> Nil then
		    dim start as new Date(d.Year, firstDate.Month, firstDate.Day) // 1er Janvier de l'annee
		    
		    if start > d then
		      start.Year = start.Year - 1
		    end
		    start.Hour = 0
		    start.Minute = 0
		    start.Second = 1
		    return start
		  end if
		  
		  
		  // Année civile - 1et janvier
		  return new Date(d.Year, 1, 1, 0, 0, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Yesterday(extends d As Date) As Date
		  d .TotalSeconds = d .TotalSeconds - kSecondsPerDay
		  return d
		End Function
	#tag EndMethod


	#tag Constant, Name = kAnteMeridiem, Type = String, Dynamic = True, Default = \"AM", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"AM"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"AM"
	#tag EndConstant

	#tag Constant, Name = kDayOfWeek, Type = String, Dynamic = True, Default = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dimanche\x2CLundi\x2CMardi\x2CMercredi\x2CJeudi\x2CVendredi\x2CSamedi"
	#tag EndConstant

	#tag Constant, Name = kDayOfWeekShort, Type = String, Dynamic = True, Default = \"Sun\x2CMon\x2CTue\x2CWed\x2CThu\x2CFri\x2CSat", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sun\x2CMon\x2CTue\x2CWed\x2CThu\x2CFri\x2CSat"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dim\x2CLun\x2CMar\x2CMer\x2CJeu\x2CVen\x2CSam"
	#tag EndConstant

	#tag Constant, Name = kMonths, Type = String, Dynamic = True, Default = \"January\x2CFebruary\x2CMarch\x2CApril\x2CMay\x2CJune\x2CJuly\x2CAugust\x2CSeptember\x2COctober\x2CNovember\x2CDecember", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"January\x2CFebruary\x2CMarch\x2CApril\x2CMay\x2CJune\x2CJuly\x2CAugust\x2CSeptember\x2COctober\x2CNovember\x2CDecember"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Janvier\x2CF\xC3\xA9vrier\x2CMars\x2CAvril\x2CMai\x2CJuin\x2CJuillet\x2CAo\xC3\xBBt\x2CSeptembre\x2COctobre\x2CNovembre\x2CD\xC3\xA9cembre"
	#tag EndConstant

	#tag Constant, Name = kMonthsShort, Type = String, Dynamic = True, Default = \"Jan\x2CFeb\x2CMar\x2CApr\x2CMay\x2CJun\x2CJul\x2CAug\x2CSep\x2COct\x2CNov\x2CDec", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Jan\x2CFeb\x2CMar\x2CApr\x2CMay\x2CJun\x2CJul\x2CAug\x2CSep\x2COct\x2CNov\x2CDec"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Jan\x2CF\xC3\xA9v\x2CMar\x2CAvr\x2CMai\x2CJun\x2CJul\x2CAo\xC3\xBB\x2CSep\x2COct\x2CNov\x2CD\xC3\xA9c"
	#tag EndConstant

	#tag Constant, Name = kPostMeridiem, Type = String, Dynamic = True, Default = \"PM", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"PM"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"PM"
	#tag EndConstant

	#tag Constant, Name = kSecondsPerDay, Type = Double, Dynamic = False, Default = \"86400", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kToday, Type = String, Dynamic = True, Default = \"Today", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Today"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aujourd\'hui"
	#tag EndConstant

	#tag Constant, Name = kTomorrow, Type = String, Dynamic = True, Default = \"Tomorrow", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Tomorrow"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Demain"
	#tag EndConstant

	#tag Constant, Name = kYesterday, Type = String, Dynamic = True, Default = \"Yesterday", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Yesterday"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Hier"
	#tag EndConstant


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
