procedure transformaListaCircular(var lista : ptr);  { EX 03 }
var
	ultimo : ptr;
begin
	ultimo := lastElement(lista);
	ultimo^.link := lista;
end;