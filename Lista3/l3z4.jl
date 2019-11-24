#Karolina Bąk
#l3z4.jl Lista 3 Zadanie 4

push!(LOAD_PATH, pwd())
using PolyMethods

f(x) = sin(x)-(0.5x)^2
fp(x) = cos(x)-(x/2)
δ = 0.5*10^-5
ϵ = 0.5*10^-5
maxit = 100

function bi_test()
    a = 1.5
    b = 2.0
    println(mbisekcji(f,a,b,δ,ϵ))
end

function newt_test()
    x0 = 1.5
    println(mstycznych(f,fp,x0,δ,ϵ,maxit))
end

function siecz_test()
    x0 = 1.0
    x1 = 2.0
    println(msiecznych(f,x0,x1,δ,ϵ,maxit))
end
