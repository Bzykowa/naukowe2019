#Karolina Bąk
#l3z3.jl Lista 3 Zadanie 3

function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fx0 = f(x0)
    fx1 = f(x1)
    for it in 1:maxit
        if abs(fx0) > abs(fx1)
            x0, x1 = x1, x0
            fx0, fx1 = fx1, fx0
        end
        s = (x1-x0)/(fx1-fx0)
        x1 = x0
        fx1 = fx0
        x0 = x0 - fx0*s
        fx0 = f(x0)
        if abs(x1-x0) < delta || abs(fx0) < epsilon
            return (r=x0, v=fx0, it=it, err=0)
        end
    end
    return (r=x0, v=fx0, it=maxit, err=1)
end
