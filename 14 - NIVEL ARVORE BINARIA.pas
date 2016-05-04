function nivel(raiz:ptr) : integer;
var
    n1, n2 : integer;
begin
    if raiz <> nil then begin
    
        n1 := nivel(raiz^.linke);
        n2 := nivel(raiz^.linkd);
        
        if n1 > n2 then
            nivel := n1 + 1
        else
            nivel := n2 + 1;
            
    end else
        nivel := 0;
end;