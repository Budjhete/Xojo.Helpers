#tag Module
Protected Module ControlExtra
	#tag Method, Flags = &h0
		Sub AccessTo(Extends toolbar as Toolbar, ItemName as String, License as String, Permission as String)
		  'dim item as ToolItem = toolbar.Find(ItemName)
		  '
		  'if item <> nil then
		  'item.Enabled = Company.Current().AccessTo(License, Permission)
		  'end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(Extends popup as BHPopupMenu, text as String, tag as Variant)
		  #if not TargetMacOS
		    if Text = "-" then
		      return
		    end
		  #endif
		  
		  popup.AddRow(text)
		  popup.RowTag(popup.ListCount-1) = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendAfter(Extends menu as MenuItem, after as String, from as MenuItem)
		  dim index as Integer = menu.IndexOf(after)
		  
		  if index >= 0 then
		    For i as Integer = 0 to (from.Count-1)
		      index = index + 1
		      menu.Insert(index, from.Item(i))
		    Next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendBefore(Extends menu as MenuItem, before as String, from as MenuItem)
		  dim index as Integer = menu.IndexOf(before)
		  
		  if index >= 0 then
		    menu.Insert(index, from)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendSeparator(Extends menu as MenuItem)
		  menu.Append(new MenuItem(MenuItem.TextSeparator))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bottom(Extends ctrl as RectControl) As Integer
		  return ctrl.Top + ctrl.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnLeft(Extends ctrl as ListBox, column as Integer) As Integer
		  dim left as Integer = ctrl.ScreenX
		  
		  for i as Integer = 0 to (column-1)
		    left = left + ctrl.Column(i).WidthActual
		  next
		  
		  return left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(Extends menu as MenuItem, item as MenuItem) As Boolean
		  For i as Integer = 0 to menu.Count-1
		    if menu.Item(i) = item then
		      return true
		    end
		  Next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllItems(Extends toolbar as Toolbar)
		  For i as Integer = (toolbar.Count-1) downto 0
		    toolbar.Remove(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmptyRow(Extends list as ListBox, row As Integer)
		  if row >= list.ListCount then
		    return
		  end
		  
		  for column As Integer = 0 To list.ColumnCount
		    list.Cell(row, column) = ""
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EvaluateGraphics() As Graphics
		  if pEvaluation = nil then
		    pEvaluation = new Picture(1, 1, 32)
		  end
		  
		  return pEvaluation.Graphics
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EvaluateHeight(control as Label, text as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.TextFont = control.TextFont
		  g.TextSize = control.TextSize
		  g.TextUnit = control.TextUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.StringHeight(text, control.Width)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EvaluateWidth(control as Label, text as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.TextFont = control.TextFont
		  g.TextSize = control.TextSize
		  g.TextUnit = control.TextUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.StringWidth(text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EvaluateWidth(control as PushButton, text as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.TextFont = control.TextFont
		  g.TextSize = control.TextSize
		  g.TextUnit = control.TextUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.StringWidth(text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(Extends menu as MenuItem, name as String) As MenuItem
		  For i as Integer = 0 to (menu.Count-1)
		    if menu.Item(i).Name = name then
		      return menu.Item(i)
		    end
		    
		    dim itm as MenuItem = menu.Item(i).Find(name)
		    if itm <> nil then
		      return itm
		    end
		  Next
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(Extends toolbar as Toolbar, name as String) As ToolItem
		  for i as Integer = 0 to toolbar.Count-1
		    if toolbar.Item(i).Name = name then
		      return toolbar.Item(i)
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HaveFocus(Extends ctrl as Control) As Boolean
		  return (ctrl.Window.Focus = ctrl)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hovered(Extends pControl As RectControl) As Boolean
		  Return pControl.MouseControlX.Between(0, pControl.Width) And pControl.MouseControlY.Between(0, pControl.Height)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Extends menu as MenuItem, name as String) As Integer
		  For i as Integer = 0 to (menu.Count-1)
		    if menu.Item(i).Name = name then
		      return i
		    end
		  Next
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Extends tabPanel as TabPanel, name as String) As Integer
		  for i as Integer = 0 to tabPanel.PanelCount-1
		    if tabPanel.Caption(i) = name then
		      return i
		    end
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertAfter(Extends menu as MenuItem, after as String, from as MenuItem)
		  dim index as Integer = menu.IndexOf(after)
		  
		  if index >= 0 then
		    menu.Insert(index+1, from)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRow(Extends popup as BHPopupMenu, index as Integer, text as String, tag as Variant)
		  popup.InsertRow(index, text)
		  popup.RowTag(index) = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMouseHover(Extends ctrl as RectControl) As Boolean
		  dim X as Integer = ctrl.MouseControlX
		  dim Y as Integer = ctrl.MouseControlX
		  
		  return (X >= 0 and X < ctrl.Width and Y >= 0 and Y < ctrl.Height)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCount(Extends button as BevelButton) As Integer
		  #pragma BreakOnExceptions Off
		  
		  dim count as Integer = 0
		  
		  try
		    while true
		      call button.List(count)
		      count = count + 1
		    wend
		  catch ex as OutOfBoundsException
		    // do nothing
		  end
		  
		  return count
		  
		  #pragma BreakOnExceptions Default
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LockWidth(Extends ctrl as RectControl, Assigns value as Integer)
		  if ctrl.LockRight then
		    dim right as Integer = ctrl.Right
		    ctrl.Width = value
		    ctrl.Right = right
		  else
		    ctrl.Width = value
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseControlX(Extends pControl as RectControl) As Integer
		  return (pControl.MouseX - pControl.WindowLeft)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseControlY(Extends pControl as RectControl) As Integer
		  return (pControl.MouseY - pControl.WindowTop)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Extends menu as MenuItem, name as String)
		  dim index as Integer = menu.IndexOf(name)
		  if index >= 0 then
		    menu.Remove(index)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Extends tabPanel as TabPanel, name as String)
		  dim index as Integer = tabPanel.IndexOf(name)
		  
		  if index >= 0 then
		    tabPanel.Remove(index)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Extends toolbar as Toolbar, name as String)
		  For i as Integer = 0 to (toolbar.Count-1)
		    if toolbar.Item(i).Name = name then
		      toolbar.Remove(i)
		      return
		    end
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveByTag(Extends popup as PopupMenu, value as Variant)
		  dim index as Integer = popup.ListIndex
		  
		  for i as Integer = (popup.ListCount-1) downto 0
		    if popup.RowTag(i) = value then
		      popup.RemoveRow(i)
		      
		      if index = i then
		        index = -1
		      elseif index < i then
		        
		      end
		    end
		  next
		  
		  if popup.ListIndex <> index then
		    popup.ListIndex = index
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveByText(Extends listbox as ListBox, text as String, column as Integer = 0)
		  for row as Integer = listbox.ListCount-1 downto 0
		    if listbox.Cell(row, column) = text then
		      listbox.RemoveRow(row)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOnCondition(Extends toolbar as Toolbar, name as String, condition as Boolean)
		  if condition then
		    toolbar.Remove(name)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Right(Extends ctrl as RectControl) As Integer
		  return ctrl.Window.Width - ctrl.RightPosition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Right(Extends ctrl as RectControl, Assigns value as Integer)
		  ctrl.RightPosition = ctrl.Window.Width - value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightPosition(Extends ctrl as RectControl) As Integer
		  return ctrl.Left + ctrl.Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RightPosition(Extends ctrl as RectControl, Assigns value as Integer)
		  ctrl.Left = value - ctrl.Width
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTop(Extends ctrl as ListBox, row as Integer) As Integer
		  return  (ctrl.ScreenY + ctrl.HeaderHeight + ctrl.RowHeight * (row - ctrl.ScrollPosition))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenX(Extends ctrl as RectControl) As Integer
		  if ctrl.Window IsA ViewContainer then
		    return ctrl.Left + ViewContainer(ctrl.Window).ScreenX
		  else
		    return ctrl.Left + ctrl.Window.Left
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenY(Extends ctrl as RectControl) As Integer
		  if ctrl.Window IsA ViewContainer then
		    return ctrl.Top + ViewContainer(ctrl.Window).ScreenY
		  else
		    return ctrl.Top + ctrl.Window.Top
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tag(Extends popup as PopupMenu) As Variant
		  if popup.ListIndex < 0 then
		    return nil
		  end
		  
		  return popup.RowTag(popup.ListIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tag(Extends popup as PopupMenu, Assigns value as Variant)
		  for i as Integer = 0 to (popup.ListCount-1)
		    if popup.List(i) <> "-" and popup.RowTag(i) = value then
		      popup.ListIndex = i
		      return
		    end
		  next
		  
		  popup.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TagExists(Extends popup as PopupMenu, value as Variant) As Boolean
		  for i as Integer = 0 to (popup.ListCount-1)
		    if popup.RowTag(i) = value then
		      return true
		    end
		  next
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Toolbar(Extends win as Window) As Toolbar
		  for i as Integer = 0 to (win.ControlCount-1)
		    if win.Control(i) IsA Toolbar then
		      return Toolbar(win.Control(i))
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WindowLeft(Extends ctrl as RectControl) As Integer
		  Dim value As Integer = ctrl.Left
		  
		  dim theContainer as Window = ctrl.Window
		  
		  while theContainer IsA ContainerControl
		    if theContainer IsA ViewContainer then
		      value = value + ViewContainer(theContainer).InitialLeft
		    else
		      value = value + theContainer.Left
		    end
		    
		    theContainer = ContainerControl(theContainer).Window
		  wend
		  
		  return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WindowTop(Extends ctrl as RectControl) As Integer
		  Dim value As Integer = ctrl.Top
		  
		  dim theContainer as Window = ctrl.Window
		  
		  while theContainer IsA ContainerControl
		    if theContainer IsA ViewContainer then
		      value = value + ViewContainer(theContainer).InitialTop
		    else
		      value = value + theContainer.Top
		    end
		    
		    theContainer = ContainerControl(theContainer).Window
		  wend
		  
		  return value
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pEvaluation As Picture
	#tag EndProperty


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
