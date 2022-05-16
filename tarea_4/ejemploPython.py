A = [[1,0,1,0]]
B = []

c = 0
stop = ((2**len(A[0]))-1)

while True:
    B = []  
    B.append(A[c][2]^A[c][3])
    B.extend(A[c][0:(len(A[c])-1)])
    
    A.append(B)
    
    c+=1

    if c == stop:
        break

print(A)
    