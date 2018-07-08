#tag Module
Protected Module GraphicsExtra
	#tag Method, Flags = &h0
		Function Contains(Extends g as Graphics, x as Integer, y as Integer) As Boolean
		  return (x >= 0 and y >= 0 and x < g.Width and y < g.Height)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawDottedLine(Extends g as Graphics, x1 as Integer, y1 as Integer, x2 as Integer, y2 as Integer, space as Integer = 1)
		  dim x, y, dx, dy as Integer
		  
		  ' On s'assure que x1 et y1 sont respectivements plus petits que x1 et y2
		  if x1 >x2 then
		    x = x2
		    x2 = x1
		    x1 = x
		  end
		  
		  if y1 > y2 then
		    y = y2
		    y2 = y1
		    y1 = y
		  end
		  
		  dx = x2 - x1
		  dy = y2 - y1
		  
		  
		  // On dessine les lignes
		  space = space + 1
		  
		  if dy > dx then
		    
		    for y = y1 to y2 step space
		      x = x1 + dx * (y - y1) / dy
		      
		      if g.Contains(x, y) then
		        g.Pixel(x, y) = g.ForeColor
		      end
		    next
		    
		  else
		    
		    for x = x1 to x2 step space
		      y = y1 + dy * (x - x1) / dx
		      
		      if g.Contains(x, y) then
		        g.Pixel(x, y) = g.ForeColor
		      end
		    next
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawGradientX(Extends g as Graphics, xStart as Integer, colorStart as Color, xEnd as Integer, colorEnd as Color)
		  dim length as Integer = Abs(xEnd - xStart)
		  
		  For i as Integer = xStart to xEnd
		    g.ForeColor = RGB(colorStart.Red+i*(colorEnd.Red-colorStart.Red)/length, _
		    colorStart.Green+i*(colorEnd.Green-colorStart.Green)/length, _
		    colorStart.Blue+i*(colorEnd.Blue-colorStart.Blue)/length)
		    
		    g.DrawLine i, 0, i, g.Height
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawGradientY(Extends g as Graphics, yStart as Integer, colorStart as Color, yEnd as Integer, colorEnd as Color)
		  dim length as Integer = Abs(yEnd - yStart)
		  
		  For i as Integer = yStart to yEnd
		    g.ForeColor = RGB(colorStart.Red+i*(colorEnd.Red-colorStart.Red)/length, _
		    colorStart.Green+i*(colorEnd.Green-colorStart.Green)/length, _
		    colorStart.Blue+i*(colorEnd.Blue-colorStart.Blue)/length)
		    
		    g.DrawLine 0, i, g.Width, i
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target32Bit or Target64Bit))
		Sub DrawListBox(Extends g as Graphics, list as ListBox, x as Integer, y as Integer, width as Integer, height as Integer = 0)
		  dim pX, pY as Integer
		  
		  dim cWidths() as Integer
		  dim cNames() as String = list.InitialValue.Split(Tabulation)
		  dim size as Integer
		  
		  pX = 0
		  pY = 0
		  for i as Integer = 0 to (list.ColumnCount-1)
		    size = list.Column(i).WidthActual * width / list.Width
		    cWidths.Append(size)
		    pX = pX + size
		  next
		  
		  if pX < width then
		    cWidths(0) = cWidths(0) + (width - pX)
		  end
		  
		  g.ForeColor = &ceeeeee
		  g.FillRect(x, y, width, 20)
		  
		  g.ForeColor = &c666666
		  g.DrawLine(x, y+20, x+width-1, y+20)
		  
		  
		  g.Bold = True
		  pX = x
		  for column as Integer = 0 to cWidths.Ubound
		    if cWidths(column) > 0 then
		      g.ForeColor = &c000000
		      g.DrawString(cNames(column), pX+cWidths(column)/2, y + 15, TextAlign.Center)
		    end
		    
		    pX = pX + cWidths(column)
		  next
		  
		  g.Bold = False
		  g.ForeColor = &c000000
		  
		  pY = y+35
		  for row as Integer = 0 to list.LastIndex
		    if height <> 0 and (pY - y) > height then
		      continue
		    end
		    
		    pX = x
		    
		    for column as Integer = 0 to cWidths.Ubound
		      if cWidths(column) > 0 then
		        if list.ColumnAlignment(column) = 3 then
		          g.DrawString(list.Cell(row, column), pX+cWidths(column)-3, pY, TextAlign.Right)
		        elseif list.ColumnAlignment(column) = 2 then
		          g.DrawString(list.Cell(row, column), pX+cWidths(column)/2, pY, TextAlign.Center)
		        else
		          g.DrawString(list.Cell(row, column), pX+3, pY)
		        end
		      end
		      
		      pX = pX + cWidths(column)
		    next
		    
		    pY = pY + g.TextHeight+3
		  next
		  
		  
		  if height = 0 then
		    height = (pY - y + 1)
		  end
		  
		  pX = x
		  g.ForeColor = &c666666
		  for column as Integer = 0 to cWidths.Ubound
		    if column > 0 and cWidths(column) > 0 then
		      g.DrawLine(pX, y, pX, y+height-1)
		    end
		    
		    pX = pX + cWidths(column)
		  next
		  
		  
		  g.ForeColor = &c666666
		  g.DrawRect(x, y, width, height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPicture(Extends g as Graphics, pic as Picture, hAlign as HorizontalAlign = HorizontalAlign.Left, vAlign as VerticalAlign = VerticalAlign.Middle, offsetX as Integer = 0, offsetY as Integer = 0)
		  dim x, y as Integer
		  
		  if hAlign = HorizontalAlign.Center then
		    x = (g.Width - pic.Width) / 2
		  elseif hAlign = HorizontalAlign.Right then
		    x = (g.Width - pic.Width)
		    offsetX = -1.0 * offsetX
		  end
		  
		  
		  if vAlign = VerticalAlign.Middle then
		    y = (g.Height - pic.Height) / 2
		  elseif vAlign = VerticalAlign.Bottom then
		    y = (g.Height - pic.Height)
		    offsetY = -1.0 * offsetY
		  end
		  
		  g.DrawPicture(pic, (x+offsetX), (y+offsetY))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawString(Extends g as Graphics, text as String, x as Integer, y as Integer, width as Integer, align as TextAlign, alignOnPivot as Boolean = true)
		  if align = TextAlign.Left then
		    g.DrawString(text, x, y, width)
		  else
		    dim lines() as String = g.Wrap(text, width)
		    
		    for i as Integer = 0 to lines.Ubound
		      dim lineWidth as Integer = g.StringWidth(lines(i))
		      
		      if align = TextAlign.Center then
		        g.DrawString(lines(i), (x + (width - lineWidth)/2), y)
		      else
		        g.DrawString(lines(i), (x + width - lineWidth), y)
		      end
		      
		      y = y + g.TextHeight
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawString(Extends g as Graphics, text as String, x as Integer, y as Integer, align as TextAlign)
		  dim lines() as String = text.Split(EndOfLine)
		  
		  for i as Integer = 0 to lines.Ubound
		    if align = TextAlign.Left then
		      g.DrawString(lines(i), x, y)
		    elseif align = TextAlign.Center then
		      dim width as Double = g.StringWidth(lines(i))
		      g.DrawString(lines(i), (x - width/2), y)
		    else
		      dim width as Double = g.StringWidth(lines(i))
		      g.DrawString(lines(i), (x-width), y)
		    end
		    
		    y = y + g.TextHeight
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Wrap(Extends g as Graphics, text as String, width as Integer) As String()
		  dim lines() as String
		  dim para() as String = text.Split(EndOfLine)
		  
		  for p as Integer = 0 to para.Ubound
		    dim ret() as String = g.WrapLine(para(p), width)
		    
		    for i as Integer = 0 to ret.Ubound
		      lines.Append(ret(i))
		    next
		  next
		  
		  return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WrapLine(Extends g as Graphics, line as String, width as Integer) As String()
		  dim lines() as String
		  
		  if g.StringWidth(line) <= width then
		    lines.Append(line)
		    return lines
		  end
		  
		  dim words() as String = line.Split(" ")
		  dim buffer, tmp as String
		  
		  for w as Integer = 0 to words.Ubound
		    if buffer = "" then
		      buffer = words(w)
		    else
		      tmp = buffer + " "+words(w)
		      
		      if g.StringWidth(tmp) > width then
		        lines.Append(buffer)
		        buffer = words(w)
		      else
		        buffer = tmp
		      end
		    end
		  next
		  
		  if buffer <> "" then
		    lines.Append(buffer)
		  end
		  
		  return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WrapWord(Extends g as Graphics, word as String, width as Integer) As String()
		  dim lines() as String
		  
		  if g.StringWidth(word) <= width then
		    lines.Append(word)
		    return lines
		  end
		End Function
	#tag EndMethod


	#tag Enum, Name = HorizontalAlign, Type = Integer, Flags = &h0
		Left
		  Center
		Right
	#tag EndEnum

	#tag Enum, Name = TextAlign, Type = Integer, Flags = &h0
		Left
		  Center
		Right
	#tag EndEnum

	#tag Enum, Name = VerticalAlign, Type = Integer, Flags = &h0
		Top
		  Middle
		Bottom
	#tag EndEnum


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
