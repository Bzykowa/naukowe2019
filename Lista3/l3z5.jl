#Karolina Bąk
#l3z5.jl Lista 3 Zadanie 5

push!(LOAD_PATH, pwd())
using PolyMethods

δ = 10^-4
ϵ = 10^-4

f1(x) = exp(x)-3x
f2(x) = 3x-exp(x)

function test()
    println("f1")
    print("[-1,1] ")
    println(mbisekcji(f1,-1.0,1.0,δ,ϵ))
    print("[-20,0] ")
    println(mbisekcji(f1,-20.0,0.0,δ,ϵ))
    print("[-40,-20] ")
    println(mbisekcji(f1,-40.0,20.0,δ,ϵ))
    print("[0,20] ")
    println(mbisekcji(f1,0.0,20.0,δ,ϵ))
    print("[1,20] ")
    println(mbisekcji(f1,1.0,20.0,δ,ϵ))
    print("[2,20] ")
    println(mbisekcji(f1,2.0,20.0,δ,ϵ))
    print("[20,40] ")
    println(mbisekcji(f1,20.0,40.0,δ,ϵ))
    println("f2")
    print("[-1,1] ")
    println(mbisekcji(f2,-1.0,1.0,δ,ϵ))
    print("[-20,0] ")
    println(mbisekcji(f2,-20.0,0.0,δ,ϵ))
    print("[-40,-20] ")
    println(mbisekcji(f2,-40.0,20.0,δ,ϵ))
    print("[0,20] ")
    println(mbisekcji(f2,0.0,20.0,δ,ϵ))
    print("[1,20] ")
    println(mbisekcji(f2,1.0,20.0,δ,ϵ))
    print("[2,20] ")
    println(mbisekcji(f2,2.0,20.0,δ,ϵ))
    print("[20,40] ")
    println(mbisekcji(f2,20.0,40.0,δ,ϵ))
end
