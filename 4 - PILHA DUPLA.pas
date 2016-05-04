Program pilha;

type t_pilhaDupla = record
	vet : array[1..5] of char;
	topo1, topo2 : integer;
end;

procedure Create (var p : t_pilhaDupla);
begin
	p.topo1 := 0;
	p.topo2 := 6;	
end;

procedure Destroy (var p : t_pilhaDupla);
begin
	p.topo1 := 0;
	p.topo2 := 6;
end;

function isEmpty (p : t_pilhaDupla) : boolean;
begin
	isEmpty := ((p.topo1 = 0) and (p.topo2 = 6));
end;

function isFull (p : t_pilhaDupla) : boolean;
begin
	isFull := (((p.topo1+1)=p.topo2) or ((p.topo2-1)=p.topo1));
end;

procedure Push (var p : t_pilhaDupla; c : char; lado : integer);
begin
	if not isFull(p) then begin
		if lado = 1 then begin
			p.topo1 := p.topo1 + 1;
			p.vet[p.topo1] := c;
		end else	begin
			p.topo2 := p.topo2 - 1;
			p.vet[p.topo2] := c;
		end;	
	end else
		writeln('overflow!');
end;

function Pop ( var p : t_pilhaDupla; lado : integer) : char;
begin
	if lado = 1 then begin
		if p.topo1 = 0 then
			writeln('Pop falhou! a pilha 1 esta vazia!')
		else begin
			p.topo1 := p.topo1 - 1;
			Pop := p.vet[p.topo1 + 1];
		end;
	end else begin
		if p.topo2 = 6 then
			writeln('Pop falhou! a pilha 2 esta vazia!')
		else begin
			p.topo2 := p.topo2 + 1;
			Pop := p.vet[p.topo2 - 1];
		end;
	end;
end;


Var	
	c : char;
	p : t_pilhaDupla;
Begin
	Create(p);

	Push(p, '1', 1);
	Push(p, '2', 1);

	Push(p, '5', 2);
	Push(p, '4', 2);
	
	Push(p,Pop(p,1),2);
	Push(p,Pop(p,1),2);
	
	c := Pop(p,1);
	
	Push(p, '3', 2);
	
	Push(p, '0', 1);
	

End.
