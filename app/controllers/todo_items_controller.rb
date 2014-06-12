class TodoItemsController < ApplicationController
  respond_to :json

  def create
    respond_with TodoItem.create(todo_item_params)
  end

  def update
    todo_item.update_attributes(todo_item_params)
    respond_with todo_item
  end

  private

  def todo_item_params
    params.permit(:title, :complete)
  end
end
