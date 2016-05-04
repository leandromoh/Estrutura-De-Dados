function lastElement(lista : ptr) : ptr;
begin
	if not isEmpty(lista) then
		while lista^.link <> nil do
			lista := lista^.link;	
			
	lastElement := lista;
end;