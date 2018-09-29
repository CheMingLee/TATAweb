class AuthorController < ApplicationController
  skip_before_filter :verify_authenticity_token
  layout "author"
  before_action :authenticate_author!
end
