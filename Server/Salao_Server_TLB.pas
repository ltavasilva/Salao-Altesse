unit Salao_Server_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 04/06/2013 13:32:46 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Empresa\Projects\Salao Altesse\Server\Salao_Server (1)
// LIBID: {3223CCBE-966B-4E40-8ACE-D0736B08F7FB}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\bin64\midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Salao_ServerMajorVersion = 1;
  Salao_ServerMinorVersion = 0;

  LIBID_Salao_Server: TGUID = '{3223CCBE-966B-4E40-8ACE-D0736B08F7FB}';

  IID_IDatabase: TGUID = '{0B3AA4C2-CC94-4E75-AE79-5E3826B1FDB2}';
  CLASS_Database: TGUID = '{B8B03069-EA14-4A57-B9CF-37367AB9B33E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IDatabase = interface;
  IDatabaseDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  Database = IDatabase;


// *********************************************************************//
// Interface: IDatabase
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B3AA4C2-CC94-4E75-AE79-5E3826B1FDB2}
// *********************************************************************//
  IDatabase = interface(IAppServer)
    ['{0B3AA4C2-CC94-4E75-AE79-5E3826B1FDB2}']
  end;

// *********************************************************************//
// DispIntf:  IDatabaseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0B3AA4C2-CC94-4E75-AE79-5E3826B1FDB2}
// *********************************************************************//
  IDatabaseDisp = dispinterface
    ['{0B3AA4C2-CC94-4E75-AE79-5E3826B1FDB2}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer;
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                           Options: Integer; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoDatabase provides a Create and CreateRemote method to
// create instances of the default interface IDatabase exposed by
// the CoClass Database. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoDatabase = class
    class function Create: IDatabase;
    class function CreateRemote(const MachineName: string): IDatabase;
  end;

implementation

uses System.Win.ComObj;

class function CoDatabase.Create: IDatabase;
begin
  Result := CreateComObject(CLASS_Database) as IDatabase;
end;

class function CoDatabase.CreateRemote(const MachineName: string): IDatabase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Database) as IDatabase;
end;

end.

