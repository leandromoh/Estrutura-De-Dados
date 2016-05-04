function merge (list1 : ptr; list2 : ptr) : ptr; { EX 10 }
var
	list3 : ptr;
begin
	create(list3);

	while (list1 <> nil) or (list2 <> nil) do begin

		if (list1^.data < list2^.data) or (list2 = nil) then begin
			addAtEnd(list3, list1^.data);
			list1 := list1^.link;

		end else if (list1^.data > list2^.data) or (list1 = nil) then begin
			addAtEnd(list3, list2^.data);
			list2 := list2^.link;

		end else if list1^.data = list2^.data then begin
			addAtEnd(list3, list1^.data);
			addAtEnd(list3, list2^.data);
			list1 := list1^.link;
			list2 := list2^.link;
		end;
	end;

	merge := list3;
end;