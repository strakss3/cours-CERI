import numpy as np
from time import *

''' Exo 1 :

# Via l'élimination de Gauss je trouve :
# u = 10
# v = 6
# w = 3

A = np.array([[ 0, 1,-1,],
              [-2, 4,-1],
              [-2, 5,-4]])

B = np.array([ 3, 1,-2])

X = np.linalg.solve(A, B)

# On retrouve bien :
# u = 10
# v = 6
# w = 3

'''

''' Exo 2 :
# Après calcul à la main du produit matriciel entre A et B, on obtient :
AB = [[ -9, -6,-10],
      [  5,  4,  5],
      [ 18,  6, 19]]

def manualDotProduct(A, B) :
    return sum([ A[i] * B[i] for i in range(A.shape[0])])

def manualMatrixProduct(A, B) :
    M = np.empty([A.shape[0], B.shape[1]])
    for y in range(A.shape[0]) :
        for x in range(B.shape[1]):
            M[y,x] = manualDotProduct(A[y,:], B[:,x])
    return M

A = np.array([[  9, -6, 10],
              [ -5,  2, -5],
              [-12,  6,-13]])

B = np.array([[  9, -6, 10],
              [ -5,  2, -5],
              [-12,  6,-13]])

t_0 = perf_counter()
manualMatrixProduct(A, B)
t_1 = perf_counter()
print(f"Produit manuellement : {t_1 - t_0:.6f} secondes")

t_0 = perf_counter()
np.dot(A, B)
t_1 = perf_counter()
print(f"Produit avec numpy : {t_1 - t_0:.6f} secondes")

'''

''' Exo 3 :
def computeStats(A):
    overall_mean = np.mean(A)
    overall_std = np.std(A)
    
    per_subject_means = np.mean(A, axis=0)
    per_subject_stds = np.std(A, axis=0)
    
    return overall_mean, overall_std, per_subject_means, per_subject_stds

def getIndexAboveMean(A, value):
    student_means = np.mean(A, axis=1)
    index = np.where(student_means > value)[0]

    return index.tolist()
'''

''' Exo 4 :
A = np.array([[2,3,6,5,4],
              [9,8,7,9,8],
              [0,2,3,0,1],
              [3,6,9,8,5],
              [1,1,1,1,1]])

A_inv = np.linalg.inv(A)

# La méthode np.allclose() compare 2 matrice et dit si elle sont égales
print(np.allclose(A @ A_inv, np.eye(5)))

'''

''' Exo 5 : '''
def chercher_pivot(M, l, c):
    pivot = l
    for k in range(l, M.shape[0]) :
        if abs(M[k][c]) > abs(M[pivot][c]) :
            pivot = k
    return pivot

def echange_lignes(M, i, j) : 
    M[i], M[j] = M[j].copy(), M[i].copy()

def transvection(M, i, j, c) :
    M[j]= M[i,c] * M[j] - M[j,c] * M[i]

def echelonner(A) : 
    n1 = A.shape[0]
    n2 = A.shape[1]
    l = 0
    for c in range(n2): 
        if (l == (n1 - 1)) : 
            break 
        pivot = chercher_pivot(A, l, c) 
        if (A[pivot][c] == 0) : 
            continue 
        if (pivot > l) : 
            echange_lignes(A, l, pivot) 
        for k in range(l+1, n1) :
            transvection(A, l, k, c) 
        l = l + 1

def echelonnerModified(A) :
    former_A = np.copy(A)
    n1 = A.shape[0] 
    n2 = A.shape[1] 
    l = 0
    pivot_columns = []
    for c in range(n2) :  
        if (l == (n1 - 1)) :       
            break
        pivot = chercher_pivot(A, l, c)
        if(A[pivot][c] == 0) :
            continue
        if (pivot > l) :
            echange_lignes(A, l, pivot) 
        
        pivot_columns.append(c)

        for k in range(l+1, n1): 
            transvection(A, l, k, c) 
        l = l + 1
    
    rank = len(pivot_columns)
    pivot_matrix = former_A[:, pivot_columns]
    return rank, pivot_matrix


A = np.array([[1,2,1,1],
              [2,4,2,2],
              [3,6,3,4]], dtype = float)

B = np.array([[1,2,1,3,3],
              [2,4,0,4,4],
              [1,2,3,5,5],
              [2,4,0,4,7]], dtype = float)

print(A, "\n")
echelonnerModified(A)
print(A, "\n")

print(B, "\n")
echelonnerModified(B)
print(B, "\n")