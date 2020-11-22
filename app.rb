#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
		validates :name, presence: true
		validates :phone, presence: true
		validates :address, presence: true
		validates :product_list, presence: true
end

get '/' do
	@products=Product.all
	erb :index
end

post '/cart' do
	$order_items=[]

	cart_list=params['orders'].split(';')
	cart_list.each do |str|
		arr=str.split('=')
		arr[0]=(arr[0].split('_'))[1]
		$order_items << arr
	end

	if $order_items.length==0
		return erb :cart_is_empty
	end

	@order=Order.new

	$product_list=''
	$order_items.each do |arr|
		arr[0]=Product.find(arr[0])
		$product_list+=arr[0].id.to_s+'='+arr[1]+';'
	end

	erb :cart
end

post '/order' do
	@order=Order.new params[:order]
	if @order.save
		erb :order
	else
		@error=@order.errors.full_messages.first
		erb :cart
	end
end

get '/all_orders' do
	@all_orders=Order.all
	erb :all_orders
end
