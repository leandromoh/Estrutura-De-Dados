function merge (list1 : ptr; list2 : ptr) : ptr; { EX 10 }
var
	primeiro, list3 : ptr;
begin
	new(list3);
	primeiro := list3; 
	
	while (list1 <> nil) or (list2 <> nil) do begin
	
		new(list3^.link);
		list3 := list3^.link;
	
		if (list1^.data < list2^.data) or (list2 = nil) then begin
			list3^.data := list1^.data;
			list1 := list1^.link;
				
		end else if (list1^.data > list2^.data) or (list1 = nil) then begin
			list3^.data := list2^.data;
			list2 := list2^.link;
				
		end else if list1^.data = list2^.data then begin
			list3^.data := list1^.data;
			list1 := list1^.link;
			
			new(list3^.link);
			list3 := list3^.link;
			
			list3^.data := list2^.data;
			list2 := list2^.link;		
		end;
						
	end;
	
 	list3^.link := nil;
 	list3 := primeiro;
 	primeiro := primeiro^.link;
 	dispose(list3);
	merge := primeiro;
end;