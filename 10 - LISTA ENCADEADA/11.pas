{
	EX 11
	
busca binária é viavel apenas para o vetor, pois quando vamos acessar algum elemento do mesmo é feito um calculo
que nos leva direto ao elemento desejado, sem ter que "passar" pelos elementos anteriores (isso é possivel porque os 
espaços vetor são sequenciais na memoria do computador). Isso não acontece na lista encadeada
pois nela os elementos ficam espalhados na memoria, mantendo sua ordem apenas por ponteiros. Ou seja, se formos
querer chegar a algum elemento, teriamos que percorrer todos os anteriores até ele, o que torna inviavel a busca
binaria numa lista ordenada.

}