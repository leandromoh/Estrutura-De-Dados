{
	EX 11
	
busca bin�ria � viavel apenas para o vetor, pois quando vamos acessar algum elemento do mesmo � feito um calculo
que nos leva direto ao elemento desejado, sem ter que "passar" pelos elementos anteriores (isso � possivel porque os 
espa�os vetor s�o sequenciais na memoria do computador). Isso n�o acontece na lista encadeada
pois nela os elementos ficam espalhados na memoria, mantendo sua ordem apenas por ponteiros. Ou seja, se formos
querer chegar a algum elemento, teriamos que percorrer todos os anteriores at� ele, o que torna inviavel a busca
binaria numa lista ordenada.

}