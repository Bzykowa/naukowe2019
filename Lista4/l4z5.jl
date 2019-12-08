#Karolina Bąk
#l4z5.jl Lista 4 Zadanie 5

push!(LOAD_PATH, pwd())

using Interpolations

global ns = [5, 10, 15]
vec(ns)

foreach(n -> rysujNnfx(x -> exp(x), 0.0, 1.0, n, "5a_$(n)"), ns)
foreach(n -> rysujNnfx(x -> x^2 * sin(x), -1.0, 1.0, n, "5b_$(n)"), ns)