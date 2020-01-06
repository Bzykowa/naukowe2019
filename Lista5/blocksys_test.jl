#Karolina Bąk
#testy do listy 5

push!(LOAD_PATH, pwd())

using blocksys
using matrixgen
using Test
using PyPlot

#Sizes of test matrices
mat_sizes = [1000, 2000, 5000, 10000, 20000, 30000, 40000, 50000, 60000, 70000]
sub_size = 4
cond = one(Float64)
n_test = length(mat_sizes)

#Efficiency tests' results
time_gauss = vec(zeros(n_test))
time_gauss_choice = vec(zeros(n_test))
time_lu = vec(zeros(n_test))
time_lu_choice = vec(zeros(n_test))
time_lu_solve = vec(zeros(n_test))
time_lu_choice_solve = vec(zeros(n_test))

memory_gauss = vec(zeros(n_test))
memory_gauss_choice = vec(zeros(n_test))
memory_lu = vec(zeros(n_test))
memory_lu_choice = vec(zeros(n_test))
memory_lu_solve = vec(zeros(n_test))
memory_lu_choice_solve = vec(zeros(n_test))

operations_gauss = vec(zeros(n_test))
operations_gauss_choice = vec(zeros(n_test))
operations_lu = vec(zeros(n_test))
operations_lu_choice = vec(zeros(n_test))
operations_lu_solve = vec(zeros(n_test))
operations_lu_choice_solve = vec(zeros(n_test))

#Efficiency test directory path
path = joinpath(pwd(), "test_data", "eff_test")
unit_pathA = joinpath(pwd(), "test_data", "16_1_1", "A.txt")
unit_pathb = joinpath(pwd(), "test_data", "16_1_1", "b.txt")

for i in 1:n_test

    curr_path = joinpath(path, "test$(mat_sizes[i]).txt")
    #Generate test matrixes
    blockmat(mat_sizes[i], sub_size, cond, curr_path)
    println("Matrix size: ", mat_sizes[i])
    println("Submatrices size: ", sub_size)

    #Load generated matrix and compute b
    matrix = readA(curr_path)
    gen_b = generateb(matrix.A, matrix.n, matrix.l)

    #Gauss
    results = @timed solveGauss(matrix.A, gen_b, matrix.n, matrix.l)

    time_gauss[i] = results[2]
    memory_gauss[i] = results[3]
    operations_gauss[i] = mat_sizes[i] * sub_size^2 + 2 * mat_sizes[i] 

    #Load generated matrix and compute b
    matrix = readA(curr_path)
    gen_b = generateb(matrix.A, matrix.n, matrix.l)
    
    #Gauss with choice
    results = @timed solveGaussChoice(matrix.A, gen_b, matrix.n, matrix.l)

    time_gauss_choice[i] = results[2]
    memory_gauss_choice[i] = results[3]
    operations_gauss_choice[i] = mat_sizes[i] * sub_size^3 + 2 * mat_sizes[i]
    
    #Load generated matrix and compute b
    matrix = readA(curr_path)
    gen_b = generateb(matrix.A, matrix.n, matrix.l)

    #LU
    results = @timed lu(matrix.A, gen_b, matrix.n, matrix.l)
    data = results[1]

    time_lu[i] = results[2]
    memory_lu[i] = results[3]
    operations_lu[i] = mat_sizes[i] * (sub_size^2 + sub_size)

    results = @timed solveLU(matrix.A, gen_b, matrix.n, matrix.l)
    
    time_lu_solve[i] = results[2] + time_lu[i]
    memory_lu_solve[i] = results[3] + memory_lu[i]
    operations_lu_solve[i] = mat_sizes[i] * (sub_size^2 + sub_size) + 2 * mat_sizes[i] * sub_size

    # LU with choice

    # Loading generated matrix and computing vector of right sides
    matrix = readA(curr_path)
    vec = generateb(matrix.A, matrix.n, matrix.l)

    results = @timed luChoice(matrix.A, vec, matrix.n, matrix.l)
    data = results[1]

    time_lu_choice[i] = results[2]
    memory_lu_choice[i] = results[3]
    operations_lu_choice[i]  = mat_sizes[i] * (sub_size^3 + sub_size)

    results = @timed solveLUChoice(data.A, data.perm, data.b, matrix.n, matrix.l)
    
    time_lu_choice_solve[i] = results[2] + time_lu_choice[i]
    memory_lu_choice_solve[i] = results[3] + memory_lu_choice[i]
    operations_lu_choice_solve[i] = mat_sizes[i] * (sub_size^3 + sub_size) + 2 * mat_sizes[i] * sub_size
    
end
    
#Plots
    
clf()
plot(mat_sizes, time_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, time_gauss_choice, label="Gauss with choice", linewidth=1.0)
plot(mat_sizes, time_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, time_lu_choice_solve, label="LU with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Times of computing (solving methods)")
savefig("times_solving.png")

clf()
plot(mat_sizes, memory_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, memory_gauss_choice, label="Gauss with choice", linewidth=1.0)
plot(mat_sizes, memory_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, memory_lu_choice_solve, label="LU with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Used memory (solving methods)")
savefig("memory_solving.png")

clf()
plot(mat_sizes, operations_gauss, label="Gauss", linewidth=1.0)
plot(mat_sizes, operations_gauss_choice, label="Gauss with choice", linewidth=1.0)
plot(mat_sizes, operations_lu_solve, label="LU", linewidth=1.0)
plot(mat_sizes, operations_lu_choice_solve, label="LU with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Operations")
savefig("operations_solving.png")

# Only LU

clf()
plot(mat_sizes, time_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, time_lu_choice, label="Gauss with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Times of computing (only LU)")
savefig("times_lu.png")

clf()
plot(mat_sizes, memory_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, memory_lu_choice, label="Gauss with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Used memory (only LU)")
savefig("memory_lu.png")

clf()
plot(mat_sizes, operations_lu, label="Gauss", linewidth=1.0)
plot(mat_sizes, operations_lu_choice, label="Gauss with choice", linewidth=1.0)
grid(true)
legend(loc=2,borderaxespad=0)
title("Operations (only LU)")
savefig("operations_lu.png")

#unit test

@testset "16x16" begin
    matrix = readA(unit_pathA)
    vec = readb(unit_pathb)
    results = ones(16)

    @test isapprox(solveGauss(matrix.A, vec.b, matrix.n, matrix.l), results)

    matrix = readA(unit_pathA)
    vec = readb(unit_pathb)
    @test isapprox(solveGaussChoice(matrix.A, vec.b, matrix.n, matrix.l),  results)

    matrix = readA(unit_pathA)
    vec = readb(unit_pathb)
    tmp = lu(matrix.A, vec.b, matrix.n, matrix.l)
    @test isapprox(solveLU(matrix.A, vec.b, matrix.n, matrix.l),  results)

    matrix = readA(unit_pathA)
    vec = readb(unit_pathb)
    tmp = luChoice(matrix.A, vec.b, matrix.n, matrix.l)
    @test isapprox(solveLUChoice(tmp[1], tmp[2], vec[1], matrix[2], matrix[3]),  results)
end
