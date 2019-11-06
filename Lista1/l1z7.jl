#Karolina Bąk
#l1z7.jl Lista 1 zadanie 7

#Funkcja licząca przybliżoną pochodną
function derivative(f, x0, h)
    (f(x0+h)-f(x0))/h
end

#testowy f(x)
function f(x)
    sin(x)+cos(3x)
end

#dokładna pochodna f(x)
function fp(x)
    cos(x)-3*sin(3x)
end

#punkt, w którym będzie liczona pochodna
x0 = one(Float64)

for i in 0:54
    println("h = 2^",i,", 1+h = ",one(Float64)+2.0^-i,", f̃'(x0) = ",derivative(f,x0,2.0^-i),", |f'(x0)-f̃'(x0)| = ",abs(fp(x0)-derivative(f,x0,2.0^-i)))
end
