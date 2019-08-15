# require "faraday"
# require "faraday_middleware"
class PropertiesController < ApplicationController
	before_action :authenticate_person!, except: [:index, :show]
	# before_action  :set_property,  only: [:index, :show]
	
	def index 
		@properties = Property.all 

		# render json: @properties, status: :ok
	end

	def show
		@property = Property.find(params[:id])

		# render json: @property
	end

	def new
		@property = current_person.properties.build
	end

	def edit
		@property = Property.find(params[:id])
	end

	def create
		# response = @connx.post do |reqq|
		# 	reqq.url '/pay/realest'
		# 	reqq.headers['Content-type'] = 'application/json'
		# 	reqq.body = {
		# 		"email" : current_person.email.build,
		# 		"amount" : property_params[:amount] * 100,
				
		# 	}
		# end
		@property = current_person.properties.build(property_params)

		if @property.save
			redirect_to @property

		else
			render 'new'
			
		end
	end

	def update
		@property = Property.find(params[:id])

		if @property.update(property_params)
			redirect_to @property
		else
			render 'edit'
		end
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy

		redirect_to properties_path
	end

	private


	# def set_connx
	# 	@connx = Faraday.new(url: "https://www.paystack.com") do |far|oauth2
	# 		# far.request :oauth2, "1566147206931699|2HWx3cStlcUtFQEqOimUgHvRjyA"
	# 		far.request :json
	# 		far.response :json
	# 		far.adapter :Faraday.default_adapter
	# 		end
	# end

	def property_params
		# params[:spend] = 10/7 * params[:price]
		params.require(:property).permit(:name, :place, :purchaseOrder, :Description, :visual, :currency, :price, :spend, :accountNumber, :contactNumber, piece: [])
		# :spend = :price * 10/7
	end

	# def set_property
	# 	@property  = Property.find(params[:id])
		
	# end

	# def upload
	# 	uploaded_io = params[:property][:view]
	# 	File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), "wb") do |file|  
	# 		file.write(uploaded_io.read)
	# 	end
	# end


end
