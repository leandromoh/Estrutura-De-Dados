Program x;

type vetor = array[1..20] of integer;

procedure Merge (var a, b : vetor; n, m : integer);
var
	i, j, k, p : integer;
	c : vetor;
begin
	i := 1; j := 1; k := 1; p := n + m;

	while (i<=n) and (j<=m) do begin

		if a[i] < b[j] then begin
			c[k] := a[i];
			i := i + 1;

		end else if b[j] < a[i] then begin
			c[k] := b[j];
			j := j + 1;

		end else if a[i] = b[j] then begin
			c[k] := a[i];
			k := k + 1;
			c[k] := b[j];
			i := i + 1;
			j := j + 1;
		end;

		k := k + 1;
	end;
	
	for i := i to n do begin
		c[k] := a[i];
		k := k + 1;	
	end;
	
	for j := j to m do begin
		c[k] := b[j];
		k := k + 1;
	end;	

	for i:=1 to p do
		writeln('c[',i,'] = ',c[i]);
end;

Var
	a, b : vetor;
Begin
	a[1] := 5;
	a[2] := 9;
	a[3] := 13;
	a[4] := 14;
	a[5] := 21;
	a[6] := 23;
	a[7] := 27;
	a[8] := 31;
	a[9] := 42;
	a[10] := 44;

	b[1] := 3;
	b[2] := 4;
	b[3] := 7;
	b[4] := 8;
	b[5] := 22;
	b[6] := 25;
	b[7] := 33;
	b[8] := 35;
	b[9] := 36;
	b[10] := 39;

	Merge(a,b,10,10);
End.