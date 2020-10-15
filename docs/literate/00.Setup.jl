### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ f5daf58a-0ee0-11eb-346d-bb1b9ede8d08
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
	import TikzPictures
	
	# disciplined convex programming
	Pkg.add("Convex") 
	import Convex
	
	# splitting cone solver
	Pkg.add("SCS")
	import SCS
end

# ╔═╡ beea61b4-0ee0-11eb-032d-57c89ef12c7b
md"# Pluto.jl

[Watch this](https://youtu.be/IAF8DjrQSSk)
"

# ╔═╡ c68317f8-0ee1-11eb-1aaf-2dd3027b5ce8
md"
## Setup

### Get Julia 

#### macOS

```bash
brew install julia
```

#### Ubuntu

```bash
sudo apt install julia
```
"

# ╔═╡ db77b998-0ee1-11eb-2cf6-a74e9cc5c922
md"### Get Julia VS Code Extension

[Julia Extension](https://www.julia-vscode.org/)

```
code --install-extension julialang.language-julia
```
"

# ╔═╡ e8f0440a-0ee1-11eb-1baa-4556ed74160c
md"### Get LaTeX

#### macOS

```bash
brew install mactex
```

#### Ubuntu

```bash
sudo apt install texlive-full
```
"

# ╔═╡ 91c64008-0eeb-11eb-39d8-93d931c759f0
md"### Get Graphviz

#### macOS

```bash
brew install graphviz
```

#### Ubuntu

```bash
sudo apt install graphviz
```
"

# ╔═╡ f32be208-0ee1-11eb-2558-b11510ea48ce
md"
### Get Pluto

- [🎈 How to install Julia & Pluto (6 min) 🎈](https://www.youtube.com/watch?v=OOjKEgbt8AI)
- [Install docs](https://github.com/fonsp/Pluto.jl#installation)

tl;dr

```bash
julia> ]
(v1.5) pkg> add Pluto
julia> import Pluto
julia> Pluto.run()
```
"

# ╔═╡ fea6cc7e-0ee1-11eb-2c00-756017eda880
md"## Making (GitHub) Notebooks - Opinionated Tips"

# ╔═╡ 20821772-0ee2-11eb-2cbf-e7ddc4baa357
md"### Create and save notebooks from the main Pluto UI
- Create a folder in git project to manage docs, e.g., `/my-proj/docs/literate`
- Files are stored as `.jl`, which allows them to be treated as standalone Julia code
"

# ╔═╡ 1445187e-0ee2-11eb-3e6c-b1fc8cdf9179
md"
### Working in notebooks
- Use an initial cell that loads a [clean environment](https://github.com/fonsp/Pluto.jl/issues/142):
"

# ╔═╡ 7eea33dc-0ee0-11eb-2b1d-ddb7cbccaa87
md"### Export HTML and PDF
- Save output files to `/my-proj/docs/dist/` from the Pluto UI
"

# ╔═╡ a778c510-0ee1-11eb-304a-09bab847ac2b
md"### Deploy Notebook to GitHub Pages
- Create a folder `/my-proj/docs/gh-deploy` so you can [deploy a static website to GitHub (gh-pages)](https://codingshiksha.com/tutorials/how-to-deploy-static-website-or-apps-to-github-pages-using-gh-pages-in-2020-full-tutorial-for-beginners/)

- From within `gh-deploy`, run the script: `npm run depoy` and this will make whatever is in `gh-deploy/dist` your new GitHub site
"

# ╔═╡ 7535159a-0ee1-11eb-1579-d1e91acb4b4e
md"## TODO
- [ ] Research [Documenter.jl](https://juliadocs.github.io/Documenter.jl/stable/) and [Weave.jl](https://github.com/JunoLab/Weave.jl) for a better way to convert, assemble, and deploy documentation
"

# ╔═╡ Cell order:
# ╟─beea61b4-0ee0-11eb-032d-57c89ef12c7b
# ╟─c68317f8-0ee1-11eb-1aaf-2dd3027b5ce8
# ╟─db77b998-0ee1-11eb-2cf6-a74e9cc5c922
# ╟─e8f0440a-0ee1-11eb-1baa-4556ed74160c
# ╟─91c64008-0eeb-11eb-39d8-93d931c759f0
# ╟─f32be208-0ee1-11eb-2558-b11510ea48ce
# ╟─fea6cc7e-0ee1-11eb-2c00-756017eda880
# ╟─20821772-0ee2-11eb-2cbf-e7ddc4baa357
# ╟─1445187e-0ee2-11eb-3e6c-b1fc8cdf9179
# ╠═f5daf58a-0ee0-11eb-346d-bb1b9ede8d08
# ╟─7eea33dc-0ee0-11eb-2b1d-ddb7cbccaa87
# ╟─a778c510-0ee1-11eb-304a-09bab847ac2b
# ╟─7535159a-0ee1-11eb-1579-d1e91acb4b4e
