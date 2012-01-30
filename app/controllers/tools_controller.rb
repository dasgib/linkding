class ToolsController < ApplicationController
  def bookmarklet
    render "tools/bookmarklet.js", layout: false
  end
end