class PostsController < ApplicationController
  before_action :this_post, only: [:show, :edit, :update, :destroy, :vote_up, :vote_down]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html, :json

  def index
    @posts = Post.all.order('created_at DESC')

    if user_signed_in?
      new()
    end
  end

  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    # @my_ip = Socket.ip_address_list.detect(&:ipv4_private?).try(:ip_address)
    db = MaxMindDB.new("#{Rails.root}/public/GeoLite2-City.mmdb")
    current_ip = '210.146.64.142' # this is static TODO: make it dynamic with request.remote_ip
    ret = db.lookup(current_ip)
    lat = ret.location.latitude
    lon = ret.location.longitude

    #this might be useful in the future...
    # ret.found? # => true
    # ret.country.name # => 'United States'
    # ret.country.name('zh-CN') # => '美国'
    # ret.country.iso_code # => 'US'
    # ret.city.name(:fr) # => 'Mountain View'

    #also check out the local_ip() located in app/contollers/application.rb

    if (params[:longitude] == nil) || (params[:latitude] == nil)
      @post[:longitude] = lon
      @post[:latitude] = lat
    end
    respond_modal_with @post
    # TODO: the modal is not getting coordinates - probably js issue to be fixed later...
  end

  # def edit
  # end

  def create
    @post = current_user.posts.build(post_params)
    # @post[:coordinates] = [params[:longitude], params[:latitude]]
    if @post.save!
      respond_to do |format|
        format.html { redirect_to :back, :notice => "New Post created!!!" }
        format.js
      end
    else
      redirect_to request.referrer, :alert => @post.errors.full_messages[0] #message defined in the model file
    end
  end

  # def update
  # end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def unvote
    current_user.unvote(this_post)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def vote_up
    # @post = Post.find(params[:id])
    current_user.vote(this_post, :up)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def vote_down
    # @post = Post.find(params[:id])
    current_user.vote(this_post, :down)

    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def this_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :post_image, :longitude, :latitude)
  end
end
