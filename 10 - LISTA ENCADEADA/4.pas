function concatenaLista(l1 : ptr; l2 : ptr) : ptr;   { EX 04 }
var
	l3 : ptr;
begin
	if isEmpty(l1) and isEmpty(l2) then
		l3 := nil
	else if isEmpty(l1) then
		l3 := l2
	else if isEmpty(l2) then
		l3 := l1
	else begin
		l3 := lastElement(l1);
		l3^.link := l2;
		l3 := l1;
	end;
		
	concatenaLista := l3;
end;