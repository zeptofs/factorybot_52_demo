# frozen_string_literal: true

require './setup'

# TODO: Add any application specific code necessary to reproduce the bug
class Post < ActiveRecord::Base
  has_one :ref, as: :target
  belongs_to :author, optional: true
end

class Ref < ActiveRecord::Base
  belongs_to :target, polymorphic: true, autosave: false
end

class Author < ActiveRecord::Base
  has_many :posts
end

# class FactoryBotTest < Minitest::Test
#   def test_factory_bot_stuff
#     po = FactoryBot.create :post
#     poa = FactoryBot.create :post, :approved
#
#     refute_nil po.ref
#     refute_nil poa.ref
#   end
# end
