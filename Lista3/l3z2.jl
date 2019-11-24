#Karolina Bąk
#l3z2.jl Lista 3 Zadanie 2

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    x1 = x0
    if abs(v) < epsilon
        return (r=x1, v=v, it=0, err=0)
    end
    for it in 1:maxit
        fprim = pf(x0)
        if abs(fprim) < delta
            return (r=x1, v=v, it=it, err=2)
        end
        x1 = x0-v/fprim
        v = f(x1)
        if abs(x1-x0) < delta || abs(v) < epsilon
            return (r=x1, v=v, it=it, err=0)
        end
        x0 = x1
    end
    return (r=x1, v=v, it=maxit, err=1)
end
