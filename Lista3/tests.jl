#Karolina Bąk
#tests.jl Lista 3 Zadania 1-3

push!(LOAD_PATH, pwd())
using Test
using PolyMethods

f1(x) = x^2 - 1
fp1(x) = 2x
f2(x) = x^2
f3(x) = 1/x
fp3(x) = -(1/x^2)

@testset "Testy dla bisekcji" begin
    #1 w przedziale [0,2]
    @test isapprox(mbisekcji(f1,0.0,2.0,10^-6,10^-6).r, 1.0; rtol=10^-6)
    #-1 w przedziale [-2,0]
    @test isapprox(mbisekcji(f1,-2.0,0.0,10^-6,10^-6).r, -1.0; rtol=10^-6)
    # error
    @test isapprox(mbisekcji(f1,0.5,0.0,10^-6,10^-6).err, 1)
end

@testset "Testy dla stycznych" begin
    #1 w pkt 2
    @test isapprox(mstycznych(f1, fp1, 2.0, 10^-6, 10^-6, 100).r, 1.0; rtol=10^-6)
    #-1 w pkt -2
    @test isapprox(mstycznych(f1, fp1, -2.0, 10^-6, 10^-6, 100).r, -1.0; rtol=10^-6)
    #-1 w pkt -1000
    @test isapprox(mstycznych(f1, fp1, -1000.0, 10^-6, 10^-6, 100).r, -1.0; rtol=10^-6)
    #1 w pkt 2 dokładność 10^-15
    @test isapprox(mstycznych(f1, fp1, 2.0, 10^-15, 10^-15, 100).r, 1.0; rtol=10^-15)
    #1 w pkt 2 dokładność 10^-17
    @test isapprox(mstycznych(f1, fp1, 2.0, 10^-17, 10^-17, 100).r, 1.0; rtol=10^-17)
    #error 1
    @test isapprox(mstycznych(f2, fp1, 100000.0, 10^-17, 10^-17, 10).err, 1; rtol=10^-17)
    #error 2
    @test isapprox(mstycznych(f3, fp3, -1.0, 10^-7, 10^-7, 10000).err, 2)
end

@testset "Testy dla siecznych" begin
    #1 w startach 0 i 2
    @test isapprox(msiecznych(f1, 0.0, 2.0, 10^-6, 10^-6, 100).r, 1.0; rtol=10^-6)
    #-1 w startach 0 i -2
    @test isapprox(msiecznych(f1, 0.0, -2.0, 10^-6, 10^-6, 100).r, -1.0; rtol=10^-6)
    #-1 w startach 0 i -1000
    @test isapprox(msiecznych(f1, 0.0, -1000.0, 10^-6, 10^-6, 100).r, -1.0; rtol=10^-6)
    #-1 w startach 1000 i -1000, error
    @test isapprox(msiecznych(f1, 1000.0, -1000.0, 10^-6, 10^-6, 100).err, 1)
end
