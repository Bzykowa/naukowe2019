#Karolina Bąk
#l1z4.jl Lista 1 zadanie 4

#najmniejsza liczba z [1,2], która nie spełnia x*(1/x)=1
x = nextfloat(one(Float64))
while x < Float64(2.0)
    global test = x*(1/x)
    if test == 1.0
        global x+=δ;
    else
        println(x)
        break
    end
end

#najmniejsza liczba z [0,1], która nie spełnia x*(1/x)=1
x = nextfloat(Float64(0.))
while x < Float64(1.0)
    global test = x*(1.0/x)
    if test == 1.0
        global x = nextfloat(Float64(x));
    else
        println(x)
        break
    end
end
