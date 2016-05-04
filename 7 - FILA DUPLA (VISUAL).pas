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

function Top (f : t_filaDupla; lado : integer) : char;
begin
	if lado = 1 then begin
		if f.topo1 = 0 then
			writeln('a fila 1 esta vazia!')
		else
			Top := f.vet[f.topo1];
	end else
		if f.topo2 = 6 then
			writeln('a fila 2 esta vazia!')
		else
			Top := f.vet[f.topo2];
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
	end else begin
		writeln('overflow!');
		readln;
	end;
end;

function Retrive ( var f : t_filaDupla; lado : integer) : char;
var
	i : integer;
	aux : char;
begin
	if not isEmpty(f) then begin
		if lado = 1 then begin
			if f.topo1 = 0 then
				writeln('a fila 1 esta vazia!')
			else begin
				aux := f.vet[1];
				for i := 2 to f.topo1 do 
					f.vet[i-1] := f.vet[i];
				
				f.vet[f.topo1] := ' ';	
				f.topo1 := f.topo1 - 1;
				Retrive := aux;
			end;
		end else begin
			if f.topo2 = 6 then
				writeln('a fila 2 esta vazia!')
			else begin
			     aux := f.vet[5];
	
			     for i := 4 downto f.topo2 do
			     	f.vet[i+1] := f.vet[i];
			
				f.vet[f.topo2] := ' ';
				f.topo2 := f.topo2 + 1;
				Retrive := aux;
			end;
		end;
	end else 
		exit;
end;

procedure Inicializa(var f : t_filaDupla);
var
	i : integer;
begin
	for i := 1 to 5 do
		f.vet[i] := ' ';
end;

procedure mostrafila(f : t_filaDupla);
begin
	writeln('');
	writeln('  Cheia = ', isFull(f));	
	writeln('  Vazia = ', isEmpty(f));
	writeln('  __________________________________');
	writeln(' |      |      |      |      |      |');                             
	writeln(' |   ',f.vet[1],'  |   ',f.vet[2],'  |   ',f.vet[3],'  |   ',f.vet[4],'  |   ',f.vet[5],'  |');
	writeln(' |______|______|______|______|______|');
end;

Var	
	resp, i : integer;
	c : char;
	f : t_filaDupla;
Begin
	Create(f);
	Inicializa(f);
	resp := 0;	

	while resp <> 6 do begin
		clrscr;
		mostrafila(f);
		writeln;
		writeln('    OPCAO |   ACAO    ');
		writeln('    ------|---------  ');
		writeln('      1   |   STORE   ');
		writeln('      2   |   TOP     ');
		writeln('      3   |   RETRIVE ');
		writeln('      4   |   LIMPAR  ');		
		writeln('      6   |   SAIR    ');		
		writeln;
		write('OPCAO: '); 
		read(resp);
          i := 0;
          
		case resp of 
		
		1 :	begin
				clrscr;
				write('Digite o caracter a ser acrescentado na fila: ');
				read(c);
				
				while (i < 1) or (i > 2) do begin
					write('Voce deseja coloca-lo em qual das filas?  (1 ou 2)  ');
					read(i);				
				end;
				
				Store(f, c, i);
			end;
				
		2 :	begin
				clrscr;
				while (i < 1) or (i > 2) do begin
					write('Voce quer ver o topo de qual fila?  (1 ou 2)  ');
					read(i);				
				end;
				
				writeln('Topo da fila ',i,' = ', Top(f, i));
				readln;
			end;    
			
		3 :	begin
				clrscr;
				while (i < 1) or (i > 2) do begin
					write('Voce deseja dar o RETRIVE em qual fila?  (1 ou 2)  ');
					read(i);				
				end;
				
				writeln('Caracter retirado da fila ',i,' = ', Retrive(f, i));

			end;
			
		4 :	begin
				Destroy(f);
				Inicializa(f);
			end;
		end;
			
	end;		
End.
