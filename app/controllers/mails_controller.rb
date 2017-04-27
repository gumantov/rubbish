class MailsController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]


  # GET /mails
  # GET /mails.json
  def index
    @mails = Mail.all
    @companies = Company.all
  end

  # GET /mails/1
  # GET /mails/1.json
  def show
  end

  # GET /mails/new
  def new
    @mail = Mail.new
    @company = Company.new
    @companies = Company.all
  end

  # GET /mails/1/edit
  def edit
    @companies = Company.all
  end

  # POST /mails
  # POST /mails.json
  def create
    #from params find of create the company by company name
    @company = Company.find_or_create_by(name: mail_params[:company])
    #@company.mails.new(size: mail_params[:size])
    @mail = @company.mails.new(size: mail_params[:size], user_id: current_user.id)
    respond_to do |format|
      if @mail.save
        format.html { redirect_to @mail, notice: 'Mail was successfully created.' }
        format.json { render :show, status: :created, location: @mail }
      else
        format.html { render :new }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mails/1
  # PATCH/PUT /mails/1.json
  def update
    respond_to do |format|
      if @mail.update(mail_params)
        format.html { redirect_to @mail, notice: 'Mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail }
      else
        format.html { render :edit }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  def about
  end
  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail.destroy
    respond_to do |format|
      format.html { redirect_to mails_url, notice: 'Mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_params
      params.require(:mail).permit(:size, :company, :user_id)
    end
end
