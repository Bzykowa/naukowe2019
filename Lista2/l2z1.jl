#Karolina Bąk
#l2z1.jl Lista 2 zadanie 1

n = 5
#wartości Float64
x = Float64[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
#wartości w Float32
x32 = map(element -> convert(Float32, element), x)
y32 = map(element -> convert(Float32, element), y)

S1 = Float32(0.0)
S2 = Float64(0.0)

#algorytm w przód
for i in 1:n
    global S1+=x32[i]*y32[i]
    global S2+=x[i]*y[i]
end
println("single S: ", S1)
println("double S: ", S2)

S1 = Float32(0.0)
S2 = Float64(0.0)

#algorytm w tył
for i in reverse(1:n)
    global S1+=x32[i]*y32[i]
    global S2+=x[i]*y[i]
end
println("single S: ", S1)
println("double S: ", S2)

#od największej sumy do najmniejszej
S1s = Float32[]
S2s = Float64[]
for i in 1:5
    S1=x32[i]*y32[i]
    S2=x[i]*y[i]
    push!(S1s, S1)
    push!(S2s, S2)
end
sort!(S1s, rev=true)
sort!(S2s, rev=true)
S1a = Float32(0.0)
S2a = Float64(0.0)
S1b = Float32(0.0)
S2b = Float64(0.0)
#sumy dodatnie (od max do min)
for i in 1:3
    global S1a+=S1s[i]
    global S2a+=S2s[i]
end
#sumy ujemne (od min do max)
for i in reverse(4:n)
    global S1b+=S1s[i]
    global S2b+=S2s[i]
end
S1 = S1a + S1b
S2 = S2a + S2b
println("single S: ", S1)
println("double S: ", S2)

#od najmniejszej sumy do największej
S1a = Float32(0.0)
S2a = Float64(0.0)
S1b = Float32(0.0)
S2b = Float64(0.0)
#dodatnie (od min do max)
for i in reverse(1:3)
    global S1a+=S1s[i]
    global S2a+=S2s[i]
end
#ujemne (od max do min)
for i in 4:n
    global S1b+=S1s[i]
    global S2b+=S2s[i]
end
S1 = S1a + S1b
S2 = S2a + S2b
println("single S: ", S1)
println("double S: ", S2)
