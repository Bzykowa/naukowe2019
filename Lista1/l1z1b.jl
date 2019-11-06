#Karolina Bąk
#l1z1b.jl - Lista 1 zadanie 1 część 2

#pętla, która iteracyjnie liczy eta dla Float16 poprzez dzielenie 1 przez 2
i = Float16(.5)
iprev = Float16(1.)
while Float16(i)>Float16(0.)
    global iprev = i
    global i = Float16(i)/2
end
println("Float16 eta pętla: ", iprev)
println("Float16 eta Julia: ", nextfloat(Float16(0.)))

#pętla, która iteracyjnie liczy eta dla Float32 poprzez dzielenie 1 przez 2
i = Float32(.5)
iprev = Float32(1.)
while Float32(i)>Float32(0.)
    global iprev = i
    global i = Float32(i)/2
end
println("Float32 eta pętla: ", iprev)
println("Float32 eta Julia: ", nextfloat(Float32(0.)))

#pętla, która iteracyjnie liczy eta dla Float64 poprzez dzielenie 1 przez 2
i = Float64(.5)
iprev = Float64(1.)
while Float64(i)>Float64(0.)
    global iprev = i
    global i = Float64(i)/2
end
println("Float64 eta pętla: ", iprev)
println("Float64 eta Julia: ", nextfloat(Float64(0.)))
