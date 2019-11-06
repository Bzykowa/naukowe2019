#Karolina Bąk
#l1z6.jl Lista 1 zadanie 6

function f(x)
    sqrt((x^2)+1)-1
end

function g(x)
    (x^2)/(sqrt((x^2) + 1) + 1)
end

#wykładnik 8
i = -1
fx = Float64(1.0)
gx = Float64(1.0)

#pętla licząca wartości f(x) i g(x) aż obie się nie wyzerują
while fx != 0.0 || gx != 0.0
    global fx = f(8.0^i)
    global gx = g(8.0^i)
    println("f(8^",i,"): ",fx)
    println("g(8^",i,"): ",gx)
    global i-=1
end
