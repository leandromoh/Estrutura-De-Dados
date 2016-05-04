procedure showMerge(list1 : ptr; list2 : ptr);  { EX 09 }
begin
	while (list1 <> nil) or (list2 <> nil) do begin 
		if (list1^.data < list2^.data) or (list2 = nil) then begin
			writeln(list1^.data);
			list1 := list1^.link;

		end else if (list1^.data > list2^.data) or (list1 = nil) then begin
			writeln(list2^.data);
			list2 := list2^.link;

		end else if list1^.data = list2^.data then begin
			writeln(list1^.data);
			writeln(list2^.data);
			list1 := list1^.link;
			list2 := list2^.link;
		end;
	end;
end;