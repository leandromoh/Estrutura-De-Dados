Program filaEncadeada ;

type ptr = ^nodo;

nodo = record
	data : char;
	link : ptr;
end;

t_filaEncadeada = record
	front : ptr;
	rear  : ptr;
end;			

procedure create( var fila : t_filaEncadeada);
begin
	fila.front := nil;
	fila.rear  := nil;
end;

procedure destroy( var fila : t_filaEncadeada);
var
	aux : ptr;
begin
	while fila.front <> nil do begin
		aux := fila.front;
		fila.front := fila.front^.link;
		dispose(aux);
	end;
	
	fila.rear  := nil;
end;

function isEmpty(fila : t_filaEncadeada) : boolean;
begin
	isEmpty := (fila.front = nil);
end;

procedure store ( var fila : t_filaEncadeada; elem : char);
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

function retrive ( var fila : t_filaEncadeada) : char ;
var
	carac : char;
	aux : ptr;
begin
	if isEmpty(fila) then begin
		writeln('retrive() falhou! fila vazia!')
		{ halt; }
	end else begin
		carac := fila.front^.data;
		aux := fila.front;
		fila.front := fila.front^.link;
		dispose(aux);
		retrive := carac;
	end;
end;

function top( fila :  t_filaEncadeada) : char ;
begin
	if isEmpty(fila) then begin
		writeln('top() falhou! fila vazia!')
		{ halt; }
	end else 
		top := fila.front^.data;
end;

Var
	f1 : t_filaEncadeada;	
Begin
	create(f1);

	store(f1,'1');
	store(f1,'2');              
	store(f1,'3');
	store(f1,'4');
	store(f1,'5');
     
     writeln(top(f1));
     
	while not isEmpty(f1) do
		writeln(retrive(f1));
	
	store(f1,'6');
	store(f1,'7');	
	
	writeln(top(f1));
	
	writeln(isEmpty(f1));
	destroy(f1);
	writeln(isEmpty(f1));
	
End.