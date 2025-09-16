#tag Module
Protected Module ControlExtra
	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub AccessTo(Extends toolbar as DesktopToolbar, ItemName as String, License as String, Permission as String)
		  'dim item as ToolItem = toolbar.Find(ItemName)
		  '
		  'if item <> nil then
		  'item.Enabled = Company.Current().AccessTo(License, Permission)
		  'end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub AppendAfter(Extends menu as DesktopMenuItem, after as String, from as DesktopMenuItem)
		  dim index as Integer = menu.IndexOf(after)
		  
		  if index >= 0 then
		    For i as Integer = 0 to (from.Count-1)
		      index = index + 1
		      menu.AddMenuAt(index, from.MenuAt(i))
		    Next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub AppendBefore(Extends menu as DesktopMenuItem, before as String, from as DesktopMenuItem)
		  dim index as Integer = menu.IndexOf(before)
		  
		  if index >= 0 then
		    menu.AddMenuAt(index, from)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub AppendSeparator(Extends menu as DesktopMenuItem)
		  menu.AddMenu(new DesktopMenuItem(DesktopMenuItem.TextSeparator))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Bottom(Extends ctrl as DesktopUIControl) As Integer
		  return ctrl.Top + ctrl.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ColumnLeft(Extends ctrl as DesktopListBox, column as Integer) As Integer
		  dim left as Integer = ctrl.ScreenX
		  
		  for i as Integer = 0 to (column-1)
		    left = left + ctrl.ColumnAttributesAt(i).WidthActual
		  next
		  
		  return left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Contains(Extends menu as DesktopMenuItem, item as DesktopMenuItem) As Boolean
		  For i as Integer = 0 to menu.Count-1
		    if menu.MenuAt(i) = item then
		      return true
		    end
		  Next
		  
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DeleteAllItems(Extends toolbar as DesktopToolbar)
		  For i as Integer = (toolbar.Count-1) downto 0
		    toolbar.RemoveButtonAt(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub EmptyRow(Extends list As DesktopListBox, row As Integer)
		  if row >= list.RowCount then
		    return
		  end
		  
		  for column As Integer = 0 To list.ColumnCount
		    list.CellTextAt(row, column) = ""
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Private Function EvaluateGraphics() As Graphics
		  if pEvaluation = nil then
		    pEvaluation = new Picture(1, 1, 32)
		  end
		  
		  return pEvaluation.Graphics
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function EvaluateHeight(control as DesktopLabel, pText as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.FontName = control.FontName
		  g.FontSize = control.FontSize
		  g.FontUnit = control.FontUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.StringHeight(pText, control.Width)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function EvaluateWidth(control as DesktopButton, text as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.FontName = control.FontName
		  g.FontSize = control.FontSize
		  g.FontUnit = control.FontUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.TextWidth(text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Protected Function EvaluateWidth(control as DesktopLabel, text as String) As Integer
		  dim g as Graphics = EvaluateGraphics
		  
		  g.FontName = control.FontName
		  g.FontSize = control.FontSize
		  g.FontUnit = control.FontUnit
		  g.Bold = control.Bold
		  g.Italic = control.Italic
		  g.Underline = control.Underline
		  
		  return g.TextWidth(text)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Find(Extends menu as DesktopMenuItem, name as String) As DesktopMenuItem
		  For i as Integer = 0 to (menu.Count-1)
		    if menu.MenuAt(i).Name = name then
		      return menu.MenuAt(i)
		    end
		    
		    dim itm as DesktopMenuItem = menu.MenuAt(i).Find(name)
		    if itm <> nil then
		      return itm
		    end
		  Next
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Find(Extends toolbar as DesktopToolbar, name as String) As DesktopToolbarItem
		  for i as Integer = 0 to toolbar.Count-1
		    if toolbar.ButtonAt(i).Name = name then
		      return toolbar.ButtonAt(i)
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindParentContainer(Extends control as DesktopContainer) As DesktopContainer
		  Var currentParent As Object = control.Parent
		  
		  While currentParent <> Nil
		    If currentParent IsA DesktopContainer Then
		      Return DesktopContainer(currentParent)
		    ElseIf currentParent IsA DesktopUIControl Then
		      currentParent = DesktopUIControl(currentParent).Parent
		    Else
		      Return Nil // Reached a window or other non-container
		    End If
		  Wend
		  
		  Return Nil // No DesktopContainer found
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindParentContainer(Extends control as DesktopUIControl) As DesktopContainer
		  Var currentParent As Object = control.Parent
		  
		  While currentParent <> Nil
		    If currentParent IsA DesktopContainer Then
		      Return DesktopContainer(currentParent)
		    ElseIf currentParent IsA DesktopUIControl Then
		      currentParent = DesktopUIControl(currentParent).Parent
		    Else
		      Return Nil // Reached a window or other non-container
		    End If
		  Wend
		  
		  Return Nil // No DesktopContainer found
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function HaveFocus(Extends ctrl as DesktopControl) As Boolean
		  return (ctrl.Window.Focus = ctrl)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function IndexOf(Extends menu as DesktopMenuItem, name as String) As Integer
		  For i as Integer = 0 to (menu.Count-1)
		    if menu.MenuAt(i).Name = name then
		      return i
		    end
		  Next
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function IndexOf(Extends tabPanel as DesktopTabPanel, name as String) As Integer
		  for i as Integer = 0 to tabPanel.PanelCount-1
		    if tabPanel.CaptionAt(i) = name then
		      return i
		    end
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub InsertAfter(Extends menu as DesktopMenuItem, after as String, from as DesktopMenuItem)
		  dim index as Integer = menu.IndexOf(after)
		  
		  if index >= 0 then
		    menu.AddMenuAt(index+1, from)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub InsertRow(Extends popup as BHPopupMenu, index as Integer, text as String, tag as Auto)
		  popup.InsertRow(index, text)
		  popup.RowTagAt(index) = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function IsMouseHover(Extends ctrl as DesktopUIControl) As Boolean
		  dim X as Integer = ctrl.MouseControlX
		  dim Y as Integer = ctrl.MouseControlX
		  
		  return (X >= 0 and X < ctrl.Width and Y >= 0 and Y < ctrl.Height)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub LockWidth(Extends ctrl as DesktopUIControl, Assigns value as Integer)
		  if ctrl.LockRight then
		    dim right as Integer = ctrl.Right
		    ctrl.Width = value
		    ctrl.Right = right
		  else
		    ctrl.Width = value
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MouseControlX(Extends pControl as DesktopUIControl) As Integer
		  return (System.MouseX - pControl.WindowLeft)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function MouseControlY(Extends pControl as DesktopUIControl) As Integer
		  return (System.MouseY - pControl.WindowTop)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Remove(Extends menu as DesktopMenuItem, name as String)
		  dim index as Integer = menu.IndexOf(name)
		  if index >= 0 then
		    menu.RemoveMenuAt(index)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Remove(Extends tabPanel as DesktopTabPanel, name as String)
		  dim index as Integer = tabPanel.IndexOf(name)
		  
		  if index >= 0 then
		    tabPanel.RemovePanelAt(index)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Remove(Extends toolbar as DesktopToolbar, name as String)
		  For i as Integer = 0 to (toolbar.Count-1)
		    if toolbar.ButtonAt(i).Name = name then
		      toolbar.RemoveButtonAt(i)
		      return
		    end
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RemoveByTag(Extends popup as DesktopPopupMenu, value as Auto)
		  dim index as Integer = popup.SelectedRowIndex
		  
		  for i as Integer = (popup.RowCount-1) downto 0
		    if popup.RowTagAt(i) = value then
		      popup.RemoveRowAt(i)
		      
		      if index = i then
		        index = -1
		      elseif index < i then
		        
		      end
		    end
		  next
		  
		  if popup.SelectedRowIndex <> index then
		    popup.SelectedRowIndex = index
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RemoveByText(Extends pListbox as DesktopListBox, text as String, column as Integer = 0)
		  for row as Integer = pListbox.RowCount-1 downto 0
		    if pListbox.CellTextAt(row, column) = text then
		      pListbox.RemoveRowAt(row)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RemoveOnCondition(Extends toolbar as DesktopToolbar, name as String, condition as Boolean)
		  if condition then
		    toolbar.Remove(name)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Right(Extends ctrl as DesktopUIControl) As Integer
		  return ctrl.Window.Width - ctrl.RightPosition
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Right(Extends ctrl as DesktopUIControl, Assigns value as Integer)
		  ctrl.RightPosition = ctrl.Window.Width - value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function RightPosition(Extends ctrl as DesktopUIControl) As Integer
		  return ctrl.Left + ctrl.Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub RightPosition(Extends ctrl as DesktopUIControl, Assigns value as Integer)
		  ctrl.Left = value - ctrl.Width
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function RowCount(Extends button as DesktopBevelButton) As Integer
		  if button.Menu<>nil then 
		    Return button.Menu.LastRowIndex + 1
		  else
		    Return 0
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function RowTop(Extends ctrl as DesktopListBox, row as Integer) As Integer
		  return  (ctrl.ScreenY + ctrl.HeaderHeight + ctrl.RowHeight * (row - ctrl.ScrollPosition))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenX(Extends ctrl as DesktopUIControl) As Integer
		  return ctrl.Left + ctrl.Window.Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function ScreenY(Extends ctrl as DesktopUIControl) As Integer
		  return ctrl.top + ctrl.Window.top
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Tag(Extends popup as DesktopPopupMenu) As Variant
		  if popup.SelectedRowIndex < 0 then
		    return nil
		  end
		  
		  return popup.RowTagAt(popup.SelectedRowIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Tag(Extends popup as DesktopPopupMenu, Assigns value as Variant)
		  for i as Integer = 0 to (popup.RowCount-1)
		    if popup.RowTextAt(i) <> "-" and popup.RowTagAt(i) = value then
		      popup.SelectedRowIndex = i
		      return
		    end
		  next
		  
		  popup.SelectedRowIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function TagExists(Extends popup as DesktopPopupMenu, value as Auto) As Boolean
		  for i as Integer = 0 to (popup.RowCount-1)
		    if popup.RowTagAt(i) = value then
		      return true
		    end
		  next
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Function Toolbar(Extends win as DesktopWindow) As DesktopToolbar
		  for i as Integer = 0 to (win.ControlCount-1)
		    if win.ControlAt(i) IsA DesktopToolbar then
		      return DesktopToolbar(win.ControlAt(i))
		    end
		  next
		  
		  return nil
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Private pEvaluation As Picture
	#tag EndProperty


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
