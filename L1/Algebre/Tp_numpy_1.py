import numpy as np
import math
from time import *

""" Exo 1 :
A = 2 * np.eye(3) + 3 * np.ones((3,3))
B = np.eye(4)
B[1:, 0] = 1
C = np.arange(1,17).reshape((4,4))
D = np.tile(np.arange(1,5), (4,1))
"""

""" Exo 2 :
B = np.array([[1, 1, 0],
			  [1,-1, 1],
			  [1, 0, 1]])
B_inv = np.linalg.inv(B)
var = B_inv @ np.array([[1],
						[3],
						[-2]])

print("le rang de la matrice est de :", np.linalg.matrix_rank(B))
print("Les valeurs des variables sont :\n", var)
"""

""" Exo 3 :
scal_1 = np.array([[1, 1, 1],
				   [1,-2, 1],
				   [2,-1, 1]])
coef_1 = np.array([[1],
				   [0],
				   [2]])
var_1 = np.linalg.inv(scal_1) @ coef_1


scal_2 = np.array([[3,  1, -1],
				   [1,  1,  1],
				   [1, -2,  2]])
coef_2 = np.array([[3],
				   [3],
				   [1]])
var_2 = np.linalg.inv(scal_2) @ coef_2


var_3 = np.linalg.inv(scal_1) @ var_2
"""

""" Exo 4 :
M = np.arange(1,11).reshape((10,1)) @ np.ones((1,10))
"""

""" Exo 5 :

t_0 = perf_counter()
sum = 0
L = [x for x in range(1000000)]

t_1 = perf_counter()
for i in L :
	sum += i

t_2 = perf_counter()
print(f"Avec une boucle : {t_2 - t_0:.6f} secondes", )

t_0 = perf_counter()
L = np.arange(0,1000001)

t_1 = perf_counter()
sum = L.sum()

t_2 = perf_counter()
print(f"Avec une numpy : {t_2 - t_0:.6f} secondes")

#On remarque que c'est plus rapide avec numpy
"""

""" Exo 6 :
def function(A, B ,C) :
	if (A.shape == B.shape == C.shape) :
		L = [A,B,C]
		new_array = np.zeros((A.shape[0]*3, A.shape[1]))
		for i in range(A.shape[0] * 3) :
			new_array[i] = L[i%3][i//3]
	return new_array
"""

""" Exo 7 :
def function_py(A) :
	
	new_A = A.copy()
	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			if (new_A[y][x] > 1) :
				new_A[y][x] = 1
			elif (new_A[y][x] < 0) :
				new_A[y][x] = 0
	return new_A
	
def function_np(A) :
	new_A = A.copy()
	new_A[new_A < 0] = 0
	new_A[new_A > 1] = 1
	return new_A
"""

""" Exo 8 :
def function_py(A) :
	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			A[y][x] = abs(A[y][x])
	return A
	
def function_np(A) :
	return np.abs(A)
"""

""" Exo 9 :
def function_py(A, B) :
	counter = 0
	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
				if (A[y][x] == B[y][x]) :
					counter += 1
	return counter / (A.shape[0] * A.shape[1]) * 100

def function_np(A,B) :
	M = (A == B)
	return np.sum(M) / (A.shape[0] * A.shape[1]) * 100
"""

""" Exo 10 :
def function_py(A) :
	m = 0
	ecart_type = 0
	n = A.shape[0] * A.shape[1]

	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			m += A[y][x]

	m /= n
	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			ecart_type += (A[y][x] - m)**2

	ecart_type = math.sqrt(ecart_type/n)
	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			A[y][x] = (A[y][x] - m) / ecart_type

def function_np(A) :
	m = np.mean(A)
	ecart_type = math.sqrt(np.var(A))
	A = (A-m)/ecart_type
"""

""" Exo 11 :
def function_py(A) :
	odd_mean = 0
	odd_nbr = 0
	even_mean = 0
	even_nbr = 0

	for y in range(0, A.shape[0]) :
		for x in range(0, A.shape[1]) :
			if (A[y][x]%2 == 0) :
				even_mean += A[y][x]
				even_nbr += 1
			else :
				odd_mean += A[y][x]
				odd_nbr += 1

	if (even_nbr == 0) :
		even_mean = None
	else :
		even_mean /= even_nbr

	if (odd_nbr == 0) :
		odd_mean = None
	else :
		odd_mean /= odd_nbr
	
	return even_mean, odd_mean

def function_np(A) :
	even_array = A[A % 2 == 0]
	odd_array = A[A % 2 != 0]

	even_mean = np.mean(even_array) if even_array.size>0 else None
	odd_mean = np.mean(odd_array) if odd_array.size>0 else None

	return (even_mean, odd_mean)
"""