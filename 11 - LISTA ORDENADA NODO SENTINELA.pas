program lista_ordenada_nodo_sentinela;

type ptr = ^nodo;

nodo = record
	data : char;
     link : ptr;
end;

function dentroIntervalo(elem : char) : boolean;
var
	i : integer;
begin
	i := ord(elem);     { entre 'A' e 'Z'       ou       entre 'a' e 'z' }
	dentroIntervalo := ( ((i > 64) and (i < 91)) or ((i > 96) and (i < 123)) );
end;

procedure create(var lista : ptr);
var
	sent1, sent2 : ptr;
begin
	new(sent1);
	sent1^.data := chr(64); { chr(65) = 'A' }
	
	new(sent2);
	sent2^.data := chr(123);{ chr(122) = 'z' } 
	
	lista := sent1;
	sent1^.link := sent2;
	sent2^.link := nil;	
end;

procedure destroy(var lista : ptr);
var
	aux : ptr;
begin
	while lista <> nil do begin
	    aux := lista;
	    lista := lista^.link;
	    dispose(aux);
	end;
end;

procedure show(lista : ptr);
begin
	lista := lista^.link;
	writeln('begin show()');
	while lista^.link <> nil do begin
		writeln(lista^.data);
		lista := lista^.link;
	end;
	writeln('end show()');	
end;

function find(lista : ptr; elem : char) : boolean;
begin
	find := false;
	
	if dentroIntervalo(elem) then begin
		while lista^.data < elem do
			lista := lista^.link;
			
		if lista^.data = elem then
			find := true;
	end;
end;

procedure add(var lista : ptr; elem : char);
var
	aux1, aux2 : ptr;
begin
	if dentroIntervalo(elem) then begin
		new(aux1);
    		aux1^.data := elem;
    		
    		aux2 := lista;
    		
		while aux2^.link^.data < elem do
			aux2 := aux2^.link;
		
		aux1^.link := aux2^.link;
		aux2^.link := aux1;
	end else
		writeln('"',elem,'" esta fora do intervalo da lista');
end;

procedure remove(var lista : ptr; elem : char);
var
	aux1, aux2 : ptr;
begin
	if dentroIntervalo(elem) then begin
    		
    		aux2 := lista;
    		
		while aux2^.link^.data < elem do
			aux2 := aux2^.link;
		
		if aux2^.link^.data = elem then begin
			aux1 := aux2^.link;	
			aux2^.link := aux2^.link^.link;
			dispose(aux1);
		end else
			writeln('"',elem,'" nao existe na lista');
	end else
		writeln('"',elem,'" esta fora do intervadlo da lista');
end;

var
	l1 : ptr;

begin
	create(l1);
	add(l1,'e');			
	add(l1,'a');
	add(l1,'f');	
	add(l1,'d');
	add(l1,'c');
	add(l1,'Z');
	add(l1,'e');
	add(l1,'A');	
	add(l1,'b');

	writeln(find(l1,'b'));
	writeln(find(l1,'c'));
	
 	remove(l1,'c');
	
	show(l1);
	
	writeln(find(l1,'b'));
	writeln(find(l1,'c'));
	
 	remove(l1,'c');	
end.
