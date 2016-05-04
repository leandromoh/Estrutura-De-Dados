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

function Top (p : t_pilhaDupla; lado : integer) : char;
begin
	if lado = 1 then begin
		if p.topo1 = 0 then
			writeln('a pilha 1 esta vazia!')
		else
			Top := p.vet[p.topo1];
	end else
		if p.topo2 = 6 then
			writeln('a pilha 2 esta vazia!')
		else
			Top := p.vet[p.topo2];
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
	end else begin
		writeln('overflow!');
		readln;
	end;
end;

function Pop ( var p : t_pilhaDupla; lado : integer) : char;
begin
	if not isEmpty(p) then begin
		if lado = 1 then begin
			if p.topo1 = 0 then
				writeln('a pilha 1 esta vazia!')
			else begin
				p.topo1 := p.topo1 - 1;
				Pop := p.vet[p.topo1 + 1];
			end;
		end else begin
			if p.topo2 = 6 then
				writeln('a pilha 2 esta vazia!')
			else begin
				p.topo2 := p.topo2 + 1;
				Pop := p.vet[p.topo2 - 1];
			end;
		end;
	end else 
		exit;
end;

procedure Inicializa(var p : t_pilhaDupla);
var
	i : integer;
begin
	for i := 1 to 5 do
		p.vet[i] := ' ';
end;

procedure mostraPilha(p : t_pilhaDupla);
begin
	writeln('');
	writeln('  Cheia = ', isFull(p));	
	writeln('  Vazia = ', isEmpty(p));
	writeln('  __________________________________');
	writeln(' |      |      |      |      |      |');                             
	writeln(' |   ',p.vet[1],'  |   ',p.vet[2],'  |   ',p.vet[3],'  |   ',p.vet[4],'  |   ',p.vet[5],'  |');
	writeln(' |______|______|______|______|______|');
end;

Var	
	resp, i : integer;
	c : char;
	p : t_pilhaDupla;
Begin
	Create(p);
	Inicializa(p);
	resp := 0;	

	while resp <> 6 do begin
		clrscr;
		mostraPilha(p);
		writeln;
		writeln('    OPCAO |   ACAO    ');
		writeln('    ------|---------  ');
		writeln('      1   |   PUSH    ');
		writeln('      2   |   TOP     ');
		writeln('      3   |   POP     ');
		writeln('      4   |   LIMPAR  ');		
		writeln('      6   |   SAIR    ');		
		writeln;
		write('OPCAO: '); 
		read(resp);
          i := 0;
          
		case resp of 
		
		1 :	begin
				clrscr;
				write('Digite o caracter a ser acrescentado na pilha: ');
				read(c);
				
				while (i < 1) or (i > 2) do begin
					write('Voce deseja colocar em qual lado da pilha?  (1 ou 2)  ');
					read(i);				
				end;
				
				Push(p, c, i);
			end;
				
		2 :	begin
				clrscr;
				while (i < 1) or (i > 2) do begin
					write('Voce quer ver o topo de qual lado da pilha?  (1 ou 2)  ');
					read(i);				
				end;
				
				writeln('Topo da pilha ',i,' = ', Top(p, i));
				readln;
			end;    
			
		3 :	begin
				clrscr;
				while (i < 1) or (i > 2) do begin
					write('Voce deseja dar o POP em qual pilha?  (1 ou 2)  ');
					read(i);				
				end;
				
				writeln('Caracter retirado da pilha ',i,' = ', Pop(p, i));
				Push(p,' ', i);
				writeln(Pop(p, i));
			end;
			
		4 :	begin
				Destroy(p);
				Inicializa(p);
			end;
		end;
			
	end;		
End.
