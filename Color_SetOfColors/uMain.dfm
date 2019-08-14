object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'SetOfColors'
  ClientHeight = 429
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMMain
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object clLstBoxColors: TColorListBox
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 169
    Height = 287
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 23
  end
  object pnlHead: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 453
    Height = 62
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      453
      62)
    object btnAdd: TButton
      Left = 371
      Top = 33
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Add'
      TabOrder = 0
      OnClick = btnAddClick
      ExplicitTop = 49
    end
    object btnReset: TButton
      Left = 371
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Reset'
      TabOrder = 1
      OnClick = btnResetClick
      ExplicitTop = 18
    end
    object pnlChoiceColor: TPanel
      Left = 10
      Top = 10
      Width = 142
      Height = 41
      BevelOuter = bvLowered
      Color = clBlack
      ParentBackground = False
      TabOrder = 2
    end
  end
  object lstBoxColor: TListBox
    AlignWithMargins = True
    Left = 175
    Top = 71
    Width = 169
    Height = 132
    ItemHeight = 13
    TabOrder = 2
    OnMouseMove = lstBoxColorMouseMove
  end
  object pnlBottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 364
    Width = 453
    Height = 62
    Align = alBottom
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = 0
    ExplicitTop = 331
    ExplicitWidth = 459
    DesignSize = (
      453
      62)
    object btnDisplay: TButton
      Left = 371
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Display'
      TabOrder = 0
      OnClick = btnDisplayClick
    end
  end
  object BindingsList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 108
    Top = 101
    object LinkControlToPropertyColor2: TLinkControlToProperty
      Category = 'Schnelle Bindungen'
      Control = clLstBoxColors
      Track = True
      Component = pnlChoiceColor
      ComponentProperty = 'Color'
      InitializeControlValue = False
    end
  end
  object actLstMain: TActionList
    Left = 337
    Top = 264
    object actClear: TAction
      Category = 'Action'
      Caption = 'Clear'
      ShortCut = 16451
    end
    object actSum: TAction
      Category = 'Action'
      Caption = 'Sum'
      ShortCut = 16467
    end
    object actOpenFile: TAction
      Category = 'File'
      Caption = 'Open File(s)...'
    end
    object actShowInExplorer: TAction
      Caption = 'Show in Explorer'
    end
    object actOpenFolder: TAction
      Category = 'File'
      Caption = 'Open Folder(s)...'
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actFrame1: TAction
      Category = 'View'
      Caption = 'Frame &1'
      ShortCut = 16496
    end
    object actOption: TAction
      Category = 'Option'
      Caption = 'Option'
      ShortCut = 16463
    end
    object actAbout: TAction
      Category = 'About'
      Caption = 'Info'
      ShortCut = 16457
      OnExecute = actAboutExecute
    end
    object actFrame2: TAction
      Category = 'View'
      Caption = 'Frame &2'
      ShortCut = 16497
    end
  end
  object MMMain: TMainMenu
    Left = 232
    Top = 264
    object File1: TMenuItem
      Caption = 'File'
      object OpenFiles1: TMenuItem
        Action = actOpenFile
      end
      object OpenFolders1: TMenuItem
        Action = actOpenFolder
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = actExit
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object Refresh1: TMenuItem
        Action = actFrame1
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Frame21: TMenuItem
        Action = actFrame2
      end
    end
    object A2: TMenuItem
      Caption = 'About'
      object actAbout1: TMenuItem
        Action = actAbout
      end
    end
  end
end
