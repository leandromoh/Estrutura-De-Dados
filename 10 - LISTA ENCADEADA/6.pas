function contaElementoListaCircular(lista : ptr) : integer;  { EX 06 }
var
	i : integer;
	primeiro : ptr;
begin
	i := 0;
	primeiro := lista;

	if not isEmpty(lista) then	

		repeat

			i := i + 1;
			lista := lista^.link;

		until lista = primeiro;

	contaElementoListaCircular := i;
end;