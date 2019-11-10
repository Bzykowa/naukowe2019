#Karolina Bąk
#l2z6.jl Lista 2 zadanie 6

function rec(n, c, x0)
    if (n == 0)
        return x0
    end
    xn = rec(n - 1, c, x0)^2 + c
    println(xn,",")
    return xn
end

function test1()
    rec(40, -2, 1)
end

function test2()
    rec(40, -2, 2)
end

function test3()
    rec(40, -2, 1.99999999999999)
end

function test4()
    rec(40, -1, 1)
end

function test5()
    rec(40, -1, -1)
end

function test6()
    rec(40, -1, 0.75)
end

function test7()
    rec(40, -1, 0.25)
end
