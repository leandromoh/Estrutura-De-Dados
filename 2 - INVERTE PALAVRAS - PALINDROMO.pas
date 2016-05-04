Program pilha;

type t_pilha = record
	vet : array[1..50] of char;
	topo : integer;
end;

procedure Create (var p : t_pilha);
begin
	p.topo := 0;
end;

procedure Destroy (var p : t_pilha);
begin
	p.topo := 0;
end;

function isEmpty (p : t_pilha) : boolean;
begin
	isEmpty := (p.topo = 0);
end;

function isFull (p : t_pilha) : boolean;
begin
	isFull := (p.topo = 50);
end;

function Top (p : t_pilha) : char;
begin
	Top := p.vet[p.topo];
end;

procedure Push (var p : t_pilha; c : char);
begin
	if not isFull(p) then begin
		p.topo := p.topo + 1;
		p.vet[p.topo] := c;
	end else
		write('OverFlow! A pilha esta cheia!');
end;

function Pop ( var p : t_pilha) : char;
begin
	if not isEmpty(p) then begin
		p.topo := p.topo - 1;
		Pop := p.vet[p.topo + 1];
	end else 
		Pop := ' ';		
end;


function invertePalavras(s : string) : string;
var 
	i : integer;
	z : string;
	p : t_pilha;
Begin
     Create(p);
     z := '';
     s := s + ' ';

     for i := 1 to length(s) do
		if s[i] <> ' ' then
		    push(p, s[i]) 
		else begin
	    		while not isEmpty(p) do 
	          	z := z + Pop(p);

	          z := z + ' ';
		end;

     invertePalavras := z;
End;

function palindromo (s : string) : boolean;
var 
	p : t_pilha;
	i : integer;
	r : string;
begin

	Create(p);
	r := '';

	for i := 1 to length(s) do
		Push(p, s[i]);		
	
	while not isEmpty(p) do
		r := r + Pop(p);
		
	palindromo := (r = s);			
end;
	
Var
	s : string;
Begin

	writeln('digite uma frase: ');
	read(s);

	writeln(invertePalavras(s));

     writeln('');
		
	writeln('digite uma frase: ');
	read(s);
	
	writeln(palindromo(s));		
End.
