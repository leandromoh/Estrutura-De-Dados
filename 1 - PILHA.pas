Program Pzim ;


type pilha = record
	vet  : array[1..5] of char;
	topo : integer;
end;

procedure create(var p : pilha);
begin
	p.topo := 0;
end;

procedure destroy(var p : pilha);
begin
	p.topo := 0;
end;

function isEmpty(p:pilha) : boolean;
begin
	isEmpty := (p.topo = 0);
end;

function isFull(p:pilha) : boolean;
begin
	isFull := (p.topo = 5);
end;

procedure push(var p : pilha; elem : char);
begin
	if isFull(p) then 
		writeln('overflow!')
	else begin
		p.topo := p.topo + 1;
		p.vet[p.topo] := elem;
	end;
end;

function pop(var p:pilha) : char;
begin
	if isEmpty(p) then
		writeln('underflow!')
	else begin
		p.topo := p.topo - 1;
		pop := p.vet[p.topo + 1];
	end;
end;

function top(p : pilha) : char;
begin
	if isEmpty(p) then
		writeln('pilha vazia!')
	else
		top := p.vet[p.topo];
end;

var
	p1 : pilha;
Begin
	create(p1);
	
	writeln(isEmpty(p1));
	 
	push(p1,'1'); 
	push(p1,'2'); 
	push(p1,'3'); 
	
	writeln(top(p1));
	
	push(p1,'4'); 
	push(p1,'5');

	writeln(isFull(p1));

	push(p1,'6'); 
	
	while not isEmpty(p1) do
		writeln(pop(p1));
		
	writeln(isEmpty(p1));	
End.