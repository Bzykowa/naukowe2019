#Karolina Bąk
#l2z3.jl Lista 2 zadanie 3
using LinearAlgebra
include("hilb.jl")
include("matcond.jl")

function gen_x(n::Int)
    if n < 1
        error("n >= 1")
    end
    return ([1 for i in 1:n])
end

function gen_b(A, x)
    return A*x
end

function gauss_elimination(A, b)
    return A\b
end

function inverted_mult(A, b)
    return inv(A)*b
end

function test_hilb_gauss()
    for i in 1:20
        A = hilb(i)
        x = gen_x(i)
        b = gen_b(A,x)
        xp = gauss_elimination(A, b)
        err = norm(x-xp)/norm(x)
        c = cond(A)
        r = rank(A)
        println(i,", ",err,", ",c,", ",r)
    end
end

function test_hilb_inv()
    for i in 1:20
        A = hilb(i)
        x = gen_x(i)
        b = gen_b(A,x)
        xp = inverted_mult(A, b)
        err = norm(x-xp)/norm(x)
        c = cond(A)
        r = rank(A)
        println(i,", ",err,", ",c,", ",r)
    end
end

function test_rand_inv()
    for i in [5,10,20]
        for j in [0,1,3,7,12,16]
            A = matcond(i,Float64(10)^j)
            x = gen_x(i)
            b = gen_b(A,x)
            xp = inverted_mult(A, b)
            err = norm(x-xp)/norm(x)
            c = cond(A)
            r = rank(A)
            println(i,", ",err,", ",c,", ",r)
        end
    end
end

function test_rand_gauss()
    for i in [5,10,20]
        for j in [0,1,3,7,12,16]
            A = matcond(i,Float64(10)^j)
            x = gen_x(i)
            b = gen_b(A,x)
            xp = gauss_elimination(A, b)
            err = norm(x-xp)/norm(x)
            c = cond(A)
            r = rank(A)
            println(i,", ",err,", ",c,", ",r)
        end
    end
end
