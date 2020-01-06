#Karolina Bąk

push!(LOAD_PATH, pwd())

using blocksys

curr_path = joinpath(pwd(), "test_data", "10000_1_1")

#czytanie A
readA(joinpath(curr_path, "A.txt"))
#blocksys.A

#czytanie b
#readb(joinpath(pwd(), "test_data", "16_1_1", "b.txt"))
#blocksys.b

#generowanie b
generateb(blocksys.A.A, blocksys.A.n, blocksys.A.l)
#print(blocksys.b)

#rozwiązanko Gauss bez wyboru
#solveGauss(blocksys.A.A, blocksys.b, blocksys.A.n, blocksys.A.l)
#print("\n")

#rozwiązanko Gauss z wyborem
#solveGaussChoice(blocksys.A.A, blocksys.b, blocksys.A.n, blocksys.A.l)
#print("\n")

#rozwiązanko LU z wyborem
#tmp = luChoice(blocksys.A.A, blocksys.b, blocksys.A.n, blocksys.A.l)
#solveLUChoice(blocksys.A.A, tmp.perm, blocksys.b, blocksys.A.n, blocksys.A.l)
#print("\n")

#rozwiązanko LU bez wyboru
lu(blocksys.A.A, blocksys.b, blocksys.A.n, blocksys.A.l)
solveLU(blocksys.A.A, blocksys.b, blocksys.A.n, blocksys.A.l)
#print("\n")

#cała tablica
#show(IOContext(stdout, :limit=>false), MIME"text/plain"(),blocksys.x)

#rezultat do pliku
#writeResults(joinpath(curr_path, "x.txt"), blocksys.x, blocksys.A.n, true)
#generowane
writeResults(joinpath(curr_path, "x_gen.txt"), blocksys.x, blocksys.A.n, true)
