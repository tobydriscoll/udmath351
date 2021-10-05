using CSV,DataFrames,JSON

df = CSV.File("flashcards.csv") |> DataFrame
# n = size(df,1)
# out = Array{Dict{String,String}}(undef,n)
# for i in 1:n 
#     out[i]["front"] = df.Front[i]
#     out[i]["back"] = df.Back[i]
# end
out = [ r[[:front,:back]] for r in eachrow(df) ]
open("flashcards.json","w") do io 
    JSON.print(io,out)
end

CSV.write("credits.csv",combine(groupby(df,:author),nrow))
