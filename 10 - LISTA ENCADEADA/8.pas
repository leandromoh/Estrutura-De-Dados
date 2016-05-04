procedure showContario(lista : ptr);  { EX 08 }
begin
	if lista <> nil then begin
		showContario(lista^.link);
		writeln(lista^.data);
	end;
end;