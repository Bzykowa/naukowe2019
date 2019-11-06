#Karolina Bąk
#l1z3.jl Lista 1 zadanie 3

#sprawdzenie czy odległość między dwoma liczbami double = 2^-52 przy 1 z prawej
x1 = one(Float64)
x2 = one(Float64)
δ = Float64(2^(-52))
println("Test dla 1")
println("x1 = ",bitstring(x1))
x1 += δ
x2 = nextfloat(Float64(x2))
println("x1 = ",bitstring(x1))
println("x2 = ",bitstring(x2))

#sprawdzenie czy odległość między dwoma liczbami double = 2^-52 przy 2 z lewej
x1 = Float64(2.0)
x2 = Float64(2.0)
println("Test dla 2")
println("x1 = ",bitstring(x1))
x1 -= δ
x2 = prevfloat(Float64(x2))
println("x1 = ",bitstring(x1))
println("x2 = ",bitstring(x2))

#sprawdzenie czy odległość między dwoma liczbami double = 2^-52 przy 1.5
x1 = Float64(1.5)
x2 = Float64(1.5)
println("Test dla 1.5")
x1 -= δ
x2 = prevfloat(Float64(x2))
println("x1 = ",bitstring(x1))
println("x2 = ",bitstring(x2))
x1 = Float64(1.5)
x2 = Float64(1.5)
println("x1 = ",bitstring(x1))
x1 += δ
x2 = nextfloat(Float64(x2))
println("x1 = ",bitstring(x1))
println("x2 = ",bitstring(x2))

#binarny wygląd liczby Float64(.5)
println("0.5 zapisane binarnie: ",bitstring(Float64(.5)))

#binarny wygląd liczby Float64(4.)
println("0.5 zapisane binarnie: ",bitstring(Float64(4.)))
