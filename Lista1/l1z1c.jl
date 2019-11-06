#Karolina Bąk
#l1z1c.jl - Lista 1 zadanie 1 część 3

#pętla, która iteracyjnie zbliża się do max dla Float16 poprzez mnożenie 1 przez 2
i = Float16(1.)
iprev = Float16(1.)
while !isinf(i)
    global iprev = i
    global i = Float16(i)*2
end
i = iprev
#pętla, która podchodzi liczba po liczbie do max Float16
while !isinf(i)
    global iprev = i
    global i = nextfloat(Float16(i))
end
println("Float16 max pętla: ", iprev)
println("Float16 max Julia: ", floatmax(Float16))

#pętla, która iteracyjnie zbliża się do max dla Float32 poprzez mnożenie 1 przez 2
i = Float32(1.)
iprev = Float32(1.)
while !isinf(i)
    global iprev = i
    global i = Float32(i)*2
end
i = iprev
#pętla, która podchodzi liczba po liczbie do max Float32
while !isinf(i)
    global iprev = i
    global i = nextfloat(Float32(i))
end
println("Float32 max pętla: ", iprev)
println("Float32 max Julia: ", floatmax(Float32))

#pętla, która iteracyjnie zbliża się do max dla Float64 poprzez mnożenie 1 przez 2
i = Float64(1.)
iprev = Float64(1.)
while !isinf(i)
    global iprev = i
    global i = Float64(i)*2
end
#lekka modyfikacja, żeby program nie liczył tego do jutra
i = iprev*Float64(1.99999999)
#pętla, która podchodzi liczba po liczbie do max Float64
while !isinf(i)
    global iprev = i
    global i = nextfloat(Float64(i))
end
println("Float64 max pętla: ", iprev)
println("Float64 max Julia: ", floatmax(Float64))
