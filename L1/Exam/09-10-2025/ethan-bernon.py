def exo1(a, b, c) :
	if a > b :
		valTemp = a
		a = b
		b = valTemp
	
	if a > c :
		valTemp = a
		a = c
		c = valTemp
	
	if b > c :
		valTemp = b
		b = c
		c = valTemp
	
	return a, b, c

def exo2(h, m ,s) :
	m += h * 60
	s += m * 60
	return s

def exo3(S) :
	m = S // 60
	S %= 60
	h = m // 60
	m %= 60
	return h, m ,S

def exo4(L, N) :
	N -= 1
	e_max = L[N-1] - L[N]
	e_min = e_max
	while N > 0 :
		ecart = L[N-1] - L[N]
		if ecart > e_max :
			e_max = ecart
		if ecart < e_min :
			e_min = ecart
		N -= 1
	return e_max, e_min

def exo5(M, nb_l, nb_c) :
	i = 0
	L = []
	while i < nb_l :
		j = 0
		indMin = 0
		while j < nb_c :
			if M[i][j] < M[i][indMin] :
				indMin = j
			j += 1
		L.append(indMin)
		i += 1
	return L

def exo6(M, nb_l, nb_c) :
	indMin = exo5(M, nb_l, nb_c)
	i = 0
	while i < nb_l :
		j = 0
		while j < nb_l :
			if M[j][indMin[i]] > M[i][indMin[i]] :
				break
			j += 1
		if j == nb_l :
			return True
		i += 1
	return False
