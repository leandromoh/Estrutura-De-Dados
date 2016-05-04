function contaElemento(lista : ptr) : integer;  { EX 05 }
var
	i : integer;
begin
	i := 0;
	while lista <> nil do begin
		i := i + 1;
		lista := lista^.link;
	end;
	contaElemento := i;		
end;