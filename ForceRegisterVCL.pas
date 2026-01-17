unit ForceRegisterVCL;

interface

implementation

uses
  System.Classes,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBGrids;

initialization
  // Explicitly register common VCL classes used in DFMs so the form streamer always finds them.
  RegisterClass(TLabel);
  RegisterClass(TEdit);
  RegisterClass(TButton);
  RegisterClass(TComboBox);
  RegisterClass(TCheckBox);
  RegisterClass(TRadioButton);
  RegisterClass(TPanel);
  RegisterClass(TGroupBox);
  RegisterClass(TDateTimePicker);
  RegisterClass(TDBGrid);
end.

