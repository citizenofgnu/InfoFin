require 'rubygems'
require 'sinatra'
require 'mysql2'
require 'active_record'


connection = ActiveRecord::Base.establish_connection(:host => 'localhost',:username => 'root',:password => 'system$$786', :database => 'ites_students', :adapter => 'mysql2')

class Club < ActiveRecord::Base

end

get '/' do
  @title = 'Hello world  title'
  erb :index
end

post '/showProduct' do
 @product_no = params['product_no']
  @product_name = params['product_name']
c=Club.new
c.clubs = @product_name
c.save
=begin
  connection = Mysql2::Client.new( :host =>'localhost',:username => 'root',:password => 'system$$786', :database => 'ites_students' )
  @product_no = params['product_no']
  @product_name = params['product_name']
  connection.query("insert into clubs(clubs) values('#{@product_name}')")
  connection.close
=end

  erb :print
end
