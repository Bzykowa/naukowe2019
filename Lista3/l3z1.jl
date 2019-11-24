#Karolina Bąk
#l3z1.jl Lista 3 Zadanie 1

function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    M = typemax(Int32)
    u = f(a)
    w = f(b)
    e = b-a
    if sign(u) == sign(w)
        return (r=a,v=u,it=0,err=1)
    end
    for it in 1:M
        e /= 2
        c = a+e
        v = f(c)
        if abs(e) < delta || abs(v) < epsilon
            return (r=c,v=v,it=it,err=0)
        end
        if sign(v) != sign(u)
            b = c
            w = v
        else
            a = c
            u = v
        end
    end
end
