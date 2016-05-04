Program pilhaEncadeada ;

// para fazer um ponteiro apontar para uma area vazia do tipo para qual aponta 
// utiliza-se o comando new(ponteiro)
// Ex: var aux : ^char; 
// variavel aux é do tipo ponteiro de caracter.
// utilizando o comando new(aux) agora aux ponta para um endereco (livre) do tipo char 

// função dispose libera a area de memoria referenciada
// Ex: dispose(aux) libera a area para qual aux aponta!

// para dizer que um ponteiro aponta para um endereco vazio
// em pascal, utiliza-se o valor 'nil' na atribuicao

type ptr = ^nodo;

nodo = record
	data : char;
	link : ptr;
end;
 
procedure push(var topo : ptr; elem : char);
var 
	aux : ptr;
begin
	new(aux);
	aux^.data := elem;
	aux^.link := topo;
	topo := aux;
end;

function pop(var topo:ptr):char;
var 
	auxptr : ptr;
	aux : char;
begin
	if topo = nil then begin
		writeln('underflow!');
		{ halt; }
	end else begin
		aux := topo^.data;
		auxptr := topo;
		topo := topo^.link;
		dispose(auxptr);
		pop := aux;
	end;
end;

procedure create( var pilha : ptr);
begin
	pilha := nil;
end;

procedure destroy( var topo : ptr);
var
	aux : ptr;
begin
	while topo <> nil do begin
	     aux := topo;
	     topo := topo^.link;
	     dispose(aux);
	end;
end;

function isEmpty(p1 : ptr) : boolean;
begin
	isEmpty := (p1 = nil);
end;

function top(p1 : ptr) : char;
begin
	if isEmpty(p1) then 
		writeln('topo() falhou! pilha vazia!')
		{ halt; }
	else
		top := p1^.data;
end;

Var
	p1 : ptr;	
Begin
	create(p1);

	push(p1,'1');
	push(p1,'2');              
	push(p1,'3');
	push(p1,'4');
	push(p1,'5');

	writeln(top(p1));
     
	while not isEmpty(p1) do
		writeln(pop(p1));
	
	push(p1,'6');	
	destroy(p1);
	writeln(isEmpty(p1));	
End.