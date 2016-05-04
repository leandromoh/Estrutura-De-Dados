Program fila_circular;

type fila = record
	vet   : array[1..6] of char;
	front : integer;	
	rear  : integer;
end;

procedure create(var f : fila);
begin
	f.front := 1;
	f.rear  := 1;
end;

procedure destroy(var f : fila);
begin
	f.front := f.rear;
end;

function next(n : integer) : integer;
begin
	next := (n mod 6) + 1;
end;

function isEmpty(f:fila) : boolean;
begin
	isEmpty := (f.front = f.rear);
end;

function isFull(f:fila) : boolean;
begin
	isFull := (next(f.rear) = f.front);
end;

procedure store(var f : fila; elem : char);
begin
	if isFull(f) then 
		writeln('overflow!')
	else begin
		f.vet[f.rear] := elem;
		f.rear := next(f.rear);
	end;
end;

function retrive(var f:fila) : char;
var
	aux : char;
begin
	if isEmpty(f) then
		writeln('underflow!')
	else begin
	     aux := f.vet[f.front];
		f.front := next(f.front);
		retrive := aux;
	end;
end;

function top(f : fila) : char;
begin
	if isEmpty(f) then
		writeln('fila vazia!')
	else
		top := f.vet[f.front];
end;

var
	f1 : fila;
Begin
	create(f1);
	
	writeln(isEmpty(f1));
	 
	store(f1,'1'); 
	store(f1,'2'); 
	store(f1,'3'); 
	
	writeln(top(f1));
	
	store(f1,'4'); 
	store(f1,'5');

	writeln(isFull(f1));

	store(f1,'6'); 
	
	writeln(retrive(f1));
	writeln(retrive(f1));	
	
	store(f1,'7'); 
	store(f1,'8'); 
	
	while not isEmpty(f1) do
		writeln(retrive(f1));
		
	writeln(isEmpty(f1));	
End.