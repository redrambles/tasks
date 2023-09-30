require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(),
      Task.create!()
    ])
  end

  # it "renders a list of tasks" do
  #   render
  #   cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  # end
end
