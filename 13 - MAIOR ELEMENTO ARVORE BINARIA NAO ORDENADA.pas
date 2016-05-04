function maior(t:arvb):integer;
begin
	if t^.esq = t^.dir then
		maior := t^.item
	else if t^.esq = nil then
		maior := max(t^.item,maior(t^.dir))
	else if t^.dir = nil then
		maior := max(t^.item,maior(t^.esq))
	else
		maior := max(t^.item,max(maior(t^.esq),maior(t^.dir)));
end