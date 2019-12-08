#Karolina Bąk
#Testy 1-3

push!(LOAD_PATH, pwd())

using Interpolations
using Test

x1 = [3.0, 1.0, 5.0, 6.0]
f1 = [1.0, -3.0, 2.0, 4.0]

x2 = [-4.0, -2.0, 2.0, 4.0]
f2 = [0.0, 1.0, 2.0, 2.24829782228455]

@testset "Test ilorazów różnicowych" begin
    @test isapprox(ilorazyRoznicowe(x1, f1), [1.0, 2.0, -3.0/8.0, 7.0/40.0])
    @test isapprox(ilorazyRoznicowe(x2, f2), [0.0, 0.5, -0.04166666666, 0.002586435648797398],rtol=10^-6)
end

fx2 = ilorazyRoznicowe(x2, f2)

@testset "Test warNewton" begin
    @test isapprox(warNewton(x2, fx2, -4.0), 0.0)
    @test isapprox(warNewton(x2, fx2, -2.0), 1.0)
    @test isapprox(warNewton(x2, fx2, 2.0), 2.0)
    @test isapprox(warNewton(x2, fx2, 4.0), 2.24829782228455)
end

@testset "Test naturalna" begin
    @test isapprox(naturalna(x2, fx2), [1.625283,  0.239654, -0.031321, 0.002586], rtol=10^-5)
end