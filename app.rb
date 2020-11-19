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
	$orders=[]

	products=params['orders'].split(';')
	products.each do |str|
		$orders << str.split('=')
	end

	$hh={
		'product_1'=>'Гавайская пицца',
		'product_2'=>'Пеперонни пицца',
		'product_3'=>'Овощная пицца'
	}

	@order=Order.new

	$product_list=''
	$orders.each do |arr|
		$product_list+=($hh[arr[0]]+'='+arr[1]+';')
	end

	erb :cart
end

post '/order' do
	@order=Order.new params[:order]
	if @order.save
		erb "<h2>Ваш заказ принят!</h2>"
	else
		@error=@order.errors.full_messages.first
		erb :cart
	end
end
