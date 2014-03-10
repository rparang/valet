class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relationships }
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end

end
