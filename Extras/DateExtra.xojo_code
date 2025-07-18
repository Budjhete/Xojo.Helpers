#tag Module
Protected Module DateExtra
	#tag Method, Flags = &h0
		Function BeginOfTheDay(Extends d As DateTime) As DateTime
		  d = d.Hour(0)
		  d = d.Minute(0)
		  return d.Second(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BeginOfTime(Extends d As DateTime) As DateTime
		  return new DateTime(0, TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends d as DateTime) As DateTime
		  dim a as new DateTime(d)
		  return a
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatesMatch(d1 as DateTime, d2 as DateTime) As Boolean
		  return d1.DayOfYear = d2.DayOfYear and d1.Year = d2.Year
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Day(Extends d as DateTime, pDay as integer) As DateTime
		  return New DateTime(d.Year, d.Month, pDay, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekMonthStart(Extends d as DateTime) As Integer
		  dim dd as new DateTime(d)
		  return dd.MonthStart.DayOfWeek
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekName(Extends d as DateTime) As String
		  return kDayOfWeek.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekNameShort(Extends d as DateTime) As String
		  return kDayOfWeekShort.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DaysInMonth(Extends d as DateTime) As Integer
		  dim d1 as DateTime = d
		  d1 = d1.Day(1)
		  
		  dim iaddmonth as new DateInterval
		  iaddmonth.Months = 1
		  
		  dim irrDay as new DateInterval
		  irrDay.Days = 1
		  
		  dim d2 as DateTime = d1
		  d2 = d2.Operator_Add(iaddmonth)
		  
		  d2 = d2.Operator_Subtract(irrDay)
		  
		  return (d2.Day - d1.Day) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndOfTheDay(Extends d As DateTime) As DateTime
		  d = d.Hour(23)
		  d = d.Minute(59)
		  d = d.Second(59)
		  
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatPlain(extends d As DateTime) As String
		  ' 2000-12-31 16h 01m 07s to 20001231160107
		  return  d.Year.ToString + d.Month.ToString + d.Day.ToString +_
		  d.Hour.ToString.FillLeft("0", 2) + d.Minute.ToString.FillLeft("0", 2) + d.Second.ToString.FillLeft("0", 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hour(Extends d as DateTime, pHour as integer) As DateTime
		  Return New DateTime(d.Year, d.Month, d.Day, pHour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAnteMeridiem(Extends d as DateTime) As Boolean
		  return (d.Hour < 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFuture(Extends d as DateTime) As Boolean
		  return (d > DateTime.Now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLeapYear(extends d As DateTime) As Boolean
		  // Return True if this date a leap year
		  Return (((d.year MOD 4)=0) AND ((d.year MOD 100)<>0)) OR (d.year MOD 400)=0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPast(Extends d as DateTime) As Boolean
		  return (d < DateTime.Now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPostMeridiem(Extends d as DateTime) As Boolean
		  return (d.Hour >= 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsToday(Extends d as DateTime) As Boolean
		  // Return True if this date is the same day as today.
		  'Dim now As DateTime
		  return DatesMatch( d, DateTime.Now )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTomorrow(extends d As DateTime) As Boolean
		  // Return True if this date is the same day as tomorrow.
		  Dim tomorrow As new DateTime(DateTime.Now.SecondsFrom1970 + kSecondsPerDay,  TimeZone.Current)
		  return DatesMatch( d, tomorrow )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsYesterday(extends d As DateTime) As Boolean
		  // Return True if this date is the same day as yesterday.
		  Dim yesterday As new DateTime(d.SecondsFrom1970 - kSecondsPerDay, TimeZone.Current)
		  return DatesMatch( d, yesterday )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthEnd(Extends d As DateTime) As DateTime
		  Dim y as integer = IIF(d.Month = 1, d.Year - 1, d.Year)
		  Dim m as integer = IIF(d.Month = 1, 12, d.Month - 1)
		  dim ddd as new DateTime(y, m, 1,2,3,4,5, TimeZone.Current)
		  dim dd as integer = ddd.DaysInMonth()
		  dim aDate As new DateTime(y, m, dd, 23, 59, 59,0,  TimeZone.Current)
		  
		  
		  return aDate// 31 decembre de l'annee
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthStart(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  dim dd as new DateTime(IIF(d.Month = 1, d.Year - 1, d.Year), IIF(d.Month = 1, 12, d.Month - 1), 1, 0, 0, 1, 0,TimeZone.Current)
		  
		  return dd
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterEnd(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  dim start as DateTime = firstDay
		  dim diff as new DateInterval(0, 3)
		  dim diffday as new DateInterval(0,0,1)
		  start = start+diff-diffday
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterStart(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  dim start as DateTime = d.QuarterStart(firstDay)
		  start = start.Month(start.Month - 3)
		  start = start.Hour(0)
		  start = start.Minute(0)
		  start = start.Second(1)
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearEnd(Extends d As DateTime, firstDay As DateTime = nil) As DateTime
		  dim aDate as DateTime = d.YearEnd(firstDay)
		  aDate = aDate.Year(aDate.Year - 1)
		  aDate = aDate.Hour(23)
		  aDate = aDate.Minute(59)
		  aDate = aDate.Second(59)
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearStart(Extends d As DateTime, firstDay As DateTime = nil) As DateTime
		  dim aDate as DateTime = d.YearStart(firstDay)
		  aDate = aDate.Year(aDate.Year - 1)
		  aDate = aDate.Hour(0)
		  aDate = aDate.Minute(0)
		  aDate = aDate.Second(1)
		  
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongishDate(extends d as DateTime, pLang as string = "fr") As String
		  // Return a date in the format: <month name> <day>, <year>
		  Select Case pLang
		  Case "en"
		    Return d.MonthName(pLang) + " " + d.Day.ToString + ", " + d.Year.ToString
		  Case "fr"
		    Return d.Day.ToString + " " + d.MonthName(pLang).Lowercase + " " + d.Year.ToString
		    
		  Else
		    Return d.MonthName(pLang) + " " + d.Day.ToString + ", " + d.Year.ToString
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Minute(Extends d as DateTime, pMinute as integer) As DateTime
		  Return New DateTime(d.Year, d.Month, d.Day, d.Hour, pMinute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Month(Extends d as DateTime, pMonth as integer) As DateTime
		  dim mYear as integer = d.Year
		  if pMonth<1 then
		    pMonth = 11+pMonth
		    myear = myear-1
		  elseif pMonth > 12 then
		    pMonth = pMonth - 12
		    mYear = myear +1
		  end if
		  dim dd as integer = d.day
		  if pMonth = 2 and d.day > 28 then
		    dd = 28
		  end if
		  
		  Return New DateTime(mYear, pMonth, dd, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthEnd(Extends d As DateTime) As DateTime
		  return new DateTime(d.Year , d.Month, d.DaysInMonth(),23,59,58,0, TimeZone.Current)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
		Function MonthName(Extends d as Datetime) As String
		  return kMonths.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MonthName(Extends d as DateTime, pLang as string = "en") As String
		  return kMonths(pLang).NthField(",", d.Month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthNameShort(Extends d as DateTime) As String
		  return kMonthsShort.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthStart(Extends d As DateTime) As DateTime
		  return new DateTime(d.Year , d.Month, 1,0,0,0,0, TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Nanosecond(Extends d as DateTime, pNanosecond as integer) As DateTime
		  return New DateTime(d.Year, d.Month, d.Day, d.Hour, d.Minute, d.Second, pNanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterEnd(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  d = d.Month(d.Month + 3)
		  d = d.Hour(23)
		  d = d.Minute(59)
		  d = d.Second(59)
		  return d.QuarterEnd(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterStart(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  d = d.Month(d.Month + 3)
		  d = d.Hour(0)
		  d = d.Minute(0)
		  d = d.Second(1)
		  return d.QuarterStart(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextYear(Extends d As DateTime) As DateTime
		  return d.Year(d.Year + 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Quarter(Extends d as DateTime, firstDay as DateTime = Nil) As Integer
		  // Trimestre civil
		  if firstDay = nil then
		    return Ceiling(d.Month / 3)
		  end
		  
		  dim q1, q2, q3, q4 as DateTime
		  
		  q1 = d.YearStart(firstDay)
		  
		  q2 = q1
		  q3 = q1
		  q4 = q1
		  
		  q2 = q2.Month(q2.Month + 3)
		  q3 = q3.Month(q3.Month + 6)
		  q4 = q4.Month(q4.Month + 9)
		  
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
		Function QuarterEnd(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  dim ThisQuarterEnd As DateTime = d.QuarterStart(firstDay)
		  ThisQuarterEnd = ThisQuarterEnd.Month(ThisQuarterEnd.Month + 3)
		  ThisQuarterEnd = ThisQuarterEnd.Hour(23)
		  ThisQuarterEnd = ThisQuarterEnd.Minute(59)
		  ThisQuarterEnd = ThisQuarterEnd.Second(59)
		  if ThisQuarterEnd.Day = 1 then
		    dim minus1day as new DateInterval
		    minus1day.Days = 1
		    ThisQuarterEnd = ThisQuarterEnd - minus1day
		  end if
		  return ThisQuarterEnd
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuarterStart(Extends d as DateTime, firstDay as DateTime = Nil) As DateTime
		  firstDay = d.YearStart(firstDay)
		  
		  dim quarterStart as DateTime = firstDay
		  
		  quarterStart = quarterStart.Month(quarterStart.Month + 3 * (d.Quarter(firstDay) - 1))
		  
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
		Function Second(Extends d as DateTime, pSecond as integer) As DateTime
		  Return New DateTime(d.Year, d.Month, d.Day, d.Hour, d.Minute, pSecond, d.Nanosecond, d.TimeZone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLTime(Extends d as DateTime) As String
		  return d.SQLDateTime.Middle(11)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixTime(extends d As DateTime) As UInt64
		  Return d.SecondsFrom1970
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekEnd(Extends d As DateTime) As DateTime
		  return New DateTime(d.Year, d.Month, d.Day + 7 - d.DayOfWeek, 23, 59, 59,0, TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekStart(Extends d As DateTime) As DateTime
		  
		  
		  return new DateTime(d.Year + 1, d.Month, d.Day - d.DayOfWeek + 1, 0, 0, 1,0, TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Year(Extends d as DateTime, pYear as integer) As DateTime
		  return New DateTime(pYear, d.Month, d.Day, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearEnd(Extends d As DateTime, firstDay As DateTime = Nil) As DateTime
		  
		  dim aDate as DateTime = d.YearStart(firstDay)
		  aDate = aDate.Yesterday
		  
		  
		  
		  return new DateTime(aDate.Year + 1, aDate.Month, aDate.Day, 23, 59, 59, 0, TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearStart(Extends d As DateTime, firstDate As DateTime = Nil) As DateTime
		  
		  // Année fiscale
		  if firstDate <> Nil then
		    dim start as new DateTime(d.Year, firstDate.Month, firstDate.Day, 0, 0, 1, 0, TimeZone.Current)
		    if start > d then
		      Dim ouwanYear As New DateInterval
		      ouwanYear.Years = 1
		      start = start - ouwanYear
		    end
		    
		    return start
		  end if
		  
		  
		  // Année civile - 1et janvier
		  return new DateTime(d.Year, 1, 1, 0, 0, 1, 0, TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Yesterday(extends d As DateTime) As DateTime
		  return new DateTime(d.SecondsFrom1970 - kSecondsPerDay, TimeZone.Current)
		End Function
	#tag EndMethod


	#tag Constant, Name = kAnteMeridiem, Type = String, Dynamic = True, Default = \"AM", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"AM"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"AM"
	#tag EndConstant

	#tag Constant, Name = kDayOfWeek, Type = String, Dynamic = True, Default = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday", Scope = Public
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
