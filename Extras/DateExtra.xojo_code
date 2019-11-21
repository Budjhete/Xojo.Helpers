#tag Module
Protected Module DateExtra
	#tag Method, Flags = &h0
		Function AbbreviatedDate(Extends d as Xojo.Core.Date) As Text
		  return d.ToText.left(11)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BeginOfTheDay(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  d = d.Hour(0)
		  d = d.Minute(0)
		  return d.Second(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BeginOfTime(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  
		  return new Xojo.Core.Date(0, Xojo.Core.TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone(Extends d as Xojo.Core.Date) As Xojo.Core.Date
		  dim a as Xojo.Core.date = d
		  return a
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatesMatch(d1 as Xojo.Core.Date, d2 as Xojo.Core.Date) As Boolean
		  return d1.DayOfYear = d2.DayOfYear and d1.Year = d2.Year
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Day(Extends d as Xojo.Core.Date, pDay as integer) As Xojo.Core.Date
		  return New Xojo.Core.Date(d.Year, d.Month, pDay, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekName(Extends d as Xojo.Core.Date) As Text
		  return kDayOfWeek.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DayOfWeekNameShort(Extends d as Xojo.Core.Date) As Text
		  return kDayOfWeekShort.NthField(",", d.DayOfWeek)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DaysInMonth(Extends d as Xojo.Core.Date) As Integer
		  dim d1 as Xojo.Core.Date = d
		  d1 = d1.Day(1)
		  
		  dim iaddmonth as new Xojo.Core.DateInterval
		  iaddmonth.Months = 1
		  
		  dim irrDay as new Xojo.Core.DateInterval
		  irrDay.Days = 1
		  
		  dim d2 as Xojo.Core.Date = d1
		  d2 = d2.Operator_Add(iaddmonth)
		  
		  d2 = d2.Operator_Subtract(irrDay)
		  
		  return (d2.Day - d1.Day) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndOfTheDay(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  d = d.Hour(23)
		  d = d.Minute(59)
		  d = d.Second(59)
		  
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatPlain(extends d As Xojo.Core.Date) As Text
		  ' 2000-12-31 16h 01m 07s to 20001231160107
		  return  d.Year.ToText + d.Month.ToText + d.Day.ToText +_
		  d.Hour.ToText.FillLeft("0", 2) + d.Minute.ToText.FillLeft("0", 2) + d.Second.ToText.FillLeft("0", 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hour(Extends d as Xojo.Core.Date, pHour as integer) As Xojo.Core.Date
		  Return New Xojo.Core.Date(d.Year, d.Month, d.Day, pHour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAnteMeridiem(Extends d as Xojo.Core.Date) As Boolean
		  return (d.Hour < 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFuture(Extends d as Xojo.Core.Date) As Boolean
		  return (d > Xojo.Core.date.Now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPast(Extends d as Xojo.Core.Date) As Boolean
		  return (d < Xojo.Core.Date.Now)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPostMeridiem(Extends d as Xojo.Core.Date) As Boolean
		  return (d.Hour >= 12)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsToday(Extends d as Xojo.Core.Date) As Boolean
		  // Return True if this date is the same day as today.
		  'Dim now As Xojo.Core.Date
		  return DatesMatch( d, Xojo.Core.date.Now )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTomorrow(extends d As Xojo.Core.Date) As Boolean
		  // Return True if this date is the same day as tomorrow.
		  Dim tomorrow As new Xojo.Core.Date(Xojo.Core.Date.Now.SecondsFrom1970 + kSecondsPerDay,  Xojo.Core.TimeZone.Current)
		  return DatesMatch( d, tomorrow )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsYesterday(extends d As Xojo.Core.Date) As Boolean
		  // Return True if this date is the same day as yesterday.
		  Dim yesterday As new Xojo.Core.Date(d.SecondsFrom1970 - kSecondsPerDay, Xojo.Core.TimeZone.Current)
		  return DatesMatch( d, yesterday )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthEnd(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  dim aDate As new Xojo.Core.Date(IIF(d.Month = 1, d.Year - 1, d.Year), IIF(d.Month = 1, 12, d.Month - 1), d.DaysInMonth(), 23, 59, 59,  Xojo.Core.TimeZone.Current)
		  
		  
		  return aDate// 31 decembre de l'annee
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastMonthStart(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  dim dd as new Xojo.Core.Date(IIF(d.Month = 1, d.Year - 1, d.Year), IIF(d.Month = 1, 12, d.Month - 1), 1, 0, 0, 1,Xojo.Core.TimeZone.Current)
		  
		  return dd
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterEnd(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  dim start as Xojo.Core.Date = d.QuarterEnd(firstDay)
		  start = start.Month(start.Month - 3)
		  start = start.day(start.day - 1)
		  start = start.Hour(23)
		  start = start.Minute(59)
		  start = start.Second(59)
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastQuarterStart(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  dim start as Xojo.Core.Date = d.QuarterStart(firstDay)
		  start = start.Month(start.Month - 3)
		  start = start.Hour(0)
		  start = start.Minute(0)
		  start = start.Second(1)
		  return start
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearEnd(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = nil) As Xojo.Core.Date
		  dim aDate as Xojo.Core.Date = d.YearEnd(firstDay)
		  aDate = aDate.Year(aDate.Year - 1)
		  aDate = aDate.Hour(23)
		  aDate = aDate.Minute(59)
		  aDate = aDate.Second(59)
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastYearStart(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = nil) As Xojo.Core.Date
		  dim aDate as Xojo.Core.Date = d.YearStart(firstDay)
		  aDate = aDate.Year(aDate.Year - 1)
		  aDate = aDate.Hour(0)
		  aDate = aDate.Minute(0)
		  aDate = aDate.Second(1)
		  
		  
		  return aDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongishDate(extends d As Xojo.Core.Date) As Text
		  // Return a date in the format: <month name> <day>, <year>
		  return d.MonthName + " " + d.Day.ToText + ", " + d.Year.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Minute(Extends d as Xojo.Core.Date, pMinute as integer) As Xojo.Core.Date
		  Return New Xojo.Core.Date(d.Year, d.Month, d.Day, d.Hour, pMinute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Month(Extends d as Xojo.Core.Date, pMonth as integer) As Xojo.Core.Date
		  Return New Xojo.Core.Date(d.Year, pMonth, d.Day, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthEnd(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  return new Xojo.Core.Date(d.Year , d.Month, d.DaysInMonth(), Xojo.Core.TimeZone.Current)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthName(Extends d as Xojo.Core.Date) As Text
		  return kMonths.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthNameShort(Extends d as Date) As Text
		  return kMonthsShort.NthField(",", d.month)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MonthStart(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  return new Xojo.Core.Date(d.Year , d.Month, 1, Xojo.Core.TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Nanosecond(Extends d as Xojo.Core.Date, pNanosecond as integer) As Xojo.Core.Date
		  return New Xojo.Core.Date(d.Year, d.Month, d.Day, d.Hour, d.Minute, d.Second, pNanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterEnd(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  d = d.Month(d.Month + 3)
		  d = d.Hour(23)
		  d = d.Minute(59)
		  d = d.Second(59)
		  return d.QuarterEnd(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextQuarterStart(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  d = d.Month(d.Month + 3)
		  d = d.Hour(0)
		  d = d.Minute(0)
		  d = d.Second(1)
		  return d.QuarterStart(firstDay)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextYear(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  return d.Year(d.Year + 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Quarter(Extends d as Xojo.Core.Date, firstDay as Xojo.Core.Date = Nil) As Integer
		  // Trimestre civil
		  if firstDay = nil then
		    return Ceil(d.Month / 3)
		  end
		  
		  dim q1, q2, q3, q4 as Xojo.Core.Date
		  
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
		Function QuarterEnd(Extends d As Xojo.Core.Date, firstDay As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  dim ThisQuarterEnd As Xojo.Core.Date = d.QuarterStart(firstDay)
		  ThisQuarterEnd = ThisQuarterEnd.Month(ThisQuarterEnd.Month + 3)
		  ThisQuarterEnd = ThisQuarterEnd.Hour(23)
		  ThisQuarterEnd = ThisQuarterEnd.Minute(59)
		  ThisQuarterEnd = ThisQuarterEnd.Second(59)
		  return ThisQuarterEnd
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuarterStart(Extends d as Xojo.Core.Date, firstDay as Xojo.Core.Date = Nil) As Xojo.Core.Date
		  firstDay = d.YearStart(firstDay)
		  
		  dim quarterStart as Xojo.Core.Date = firstDay
		  
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
		Function Second(Extends d as Xojo.Core.Date, pSecond as integer) As Xojo.Core.Date
		  Return New Xojo.Core.Date(d.Year, d.Month, d.Day, d.Hour, d.Minute, pSecond, d.Nanosecond, d.TimeZone)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLDate(Extends d as Xojo.Core.Date) As Text
		  if d=nil then Return ""
		  return d.ToText.Left(10)  // zéro base ?
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLDateTime(Extends d as Xojo.Core.Date) As Text
		  return d.ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLTime(Extends d as Xojo.Core.Date) As Text
		  return d.ToText.Mid(11)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixTime(extends d As Xojo.Core.Date) As UInt64
		  Return d.SecondsFrom1970
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekEnd(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  return New Xojo.Core.Date(d.Year, d.Month, d.Day + 7 - d.DayOfWeek, 23, 59, 59, xojo.Core.TimeZone.Current)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WeekStart(Extends d As Xojo.Core.Date) As Xojo.Core.Date
		  
		  
		  return new Xojo.Core.Date(d.Year + 1, d.Month, d.Day - d.DayOfWeek + 1, 0, 0, 1, Xojo.Core.TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XojoDateValue(Extends pDate As Date) As Xojo.Core.Date
		  
		  Return xojo.core.date.FromText(pDate.SQLDateTime.ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function XojoDateValue(Extends pVariant As Variant) As Xojo.Core.Date
		  
		  Return xojo.core.date.FromText(pVariant.StringValue.ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Year(Extends d as Xojo.Core.Date, pYear as integer) As Xojo.Core.Date
		  return New Xojo.Core.Date(pYear, d.Month, d.Day, d.Hour, d.Minute, d.Second, d.Nanosecond, d.TimeZone)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearEnd(Extends d As Xojo.core.date, firstDay As Xojo.core.Date = Nil) As Xojo.core.Date
		  Using Xojo.Core
		  dim aDate as Date = d.YearStart(firstDay)
		  aDate = aDate.Yesterday
		  
		  
		  
		  return new Xojo.Core.Date(aDate.Year + 1, aDate.Month, aDate.Day, 23, 59, 59, Xojo.Core.TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function YearStart(Extends d As Xojo.Core.Date, firstDate As Xojo.Core.Date = Nil) As Xojo.Core.Date
		  Using Xojo.Core
		  // Année fiscale
		  if firstDate <> Nil then
		    dim start as new date(d.Year, firstDate.Month, firstDate.Day, 0, 0, 1, 0, Xojo.Core.TimeZone.Current)
		    if start > d then
		      Dim ouwanYear As New DateInterval
		      ouwanYear.Years = 1
		      start = start - ouwanYear
		    end
		    
		    return start
		  end if
		  
		  
		  // Année civile - 1et janvier
		  return new Date(d.Year, 1, 1, 0, 0, 1, 0, Xojo.Core.TimeZone.Current)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Yesterday(extends d As Xojo.Core.Date) As Xojo.Core.Date
		  return new Xojo.Core.date(d.SecondsFrom1970 - kSecondsPerDay, Xojo.Core.TimeZone.Current)
		End Function
	#tag EndMethod


	#tag Constant, Name = kAnteMeridiem, Type = Text, Dynamic = True, Default = \"AM", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"AM"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"AM"
	#tag EndConstant

	#tag Constant, Name = kDayOfWeek, Type = Text, Dynamic = True, Default = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sunday\x2CMonday\x2CTuesday\x2CWednesday\x2CThursday\x2CFriday\x2CSaturday"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dimanche\x2CLundi\x2CMardi\x2CMercredi\x2CJeudi\x2CVendredi\x2CSamedi"
	#tag EndConstant

	#tag Constant, Name = kDayOfWeekShort, Type = Text, Dynamic = True, Default = \"Sun\x2CMon\x2CTue\x2CWed\x2CThu\x2CFri\x2CSat", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Sun\x2CMon\x2CTue\x2CWed\x2CThu\x2CFri\x2CSat"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dim\x2CLun\x2CMar\x2CMer\x2CJeu\x2CVen\x2CSam"
	#tag EndConstant

	#tag Constant, Name = kMonths, Type = Text, Dynamic = True, Default = \"January\x2CFebruary\x2CMarch\x2CApril\x2CMay\x2CJune\x2CJuly\x2CAugust\x2CSeptember\x2COctober\x2CNovember\x2CDecember", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"January\x2CFebruary\x2CMarch\x2CApril\x2CMay\x2CJune\x2CJuly\x2CAugust\x2CSeptember\x2COctober\x2CNovember\x2CDecember"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Janvier\x2CF\xC3\xA9vrier\x2CMars\x2CAvril\x2CMai\x2CJuin\x2CJuillet\x2CAo\xC3\xBBt\x2CSeptembre\x2COctobre\x2CNovembre\x2CD\xC3\xA9cembre"
	#tag EndConstant

	#tag Constant, Name = kMonthsShort, Type = Text, Dynamic = True, Default = \"Jan\x2CFeb\x2CMar\x2CApr\x2CMay\x2CJun\x2CJul\x2CAug\x2CSep\x2COct\x2CNov\x2CDec", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Jan\x2CFeb\x2CMar\x2CApr\x2CMay\x2CJun\x2CJul\x2CAug\x2CSep\x2COct\x2CNov\x2CDec"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Jan\x2CF\xC3\xA9v\x2CMar\x2CAvr\x2CMai\x2CJun\x2CJul\x2CAo\xC3\xBB\x2CSep\x2COct\x2CNov\x2CD\xC3\xA9c"
	#tag EndConstant

	#tag Constant, Name = kPostMeridiem, Type = Text, Dynamic = True, Default = \"PM", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"PM"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"PM"
	#tag EndConstant

	#tag Constant, Name = kSecondsPerDay, Type = Double, Dynamic = False, Default = \"86400", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kToday, Type = Text, Dynamic = True, Default = \"Today", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Today"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Aujourd\'hui"
	#tag EndConstant

	#tag Constant, Name = kTomorrow, Type = Text, Dynamic = True, Default = \"Tomorrow", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Tomorrow"
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Demain"
	#tag EndConstant

	#tag Constant, Name = kYesterday, Type = Text, Dynamic = True, Default = \"Yesterday", Scope = Protected
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
