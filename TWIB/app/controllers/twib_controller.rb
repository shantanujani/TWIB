class TwibController < ApplicationController

skip_before_filter :signed_in_user, :only => [:index]
skip_before_filter :correct_user, :only => [:index]

def index

end

end
