function max(a:integer; b:integer) : integer;
begin
    if a > b then
        max := a
    else
        max := b;
end;

function maior2(raiz:ptr; pai:integer) : integer;
var
    n1, n2 : integer;
begin
    if raiz <> nil then begin
    
        n1 := maior2(raiz^.linke, raiz^.data);
        n2 := maior2(raiz^.linkd, raiz^.data);
        
        maior2 := max(raiz^.data, max(n1,n2));

    end else
        maior2 := pai - 1;
end;

function maior(raiz:ptr) : integer;
begin
    if raiz <> nil then    
        maior := maior2(raiz, raiz^.data)
    else begin
        writeln('maior() falhou! arvore vazia!');
        { halt; }
    end;
end;