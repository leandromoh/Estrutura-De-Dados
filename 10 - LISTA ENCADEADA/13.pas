procedure store ( var fila : t_filaEncadeada; elem : char);    { EX 13 }
var
	ultimo : ptr;
begin
	new(ultimo);
	
	ultimo^.data := elem;
	ultimo^.link := nil;
	
	if isEmpty(fila) then begin 
		fila.front := ultimo;
		fila.rear := ultimo;
	end else begin
		fila.rear^.link := ultimo;
		fila.rear := ultimo;	
	end;
end;