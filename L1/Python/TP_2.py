from random import *

''' Exo 1
def CalculDelta(a, b, c) :
	return b*b - 4*a*c
	
def Resoudre(a, b, c) :
	if a == 0 :
		if b == 0 :
			if c == 0 :
				S = [-1]
			else :
				S = [0]
		else :
			S = [1, -c/b]
	else :
		disc = CalculDelta(a, b ,c)
		if disc == 0 :
			S = [1, -b/2*a]
		elif disc > 0 :
			S = [2, (-b-(disc)**0.5)/(2*a), (-b+(disc)**0.5)/(2*a)]
		else :
			S = [0]
	return S
			
def Affichage(a, b ,c) :
	solut = Resoudre(a, b ,c)
	if solut[0] == -1 :
		print("Ce polynome possède une infinité de racines.")
	elif solut[0] == 0 :
		print("Ce polynome possède aucune racine réelle.")
	elif solut[0] == 1 :
		print(f"Ce polynome possède une racine réelle : {solut[1]}")
	elif solut[0] == 2 :
		print(f"Ce polynome possède deux racines réelles : {solut[1]} et {solut[2]}")

a = float(input("Entrez la valeur de a : "))
b = float(input("Entrez la valeur de b : "))
c = float(input("Entrez la valeur de c : "))
Affichage(a, b ,c)
'''

''' Exo 2
def est_premier(n) :
	if n > 2  and n%2 == 0 :
		return False
	i = 3
	while i*i < n :
		if n%i == 0 :
			return False
		i += 2
	return True

def plus_petit_diviseur(n) :
	"""
	l'énoncé demande d'utiliser la fonction
	est_premier mais cela n'est pas nécessaire
	"""
	i = 2
	while i*i < n :
		if n%i == 0 :
			return i
		i += 1
	return n

def decomposition_facteurs(n) :
	decomp = f"{n} = "
	while n != 1 :
		i = plus_petit_diviseur(n)
		n /= i
		decomp += f"{i} * "
	return decomp + "1"
'''

''' Exo 3
def generer_nombre(minimum, maximum) :
	return randint(minimum, maximum)

def verifier_nombre(secret, proposition) :
	if proposition < secret :
		# plus petit
		return 1
	elif proposition > secret :
		# plus grand
		return 2
	else :
		# égaux
		return 3

def jouer() :
	nb = int(input("Combien de tentatives ?\n"))
	myst = generer_nombre(-10, 10)
	print("\n\n\n")
	while nb != 0 :
		prop = int(input("Quel est votre proposition :"))
		indice = verifier_nombre(myst, prop)
		if indice == 1 :
			print("Votre proposition est trop petite")
		elif indice == 2 :
			print("Votre proposition est trop grande")
		elif indice == 3 :
			print("Vous avez trouvé")
			break
		nb -= 1
	print(f"la solution était : {myst}")
	main()
	

def main() :
	rep = input("Jouer ? y / n : \n")
	if rep == "y" :
		jouer()

if __name__ == "__main__":
	main()
'''

''' Exo 4
def factorielle(n) :
	if n < 2 :
		return 1
	return n * factorielle(n-1)

def coeff_binomial(k, n) :
	return int(factorielle(n) / (factorielle(n-k) * factorielle(k)))
	
def triangle_pascal(nb_lignes) :
	n = 0
	while n < nb_lignes :
		k = 0
		while k <= n :
			if k == n : 
				print(coeff_binomial(k,n))
			else :
				print(coeff_binomial(k,n), end=' ')
			k += 1
		n += 1
'''
