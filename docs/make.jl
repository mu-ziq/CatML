using Documenter, CatML

makedocs()

# using Documenter
# using Literate

# const literate_dir = joinpath(@__DIR__, "literate")
# const generated_dir = joinpath(@__DIR__, "src", "generated")

# @info "Loading Catlab.jl"
# using Catlab,
#   # Must explicitly load all submodules for which docs are needed.
#   Catlab.Theories, Catlab.CategoricalAlgebra, Catlab.WiringDiagrams,
#   Catlab.Graphics, Catlab.Programs, Catlab.LinearAlgebra

# @info "Building Literate.jl docs"

# # XXX: Work around old LaTeX distribution in GitHub CI.
# if haskey(ENV, "GITHUB_ACTIONS")
#     import TikzPictures
#     TikzPictures.standaloneWorkaround(true)
# end

# # Set Literate.jl config if not being compiled on recognized service.
# config = Dict{String,String}()
# if !(haskey(ENV, "GITHUB_ACTIONS") || haskey(ENV, "GITLAB_CI"))
#     config["nbviewer_root_url"] = "https://nbviewer.jupyter.org/github/mu-ziq/cat-ml/blob/gh-pages/dev"
#     config["repo_root_url"] = "https://github.com/mu-ziq/cat-ml/blob/master/docs"
# end

# for (root, dirs, files) in walkdir(literate_dir)
#     out_dir = joinpath(generated_dir, relpath(root, literate_dir))
#     for file in files
#         if last(splitext(file)) == ".jl"
#             Literate.markdown(joinpath(root, file), out_dir;
#         config=config, documenter=true, credit=false)
#             Literate.notebook(joinpath(root, file), out_dir;
#         execute=true, documenter=true, credit=false)
#         end
#     end
# end

# @info "Building Documenter.jl docs"
# makedocs(
#   modules=[Catlab],
#   format=Documenter.HTML(),
#   sitename="CatML",
#   doctest=false,
#   checkdocs=:none,
#   pages=Any[
#     "Catlab.jl" => "index.md",
#     "Vignettes" => Any[
#       "generated/composejl_wiring_diagrams.md",
#     ],
#   ]
# )

# @info "Deploying docs"
# deploydocs(
#   target="build",
#   repo="github.com/mu-ziq/CatML.git",
#   branch="gh-pages"
# )
