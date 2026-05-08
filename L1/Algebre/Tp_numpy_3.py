import numpy as np

def isNull(nbr) :
	return abs(nbr) < 10**(-10)

# Exo 1.a
def findPivotInRow(M, row) :
	for col in range(M.shape[1]) :
		if(not isNull(M[row, col])) :
			return col
	return -1

# Exo 1.b
def isRowNull(M, row) :
	return np.all(isNull(M[row]))

# Exo 1.c
def isAllNullRowBottom(M) :
	row = 0
	nbr_row = M.shape[0]
	while(row < nbr_row and not isRowNull(M, row)) :
		row += 1
	while(row < nbr_row) :
		if (not isRowNull(M, row)) :
			return False
		row += 1
	return True

# Exo 1.d
def nullBelowPivot(M, row, col) :
	return np.all(isNull(M[row+1:, col]))

# Exo 1.e
def isEchelon(M) :
	if (not isAllNullRowBottom(M)) :
		return False
	for row in range(M.shape[0]) :
		col = findPivotInRow(M, row)
		if (col == -1) :
			break
		if (not nullBelowPivot(M, row, col)) :
			return False
	return True

# Exo 2
def echelonAlgorithm(M) :
	m , n = M.shape
	i = 0
	j = 0
	while(i < m and j < n) :
		k = i
		while(k < m and isNull(M[k, j])) :
			k += 1
		if (k >= m) :
			j += 1
		else :
			M[i], M[k] = M[k].copy(), M[i].copy()
			for r in range(i+1, m) :
				if (not isNull(M[r,j])) :
					fact = M[r,j] / M[i,j]
					for c in range(j, n) :
						M[r,c] -= fact * M[i,c]
			j += 1
			i += 1

# Exo 3
'''
M = np.array([[0,-2,1],
			  [0,2,-8],
			  [-4,5,6]])
print(M, "\n")
echelonAlgorithm(M)
print(M)

# Le résutat est le bon
'''

# Exo 4
'''
M = np.array([[3,1,2,3,1,1],
			  [0,0,1,2,1,0],
			  [0,1,0,1,1,1],
			  [1,0,5,0,1,2]])

echelonAlgorithm(M)

# Pour simplifier le calcul, nous allons réduire la
# matrice après l'avoir échelonné. Ce qui nous donne :

[[1  1  0  0  1  2],
 [0  1  0  0  0  1],
 [0  0  1  2  1  0],
 [0  0  0  1  0 -1]]

# On a e1,e2,e3,e4 qui sont libres qui
# formes la base de Vect(e1,...,e6).

# e5 = e1 + e3
# e6 = 2e1 + e2 - e4
'''

# Exo 5
def betterEchelonAlgorithm(M) :
	M = M.astype(float)
	m , n = M.shape
	i = 0
	j = 0
	while(i < m and j < n) :
		k = i
		while(k < m and isNull(M[k, j])) :
			k += 1
		if (k >= m) :
			j += 1
		else :
			M[i], M[k] = M[k].copy(), M[i].copy()
			if (i+1 < m) :
				f = M[i+1:, j] / M[i, j]
				M[i+1:, j:] -= f[:, None] * M[i, j:]
			j += 1
			i += 1
	M[isNull(M)] = 0.0
	return M
