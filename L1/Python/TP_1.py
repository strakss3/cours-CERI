""" Exo 1
a = int(input("Donnez un entier : "))
b = int(input("Donnez un entier : "))
if  a > b :
	print("plus grand")
elif a < b :
	print("pxlus petit")
else :
	print("égal")
"""

""" Exo 2
L = int(input("Donnez une longueur : "))
l = int(input("Donnez une largeur : "))
temp = 0
if l > L :
	temp = L
	L = l
	l = temp
print(f"La surface est de {l*L}")
"""

""" Exo 3
a = int(input("Donne un entier : "))
b = int(input("Donne un entier : "))
c = int(input("Donne un entier : "))
d = int(input("Donne un entier : "))
e = int(input("Donne un entier : "))
f = int(input("Donne un entier : "))
n = 0
if a == 0 :
	n += 1
if b == 0 :
	n += 1
if c == 0 :
	n += 1
if d == 0 :
	n += 1
if e == 0 :
	n += 1
if f == 0 :
	n += 1
if n >= 3 :
	print("la saisie est incorrecte")
else :
	print("la saisie est correcte")
"""

""" Exo 4
a = int(input("Donne un entier : "))
b = int(input("Donne un entier : "))
c = int(input("Donne un entier : "))
temp = 0
if a > b :
	temp = a
	a = b
	b = temp
if a > c :
	temp = a
	a = c
	c = temp
if b > c :
	temp = b
	b = c
	c = temp
print(f"{a} < {b} < {c}")
"""

""" Exo 5
somme = 0
n = int(input("Donne un entier : "))
val_Min = n
val_Max = n
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

n = int(input("Donne un entier : "))
if n > val_Max :
	val_Max = n
elif n < val_Min :
	val_Min = n
somme += n

print(f"la valeur minimale est {val_Min}")
print(f"la valeur maximale est {val_Max}")
print(f"la valeur moyenne est {somme/10}")
"""

""" Exo 6
a_x = float(input("valeur d'abscisse de a : "))
a_y = float(input("valeur d'ordonnée de a : "))
b_x = float(input("valeur d'abscisse de b : "))
b_y = float(input("valeur d'ordonnée de b : "))
dist = ((a_x - b_x)**2 + (a_y - b_y)**2)**0.5
print(f"la distance entre a et b est de {dist}")
"""

""" Exo 7
a_x = float(input("valeur d'abscisse de a : "))
a_y = float(input("valeur d'ordonnée de a : "))
b_x = float(input("valeur d'abscisse de b : "))
b_y = float(input("valeur d'ordonnée de b : "))
c_x = float(input("valeur d'abscisse de c : "))
c_y = float(input("valeur d'ordonnée de c : "))

cote_a = (c_x - b_x)**2 + (c_y - b_y)**2
cote_b = (a_x - c_x)**2 + (a_y - c_y)**2
cote_c = (a_x - b_x)**2 + (a_y - b_y)**2

if cote_a + cote_b == cote_c :
	print("Le triangle est rectangle en C")
elif cote_c + cote_b == cote_a :
	print("Le triangle est rectangle en A")
elif cote_a + cote_c == cote_b :
	print("Le triangle est rectangle en B")
else : 
	print("Le triangle n'est pas rectangle")
"""

""" Exo 8
ope = input("Choisissez un opérateur : ")
a = int(input("Choisissez un entier : "))
b = int(input("Choisissez un entier : "))
if ope == "+" :
	print(f"le résultat de {a}+{b} est de {a+b}")
elif ope == "-" :
	print(f"le résultat de {a}-{b} est de {a-b}")
elif ope == "*" :
	print(f"le résultat de {a}*{b} est de {a*b}")
elif ope == "/" :
	if b != 0 :
		print(f"le résultat de {a}/{b} est de {a/b}")
	else :
		print("division par 0 impossible")
"""

""" Exo 9
a = int(input("Donnez un entier : "))
while a == 0 :
	print("Donnée invalide !")
	a = int(input("Donnez un entier : "))
b = int(input("Donnez un entier : "))
c = int(input("Donnez un entier : "))
delta = b**2 - 4*a*c
if delta > 0 :
	x1 = (-b+delta**0.5)/2*a
	x2 = (-b-delta**0.5)/2*a
	print(f"les racines sont {x1} et {x2}")
elif :
	x1 = (-b+delta**0.5)/2*a
	print(f"la racine doubles est {x1}")
else :
	print("pas de racines réels")
"""

""" Exo 10
n = int(input("Donne un entier : "))
if 999 < n <= 9999 :
	a = n//1000
	n %= 1000
	b = n//100
	n %= 100
	c = n//10
	n %= 10
	print(a,b,c,n)
else :
	print("le nombre n'as pas 4 digit")
"""
