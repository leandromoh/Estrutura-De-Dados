Program arvore_binaria;

type ptr = ^nodo;

nodo = record
    data : integer;
    linke, linkd : ptr;
end;

procedure create(var raiz : ptr);
begin
    raiz := nil;
end;

procedure incluir(var raiz : ptr; elem : integer);
begin
	if raiz = nil then begin 
	
		new(raiz);	
		raiz^.data := elem;
		raiz^.linke := nil;
		raiz^.linkd := nil;
					
	end else if raiz^.data > elem then
		incluir(raiz^.linke, elem)
		
	else if raiz^.data < elem then
		incluir(raiz^.linkd, elem)
    
    else
        writeln('elemento "',elem,'" ja existe');
end;

function antecessor(var raiz : ptr) : ptr;
var
    nodo : ptr;
begin
	if raiz^.linkd = nil then begin {raiz é o nodo mais à direita}
		nodo := raiz;
		raiz := raiz^.linke;
		antecessor := nodo;
	end else {desce mais um nível, pela direita}
		antecessor := antecessor(raiz^.linkd)
end;
  
function busca(raiz:ptr; elem: integer):boolean;
begin
	if raiz = nil then
	   busca := false
       
	else if raiz^.data = elem then
        busca := true
          
	else if raiz^.data > elem then
	    busca := busca(raiz^.linke, elem)
        
	else
        busca := busca(raiz^.linkd, elem);
end;

procedure exclui(var raiz:ptr; elem:integer);
var
    nodo : ptr;
begin
	if raiz^.data = elem then begin {chave encontrada!}
		nodo := raiz;
		if raiz^.linke = nil then  {raiz pode ter apenas o filho direito}
			raiz := raiz^.linkd
		else
			if raiz^.linkd = nil then {raiz tem apenas o filho esquerdo}
				raiz := raiz^.linke
			else begin {raiz tem 2 filhos}
				nodo := antecessor(raiz^.linke); {acha o nodo antecessor}
				raiz^.data := nodo^.data; {substitui o conteudo da raiz pelo do nodo antecessor}
			end;
		dispose(nodo); {libera os recursos alocados}
	end else
		if elem < raiz^.data then
			exclui(raiz^.linke, elem)
		else
			exclui(raiz^.linkd, elem);		
end;

procedure EmOrdem(raiz:ptr);
begin
    if raiz <> nil then begin
	   EmOrdem(raiz^.linke);
	   writeln(raiz^.data);
	   EmOrdem(raiz^.linkd);
	end;
end;

procedure PosOrdem(raiz:ptr);
begin
	if raiz <> nil then begin
	   PosOrdem(raiz^.linke);
	   PosOrdem(raiz^.linkd);
	   writeln(raiz^.data);
	end;
end;

procedure PreOrdem(raiz:ptr);
begin
	if raiz <> nil then begin
	   writeln(raiz^.data);
	   PreOrdem(raiz^.linke);
	   PreOrdem(raiz^.linkd);
	end;
end;

Var
	a1 : ptr;
Begin
	
	create(a1);

	incluir(a1,  4);
	incluir(a1, 70);
	incluir(a1, 47);
	incluir(a1,  9);
	incluir(a1,  0);
	incluir(a1, 90);
	incluir(a1, 11);
	incluir(a1, 91);
	incluir(a1, 81);
	incluir(a1, 36);
	incluir(a1, 91);
	incluir(a1, 59);
	incluir(a1, 83);
    
	emOrdem(a1);
    
    writeln(busca(a1,36));
    writeln(busca(a1,55));
    
    exclui(a1, 36);
    emOrdem(a1);
    
End.