object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 340
  Width = 413
  object dsCustomer: TDataSource
    DataSet = qryCustomer
    Left = 24
    Top = 16
  end
  object qryCustomer: TQuery
    DatabaseName = 'ARDB'
    Left = 40
    Top = 32
  end
end
