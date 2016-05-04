procedure showRecursivo(lista : ptr);  { EX 07 }
begin
	if lista <> nil then begin
		writeln(lista^.data);
		showRecursivo(lista^.link);
	end;
end;