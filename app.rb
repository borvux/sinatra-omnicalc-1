require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  # @number = params.fetch("number").to_f
  @number = params[:number].to_f
  @square = @number ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params[:number].to_f
  @square = Math.sqrt(@number)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  apr = params[:apr].to_f
  @years = params[:years].to_i
  principal = params[:principal].to_f

  r = ( apr/100 ) / 12
  n = @years * 12

  numerator = r * principal
  denominator = 1 - ( ( 1 + r ) ** -n )

  payment = numerator / denominator

  @apr = apr.to_fs(:percentage, {:precision => 4})
  @principal = principal.to_fs(:currency)
  @payment = payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params[:min].to_f
  @max = params[:max].to_f
  @random_number = rand(@min..@max)

  erb(:random_results)
end
