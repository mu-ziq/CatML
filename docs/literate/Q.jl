### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ 4791d310-0fb0-11eb-3cda-091997df858e
begin
    import Pkg
    Pkg.activate(mktempdir())

	# framework for applied and computational category theory
    Pkg.add("Catlab")
    using Catlab.Theories
    using Catlab.WiringDiagrams
    using Catlab.Graphics

	# create Tikz pictures
    Pkg.add("TikzPictures")
	using TikzPictures

	# create Tikz graphs
	using Pkg
	Pkg.add("TikzGraphs")
	
	# disciplined convex programming
    Pkg.add("Convex") 
    import Convex

	# splitting cone solver
    Pkg.add("SCS")
    import SCS
end

# ╔═╡ 8688aaa8-0fab-11eb-01bf-91a51597e7aa
md"# Maana Q: Knowledge and Reasoning Platform"

# ╔═╡ 0587c8a2-0fac-11eb-12ea-0fd0ca6e4c4f
md"## Applied Category Theory using GATs"

# ╔═╡ 50cda3cc-0fac-11eb-2a02-ebba6efe5967
md"### Two views on category theory and software [^Patterson1]

1. Designing with categories: CT informing the design, architecture, and implementation of computer programs, in any domain.

**Slogan**: *Design patterns, but better*

2. Computing on categories: data structures and algorithms for computing with objects and morphisms in categories.

**Slogan**: *Computer algebra of categories* or *computational category theory*

**These are orthogonal [and can be layered].**

!!! tip
	This notebook is about how to use Q for computational category theory (mostly).

[^Patterson1]: [Evan Patterson: Realizing Applied Category Theory in Julia](https://www.youtube.com/watch?v=7dmrDYQh4rc)
"

# ╔═╡ cc960750-0fad-11eb-25b5-49b1c1ff61e5
md"### Representing morphisms in monoidal categories"

# ╔═╡ ef9564e6-0fae-11eb-0fc6-d93ee30c9979
md"Transforming between different **computational representations** of morphisms in symmetric monoidal categories"

# ╔═╡ b5f3fa36-0fb0-11eb-0f01-bda1cd65a2ef
tp = TikzPicture("\\begin{graph}\\end{graph}", options="scale=1.25", preamble="")

# ╔═╡ Cell order:
# ╟─4791d310-0fb0-11eb-3cda-091997df858e
# ╟─8688aaa8-0fab-11eb-01bf-91a51597e7aa
# ╟─0587c8a2-0fac-11eb-12ea-0fd0ca6e4c4f
# ╟─50cda3cc-0fac-11eb-2a02-ebba6efe5967
# ╟─cc960750-0fad-11eb-25b5-49b1c1ff61e5
# ╠═ef9564e6-0fae-11eb-0fc6-d93ee30c9979
# ╠═b5f3fa36-0fb0-11eb-0f01-bda1cd65a2ef
