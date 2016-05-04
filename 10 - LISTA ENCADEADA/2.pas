procedure removeDuplicidade(var lista : ptr);   { EX 02 }
var
	aux, auxelem : ptr;
begin
	if isEmpty(lista) then
		writeln('removeDuplicidade() falhou! lista vazia!')
	else begin
		aux := lista;
		while aux^.link <> nil do begin 
			if aux^.data = aux^.link^.data then begin
				auxelem := aux^.link;
				aux^.link := aux^.link^.link;
				dispose(auxelem);
			end else
				aux := aux^.link;
		end;
	end;
end;