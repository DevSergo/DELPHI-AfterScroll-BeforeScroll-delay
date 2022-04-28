# Задержка при активации событий AfterScroll и BeforeScroll для одного из датасета (TFDQuery из библиотеки FireDAC)
  
Это часть какого-то большого моего проекта.

	- заполняем таблицу FDQuery1 10000 строк.
	- тестируем задержку в событиях AfterScroll и BeforeScroll
	- используем OutputDebugString	 
	
В приложении используются только стандартные модули и библиотеки. В частности, библиотека FireDAC.  

Полный список используемых модулей:

	uses
	  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
	  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
	  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
	  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
	  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
	  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
	  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
	  Vcl.StdCtrls;

