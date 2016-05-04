function isFull(f:filaCircular) : boolean;        { EX 12 }
begin
	isFull := (next(f.rear) = f.front);
end;

procedure store(var f : filaCircular; elem : char);  { EX 12 }
begin
	if isFull(f) then 
		writeln('overflow!')
	else begin
		f.vet[f.rear] := elem;
		f.rear := next(f.rear);
	end;
end;