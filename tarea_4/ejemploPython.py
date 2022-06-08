def lfsr_custom(seed, r, q, l, N=100):
    A = seed

    for i in range(1,len(list(range(1,(N*l)+1)))+1):
        if i>q:
            pr=i-(r+1)
            pq=i-(q+1)
            A.append(A[pr] ^ A[pq])  

    return A

def to_decimal(result, l, N=100):
    B = []
    jump = l
    const = 2**l

    for i in range(0, len(result), l):
        dec = ''.join(map(str, result[i:jump]))
        B.append(int(dec,2)/const)
        
        jump = jump + l

    return B

q = 7
r = 3
l = 5

seed = [1 for i in range(q)]

result=lfsr_custom(seed, r, q, l, 100)
numeros = to_decimal(result, 100)
print(numeros)