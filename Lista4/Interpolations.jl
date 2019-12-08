#Karolina Bąk
#Lista 4 Zadania 1-4

module Interpolations

    using PyPlot

    #stały mnożnik liczby punktów, których używam do narysowania wykresu
    global mult = 20

    function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
        ln = length(f)
        fx = copy(f)

        for i in 2:ln
            for j = ln:-1:i
                fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
            end
        end

        return fx
    end

    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        ln = length(x)
        nt = fx[ln]

        for i in ln - 1:-1:1
            nt = fx[i] + (t - x[i]) * nt
        end

        return nt
    end

    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        ln = length(x)
        a = zeros(ln)
        a[ln] = fx[ln]

        for i in ln - 1:-1:1
            a[i] = fx[i] - a[i + 1] * x[i]

            for j in i + 1:ln - 1
                a[j] = a[j] - a[j + 1] * x[i]
            end
        end

        return a
    end

    function rysujNnfx(f, a::Float64, b::Float64, n::Int, plotName="nnfx")
        max_nodes = n + 1
        x = zeros(max_nodes)
        y = zeros(max_nodes)
        f_x = zeros(max_nodes)

        h = (b - a) / n
        kh = Float64(0.0)

        plot_args = zeros(mult * max_nodes)
        plot_val = zeros(mult * max_nodes)
        plot_ip = zeros(mult * max_nodes)

        for i in 1:max_nodes
            x[i] = a + kh
            y[i] = f(x[i])
            kh += h
        end

        vec(x)
        vec(y)
        f_x = ilorazyRoznicowe(x, y)

        kh = Float64(0.0)
        max_nodes *= mult
        h = (b - a) / (max_nodes - 1)

        for i in 1:max_nodes
            plot_args[i] = a + kh
            plot_ip[i] = warNewton(x, f_x, plot_args[i])
            plot_val[i] = f(plot_args[i])
            kh += h
        end

        clf()
        plot(plot_args, plot_val, label = "f(x)", linewidth = 2.5)
        plot(plot_args, plot_ip, label = "w(x)", linewidth = 1.5)
        grid(true)
        legend(loc = 2, borderaxespad = 0)
        savefig("plots\\$(plotName).png")
    end

    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

end