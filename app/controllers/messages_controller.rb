class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  def sendMessage
    puts "This is in the sendMessage Controller function"
    account_sid = 'AC8c5be76854a889a1b26d9f48131671c8' 
    auth_token = '858986e9e7fe0396edac815d1d1fd911' 
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+19093783080" # Your Twilio number
     
    friends = {
    "+19098393097" => "Shawn",
    }
    # puts "value of num is " + params[:num]
    if params[:content] == "special"
      output = "I am having something very unusual and I have contacted police. Please help me ask for help! My address is Cole Student Activities Bldg, College Park, MD 20740. "
    else
      output = "I am at Cole Student Activities Bldg, College Park, MD 20740. I am feeling unsafe and please come ASAP!"
    end
    friends.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Hey #{value}, " + output
      )
      puts "Sent message to #{value}"
    end
    render :json => {}
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :phone_number, :address, :city, :state, :content)
    end
end
