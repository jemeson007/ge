class PropertiesController < ApplicationController
	before_action :authenticate_person!, except: [:index, :show]
	# before_action  :set_property,  only: [:index, :show]
	
	def index 
		@properties = Property.all 
	end

	def show
		@property = Property.find(params[:id])
	end

	def new
		@property = current_person.properties.build
	end

	def edit
		@property = Property.find(params[:id])
	end

	def create
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

	def property_params
		# params[:spend] = 10/7 * params[:price]
		params.require(:property).permit(:name, :place, :visual, :price, :spend, :accountNumber, piece: [])
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
