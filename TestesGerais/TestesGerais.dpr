program TestesGerais;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  UDM_CadPessoal in 'Modulo_Cadastro\UDM_CadPessoal.pas' {DM_CadPessoal: TDataModule},
  UFrmCadPessoal in 'Modulo_Cadastro\UFrmCadPessoal.pas' {FrmCadPessoal},
  UFuncoes in 'UFuncoes.pas',
  UPesquisar in 'UPesquisar.pas' {FrmPesquisar},
  UFrmCadClientes in 'Modulo_Cadastro\UFrmCadClientes.pas' {FrmCadClientes},
  UDM_CadClientes in 'Modulo_Cadastro\UDM_CadClientes.pas' {DM_CadClientes: TDataModule},
  UFrmCadFornecedores in 'Modulo_Cadastro\UFrmCadFornecedores.pas' {FrmCadFornecedores},
  UDM_CadFornecedores in 'Modulo_Cadastro\UDM_CadFornecedores.pas' {DM_CadFornecedores: TDataModule},
  UFrmCadProdutos in 'Modulo_Cadastro\UFrmCadProdutos.pas' {FrmCadProdutos},
  UDM_CadProdutos in 'Modulo_Cadastro\UDM_CadProdutos.pas' {DM_CadProdutos: TDataModule},
  UFrmCEP in 'Modulo_Cadastro\UFrmCEP.pas' {FrmCEP},
  UDM_CadServicos in 'Modulo_Cadastro\UDM_CadServicos.pas' {DM_CadServicos: TDataModule},
  UFrmCadServicos in 'Modulo_Cadastro\UFrmCadServicos.pas' {FrmCadServicos},
  UDM_CadCategorias in 'Modulo_Cadastro\UDM_CadCategorias.pas' {DM_CadCategorias: TDataModule},
  UFrmCadCategorias in 'Modulo_Cadastro\UFrmCadCategorias.pas' {FrmCadCategorias},
  UDM_CadFuncionarios in 'Modulo_Cadastro\UDM_CadFuncionarios.pas' {DM_CadFuncionarios: TDataModule},
  UFrmCadFuncionarios in 'Modulo_Cadastro\UFrmCadFuncionarios.pas' {FrmCadFuncionarios},
  UPrinc in 'UPrinc.pas' {FPrincipal},
  UFrmAcessos in 'Modulo_Cadastro\UFrmAcessos.pas' {FrmAcessos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM_CadPessoal, DM_CadPessoal);
  Application.CreateForm(TFrmCadPessoal, FrmCadPessoal);
  Application.CreateForm(TFrmCadClientes, FrmCadClientes);
  Application.CreateForm(TDM_CadClientes, DM_CadClientes);
  Application.CreateForm(TFrmCadFornecedores, FrmCadFornecedores);
  Application.CreateForm(TDM_CadFornecedores, DM_CadFornecedores);
  Application.CreateForm(TFrmCadProdutos, FrmCadProdutos);
  Application.CreateForm(TDM_CadProdutos, DM_CadProdutos);
  Application.CreateForm(TFrmCEP, FrmCEP);
  Application.CreateForm(TDM_CadServicos, DM_CadServicos);
  Application.CreateForm(TFrmCadServicos, FrmCadServicos);
  Application.CreateForm(TDM_CadCategorias, DM_CadCategorias);
  Application.CreateForm(TFrmCadCategorias, FrmCadCategorias);
  Application.CreateForm(TDM_CadFuncionarios, DM_CadFuncionarios);
  Application.CreateForm(TFrmCadFuncionarios, FrmCadFuncionarios);
  Application.CreateForm(TFrmAcessos, FrmAcessos);
  Application.Run;
end.
