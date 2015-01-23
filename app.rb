require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({ :dbname => "hair_salon" })

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  stylist = Stylist.new({ :id => nil,
    :first_name => first_name, :last_name => last_name })
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end
