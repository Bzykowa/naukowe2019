#Karolina Bąk
#l4z6.jl Lista 4 Zadanie 6

push!(LOAD_PATH, pwd())

using Interpolations

global ns = [5, 10, 15]
vec(ns)

foreach(n -> rysujNnfx(x -> abs(x), -1.0, 1.0, n, "6a_$(n)"), ns)
foreach(n -> rysujNnfx(x -> 1 / (1+x^2), -5.0, 5.0, n, "6b_$(n)"), ns)