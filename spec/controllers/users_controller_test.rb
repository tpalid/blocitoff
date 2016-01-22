require 'rails_helper'

describe UserController do
    
    create!(:user)
    create!(:user_with_items)
    
    describe 'GET show'