import numpy as np

def decompLU(A) :

	n = A.shape[0]
	A_cp = np.copy(A)
	L = np.zeros((n,n))
	U = np.eye(n)
	P = np.eye(n)
	
	for h in range(n) :
		
		temp = np.empty(n-h)
		for i in range(h, n) :

			temp[i-h] = A_cp[i,h] - L[i,:h] @ U[:h,h]
		
		m = np.argmax(np.abs(temp)) + h
		if m != h :

			P[[h,m], :] = P[[m,h], :]
			A_cp[[h,m], :] = A_cp[[m,h], :]
			L[[h,m], :h] = L[[m,h], :h]
		
		for i in range(h, n) :

			L[i,h] = A_cp[i,h] - L[i,:h] @ U[:h,h]
		
		for j in range(h+1, n) :

			U[h,j] = A_cp[h,j] - L[h,:h] @ U[:h,j]
			U[h,j] /= L[h,h]
	
	return P, L, U

def invLowMatrix(L) :

	n = L.shape[0]
	X = np.zeros((n, n))

	for j in range(n) :
		
		for i in range(j, n) :

			if i == j :

				X[i, j] = 1 / L[i, i]

			else :

				X[i, j] = - (L[i, :i] @ X[:i, j]) / L[i, i]
	
	return X

def invUpMatrix(U) :
		
	return np.transpose(invLowMatrix(np.transpose(U)))

def invMatrix(A) :

	P, L, U = decompLU(A)
	return invUpMatrix(U) @ invLowMatrix(L) @ P

def solveEquation(A, B) :

	return invMatrix(A) @ B