#Karolina Bąk
#l3z6.jl Lista 3 Zadanie 6

push!(LOAD_PATH, pwd())
using PolyMethods

δ = 10^-5
ϵ = 10^-5
maxit = 1000

f1(x) = exp(1-x)-1
f2(x) = x*exp(-x)
fp1(x) = -exp(1-x)
fp2(x) = -1*exp(-x)*(x-1)

function bi_test()
    a = -1.0
    b = 1.0
    println(mbisekcji(f1,a,b,δ,ϵ))
    println(mbisekcji(f2,a,b,δ,ϵ))
end

function newt_test()
    x0 = 0.0
    x1 = 1.0
    x2 = 100.0
    x3 = 0.5
    x4 = 1.01
    println(mstycznych(f1,fp1,x0,δ,ϵ,maxit))
    println(mstycznych(f2,fp2,x0,δ,ϵ,maxit))
    println(mstycznych(f2,fp2,x3,δ,ϵ,maxit))
    println(mstycznych(f1,fp1,x1,δ,ϵ,maxit))
    println(mstycznych(f1,fp1,x2,δ,ϵ,maxit))
    println(mstycznych(f2,fp2,x1,δ,ϵ,maxit))
    println(mstycznych(f2,fp2,x4,δ,ϵ,maxit))
end

function siecz_test()
    x0 = -1.0
    x1 = 1.0
    println(msiecznych(f1,x0,x1,δ,ϵ,maxit))
    println(msiecznych(f2,x0,x1,δ,ϵ,maxit))
end
