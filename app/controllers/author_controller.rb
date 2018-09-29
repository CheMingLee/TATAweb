class AuthorController < ApplicationController
  layout "author"
  before_action :authenticate_author!
  skip_before_filter :verify_authenticity_token
end
