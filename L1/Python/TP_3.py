from random import *
from time import *

def Inik(n, k) :
	liste = []
	for i in range(n) :
		liste.append(randint(1,k))
	return liste

def saisir_proposition(n) :
	H = []
	for i in range(n) :
		prop = int(input("Saisissez un chiffre : "))
		H.append(prop)
	return H

def score(R, H) :
	scr = [0,0,0]
	for i in range(len(R)) :
		for j in range(len(H)) :
			if R[i] == H[j] :
				if i == j :
					scr[0] += 1
				else :
					scr[1] += 1
				H[j] = 0
				break
	scr[2] = len(R) - scr[0] - scr[1]
	return scr

""" Partie 1
rep = input("Jouer ? (y / n) : ")
while rep == "y" :
	long = int(input("Quel est la taille de la liste ? "))
	nbr = int(input("Jusqu'à quel nombre ? "))
	R = Inik(long, nbr)
	scr = [0, 0]
	#print(f"La liste secrete est {R}")
	while scr[0] != long :
		H = saisir_proposition(long)
		scr = score(R, H)
		print(f"{scr[0]} bien placé, {scr[1]} mal placé \n")
	print(f"La réponse était bien {R}")
	print("Jeu terminé \n\n")
	rep = input("Rejouer ? (y / n) : ")
"""

def affiche(L) :
	for ligne in L :
		[print(x, end=" ") for x in ligne]
		print("")

def toutes_possibilites(longueur, n):
	possibilites = [[]]
	for _ in range(longueur):
		nouvelles = []
		for c in range(len(possibilites)):
			comb= possibilites[c]
			for i in range(1, n+1):
				L=list(comb)
				L.append(i)
				nouvelles.append(L)
		possibilites = nouvelles
	return possibilites

def devine(L, scr, mem) :
	"""
	-1 : pas traité
	 0 : pas dans la liste
	 1 : peut être dedans
	 2 : dans la liste
	 3 : bien placé
	"""
	if scr[0] > 0 :
		for i in range(len(mem)) :
			for j in range(len(mem[i])) :
				for k in range(len(L)) :
					if i == L[k] :
						if mem[i-1][j] == -1 :
							mem[i-1][j] = 1
					elif i 



long = int(input("Quel est la taille de la liste ? "))
nbr = int(input("Jusqu'à quel nombre ? "))
mem = []
for i in range(nbr) :
	mem.append([])
	for _ in range(long) :
		mem[i].append(-1)
affiche(mem)
print("\n\n")

devine([1,2,3,4,5], [3,1,1], mem)
affiche(mem)
