class MinersController < ApplicationController
  before_action :set_miner, only: [:show, :edit, :update, :destroy]

  # GET /miners
  # GET /miners.json
  def index
    @miners = Miner.all
    respond_to do |format|
	    format.html # index.html.haml
	    format.json {
		    @miners_json = @miners.map do |miner|
			    ActiveSupport::JSON.decode(miner.to_json(
	             :include => [
			          {
		              :profile => {
				              :methods => [:avatar_medium_url],
				              :except => [:public_key, :avatar_file_name, :avatar_file_size, :avatar_updated_at]
		              }
			          },{
			            :stat_sheet => {}
			          },{
			             :blocks => {}
			          }
	             ]
	         ))
		    end
		    ap @miners_json
		    render :json => @miners_json
	    }
    end
  end

  # GET /miners/1
  # GET /miners/1.json
  def show
  end

  # GET /miners/new
  def new
    @miner = Miner.new( profile: Profile.new, stat_sheet: StatSheet.new )
  end

  # GET /miners/1/edit
  def edit
  end

  # POST /miners
  # POST /miners.json
  def create
    @miner = Miner.new(miner_params)

    respond_to do |format|
      if @miner.save
        format.html { redirect_to @miner, notice: 'Miner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @miner }
      else
        format.html { render action: 'new' }
        format.json { render json: @miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miners/1
  # PATCH/PUT /miners/1.json
  def update
    respond_to do |format|
      if @miner.update(miner_params)
        format.html { redirect_to @miner, notice: 'Miner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @miner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miners/1
  # DELETE /miners/1.json
  def destroy
    @miner.destroy
    respond_to do |format|
      format.html { redirect_to miners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miner
      @miner = Miner.includes(:profile).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miner_params
      params.require(:miner).permit(
		      :id,
		      :email,
		      :profile_attributes => [ :nickname, :first_name, :last_name, :bio, :public_key, :reputation, :is_public, :avatar, :id ],
		      :blocks_attributes => [ :version, :hash_curr_block, :hash_prev_block, :rewarded_transaction_fee, :rewarded_bitcoins, :mined_at, :id, :_destroy ],
		      :stat_sheet_attributes => [ :blocks_mined, :time_between_blocks, :bitcoins_mined, :total_transaction_fees, :number_of_transactions, :id ]
      )
    end
end
