Program fila;

type t_filaDupla = record
	vet : array[1..5] of char;
	topo1, topo2 : integer;
end;

procedure Create (var f : t_filaDupla);
begin
	f.topo1 := 0;
	f.topo2 := 6;	
end;

procedure Destroy (var f : t_filaDupla);
begin
	f.topo1 := 0;
	f.topo2 := 6;
end;

function isEmpty (f : t_filaDupla) : boolean;
begin
	isEmpty := ((f.topo1 = 0) and (f.topo2 = 6));
end;

function isFull (f : t_filaDupla) : boolean;
begin
	isFull := (((f.topo1+1)=f.topo2) or ((f.topo2-1)=f.topo1));
end;

procedure Store (var f : t_filaDupla; c : char; lado : integer);
begin
	if not isFull(f) then begin
		if lado = 1 then begin
			f.topo1 := f.topo1 + 1;
			f.vet[f.topo1] := c;
		end else	begin
			f.topo2 := f.topo2 - 1;
			f.vet[f.topo2] := c;
		end;	
	end else
		writeln('overflow!');
end;

function Retrive ( var f : t_filaDupla; lado : integer) : char;
var
	i : integer;
	aux : char;
begin
	if lado = 1 then begin
		if f.topo1 = 0 then
			writeln('Retrive falhou! a fila 1 esta vazia!')
		else begin
			aux := f.vet[1];
			for i := 2 to f.topo1 do 
				f.vet[i-1] := f.vet[i];
					
			f.topo1 := f.topo1 - 1;
			Retrive := aux;
		end;
	end else begin
		if f.topo2 = 6 then
			writeln('Retrive falhou! a fila 2 esta vazia!')
		else begin
		     aux := f.vet[5];
		     for i := 4 downto f.topo2 do
		     	f.vet[i+1] := f.vet[i];
		
			f.topo2 := f.topo2 + 1;
			Retrive := aux;
		end;
	end;
end;

Var	
	c : char;
	f : t_filaDupla;
Begin
	Create(f);

	Store(f, '1', 1);
	Store(f, '2', 1);
	
	Store(f, '5', 2);
	Store(f, '4', 2);
		
	Store(f, Retrive(f, 1), 2);

	Store(f, '3', 2);
	
	Store(f, Retrive(f, 1), 2);
	
	c := Retrive(f, 1);
	
	Store(f, '0', 1);
End.
