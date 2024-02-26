require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:_0square)
end

get("/square/new") do
  erb(:_0square)
end

get("/square/results") do
  @user_input = params.fetch("square_number").to_f
  @square = @user_input ** 2
  erb(:_0square_result)
end

get("/square_root/new") do
  erb(:_1square_root)
end

get("/square_root/results") do
  @user_input = params.fetch("square_root_number").to_f
  @square_root = Math.sqrt(@user_input)
  erb(:_1square_root_result)
end

get("/random/new") do
  erb(:_2random)
end

get("/random/results") do
  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f
  @random_number = rand(@user_min..@user_max)
  erb(:_2random_result)
end

get("/payment/new") do
  erb(:_3payment)
end

get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f
  @user_years = params.fetch("user_years").to_i
  @user_principal = params.fetch("user_principal").to_f

  @r = (@user_apr/100) / 12
  @n = @user_years * 12

  @numerator = @r * @user_principal
  @denominator = 1 - ((1 + @r) ** -@n)

  @payment = @numerator/@denominator

  @fromatted_apr = "#{"%.4f" % @user_apr}%"
  @fromatted_principal = "$#{"%.2f" % @user_principal}" 
  @formatted_payment = "$#{'%.2f' % @payment}"
  erb(:_3payment_result)
end
