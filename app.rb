#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "pizzashop.db"}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products=Product.all
	erb :index
end

post '/cart' do
	@orders=[]

	products=params['orders'].split(';')
	products.each do |str|
		@orders << str.split('=')
	end

	@hh={
		'product_1'=>'Гавайская пицца',
		'product_2'=>'Пеперонни пицца',
		'product_3'=>'Овощная пицца'
	}

	erb :cart
end

post '/order' do
	erb 'Заказ принят!'
end
