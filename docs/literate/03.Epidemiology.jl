### A Pluto.jl notebook ###
# v0.12.3

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
md"# Epidemiology

![Electronic Circuit](./images/kim.gif)
"

# ╔═╡ Cell order:
# ╟─b164563c-0e54-11eb-0a14-21775ffefaf1
# ╟─f1652868-0e4f-11eb-09e5-7b23b575cb71
