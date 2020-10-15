### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ b164563c-0e54-11eb-0a14-21775ffefaf1
begin
	import Pkg
	Pkg.activate(mktempdir())
		
	# framework for applied and computational category theory
	Pkg.add("Catlab")
	using Catlab.GAT
	using Catlab.Theories
	using Catlab.Present	
	using Catlab.Programs	
	using Catlab.WiringDiagrams
	using Catlab.Graphics

	# create Tikz pictures
	Pkg.add("TikzPictures")
	import TikzPictures
	
	# disciplined convex programming
	Pkg.add("Convex") 
	import Convex
	
	# splitting cone solver
	Pkg.add("SCS")
	import SCS
end

# ╔═╡ f1652868-0e4f-11eb-09e5-7b23b575cb71
md"# Epidemiology"

# ╔═╡ ed5fd302-0ee6-11eb-018d-01d7c068d777
# Load images
begin
	struct Epidemiological_Cost_Model end
    struct Pandemic_Slide end
	struct City_Spread_Slide end
	struct SIR_Slide end
	struct Petri_Slide end
	struct Vectorfield_Slide end
	struct Solve_Slide end
	struct Present_Epidemiology_Slide end
	struct Decorated_Cospans_Slide end
	
	function Base.show(io::IO, ::MIME"image/svg+xml", x::Epidemiological_Cost_Model)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/epidemiology.svg")))
	end
	
	function Base.show(io::IO, ::MIME"image/png", x::Pandemic_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/pandemic.png")))
	end
	
	function Base.show(io::IO, ::MIME"image/png", x::City_Spread_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/city_spread.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::SIR_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/sir.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Petri_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/petri.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Vectorfield_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/vectorfield.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Solve_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/solve.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Present_Epidemiology_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/present_epidemiology.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Decorated_Cospans_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/decorated_cospans.png")))
	end
	
	nothing
end

# ╔═╡ 81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
Epidemiological_Cost_Model()

# ╔═╡ c6ebd4bc-0ef4-11eb-2abf-0730612e5588
Pandemic_Slide()

# ╔═╡ cd58373a-0ef4-11eb-2351-752dca43c16b
City_Spread_Slide()

# ╔═╡ 770f908c-0ef7-11eb-284a-b91cd8b20af8
SIR_Slide()

# ╔═╡ 7ccb446c-0ef7-11eb-16cc-b1bd31b8f9f9
Petri_Slide()

# ╔═╡ 9f9bfa40-0ef7-11eb-33dd-6bdbab8dfc4b
Vectorfield_Slide()

# ╔═╡ e65f9432-0ef7-11eb-3faa-d123d5ed8e78
Solve_Slide()

# ╔═╡ 4ec0c172-0ef8-11eb-3d67-59e67b7fbe44
Present_Epidemiology_Slide()

# ╔═╡ b4ad4924-0ef8-11eb-0094-293fd92bd904
Decorated_Cospans_Slide()

# ╔═╡ 237b12fa-0ef9-11eb-0e22-fd9aef87a347


# ╔═╡ 5c52dc02-0ef9-11eb-35c2-c755298f57e4


# ╔═╡ db4f2f68-0ef9-11eb-1163-6987ee6e0a52


# ╔═╡ Cell order:
# ╟─b164563c-0e54-11eb-0a14-21775ffefaf1
# ╟─f1652868-0e4f-11eb-09e5-7b23b575cb71
# ╠═ed5fd302-0ee6-11eb-018d-01d7c068d777
# ╠═81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
# ╠═c6ebd4bc-0ef4-11eb-2abf-0730612e5588
# ╠═cd58373a-0ef4-11eb-2351-752dca43c16b
# ╠═770f908c-0ef7-11eb-284a-b91cd8b20af8
# ╠═7ccb446c-0ef7-11eb-16cc-b1bd31b8f9f9
# ╠═9f9bfa40-0ef7-11eb-33dd-6bdbab8dfc4b
# ╠═e65f9432-0ef7-11eb-3faa-d123d5ed8e78
# ╠═4ec0c172-0ef8-11eb-3d67-59e67b7fbe44
# ╠═b4ad4924-0ef8-11eb-0094-293fd92bd904
# ╠═237b12fa-0ef9-11eb-0e22-fd9aef87a347
# ╠═5c52dc02-0ef9-11eb-35c2-c755298f57e4
# ╠═db4f2f68-0ef9-11eb-1163-6987ee6e0a52
