### A Pluto.jl notebook ###
# v0.12.3

using Markdown
using InteractiveUtils

# ╔═╡ 67e66e34-0d4a-11eb-3b5b-43f479616a85
begin
	import Pkg
	Pkg.activate(mktempdir())
	
	Pkg.add("Compose")
	using Compose
end

# ╔═╡ 9c76b242-0d44-11eb-17c5-f52a44933839
md"# Categorical Modeling Language

We define the simplest possible concept as that which distinguishes **some-thing** from *no-thing* -- an object alone in the void:
"

# ╔═╡ 0488798a-0d4d-11eb-1a63-eb9077a04fe1
compose(context(), circle(0.5, 0.5, .01), fill("black"))

# ╔═╡ 69abdf64-0d4d-11eb-3b43-b913298a6ea2
md"
$$\frac{1}{1} + \frac{1}{4} + \frac{1}{9} + \cdots$$
converges to
$$\frac{\pi^2}{6}$$
"

# ╔═╡ Cell order:
# ╠═67e66e34-0d4a-11eb-3b5b-43f479616a85
# ╟─9c76b242-0d44-11eb-17c5-f52a44933839
# ╠═0488798a-0d4d-11eb-1a63-eb9077a04fe1
# ╠═69abdf64-0d4d-11eb-3b43-b913298a6ea2
