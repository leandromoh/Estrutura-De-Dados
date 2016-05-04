Program listaEncadeada ;

type ptr = ^nodo;

nodo = record
	data : char;
	link : ptr;
end;

procedure create( var lista : ptr);
begin
	lista := nil;
end;

procedure destroy( var lista : ptr);
var
	aux : ptr;
begin
	while lista <> nil do begin
		aux := lista;
		writeln(aux^.data);
		lista := lista^.link;
		dispose(aux);
	end;
end;

function isEmpty(lista : ptr) : boolean;
begin
	isEmpty := (lista = nil);
end;

function lastElement(lista : ptr) : ptr;
begin
	if not isEmpty(lista) then
		while lista^.link <> nil do
			lista := lista^.link;	
			
	lastElement := lista;
end;

procedure addAtBegin( var lista : ptr; elem : char);
var
	primeiro : ptr;
begin
	new(primeiro);
	
	primeiro^.data := elem;
	
	if isEmpty(lista) then begin 
     	primeiro^.link := nil;
	     lista := primeiro;
	end else begin
		primeiro^.link := lista;
		lista := primeiro;		
	end;
end;

procedure addAtEnd( var lista : ptr; elem : char);
var
	ultimo, aux : ptr;
begin
	new(ultimo);
	
	ultimo^.data := elem;
	ultimo^.link := nil;
	
	if isEmpty(lista) then 
	     lista := ultimo
	else begin begin
		aux := lastElement(lista);
		aux^.link := ultimo;
	end end;
end;

function first( lista :  ptr) : char ;
begin
	if isEmpty(lista) then
		writeln('first() falhou! lista vazia!')
	else 
		first := lista^.data;
end;

function last( lista :  ptr) : char ;
begin
	if isEmpty(lista) then 
		writeln('last() falhou! lista vazia!')
	else begin
		lista := lastElement(lista);
		last := lista^.data;
	end;		
end;

function removeFirst ( var lista : ptr) : char ;
var
	carac : char;
	aux : ptr;
begin
	if isEmpty(lista) then
		writeln('removeFirst() falhou! lista vazia!')
	else begin
		carac := lista^.data;
		aux := lista;
		lista := lista^.link;
		dispose(aux);
		removeFirst := carac;
	end;
end;

function removeLast ( var lista : ptr) : char ;
var
	carac : char;
	auxptr : ptr;
begin
	if isEmpty(lista) then
		writeln('removeLast() falhou! lista vazia!')
	else begin
		auxptr := lista;
		while lista^.link^.link <> nil do {percorre até o penultimo elemento}
			lista := lista^.link;		
			
		carac := lista^.link^.data;
		dispose(lista^.link);
		lista^.link := nil;

		removeLast := carac;
	end;
end;

procedure show(lista : ptr);
begin
	writeln('begin show()');
	while lista <> nil do begin
		writeln(lista^.data);
		lista := lista^.link;
	end;
	writeln('end show()');	
end;

Var
	l1, l2, l3 : ptr;
Begin
	create(l1);
	create(l2);	

	addAtEnd(l1,'1');
	addAtEnd(l1,'2');
	addAtEnd(l1,'4');		
	addAtEnd(l1,'5');
	addAtEnd(l1,'6');
	
	addAtEnd(l2,'0');
	addAtEnd(l2,'3');
	addAtEnd(l2,'5');
	addAtEnd(l2,'7');		
	addAtEnd(l2,'8');

	l1 := lastElement(l1);
	writeln(l1^.data);
End.
