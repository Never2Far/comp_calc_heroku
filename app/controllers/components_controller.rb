class ComponentsController < ApplicationController



    def index
        user = User.find_by(id: params[:user_id])
        comps = user.components
        render json: ComponentSerializer.new(comps).serializable_hash.to_json
    end

    def create
        comp = Component.new
        comp.name = params[:name]
        comp.value = params[:value]
        comp.band_count = params[:band_count]
        comp.base_unit = params[:base_unit]
        comp.value_display = params[:value_display]
        comp.color_code = params[:color_code]
        comp.user_id = params[:user_id]

        comp.save!

        render json: ComponentSerializer.new(comp).serializable_hash.to_json

    end

    def destroy
        comp = Component.find_by(id: params[:id])


        if comp.destroy
            render json:  {result: true}
        else
            render json:  {result: false}
        end

        

    end

    def destroy_all
        user = User.find_by(id: params[:user_id])

        if user.components.destroy_all
            render json:  {result: true}
        else
            render json:  {result: false}
        end

    end
    # create_table "components", force: :cascade do |t|
    #     t.string "name"
    #     t.float "value"
    #     t.integer "band_count"
    #     t.string "color_code"
    #     t.string "base_unit"
    #     t.string "value_display"



    # this.name = name;
    # this.digit1 = digit1;
    # this.digit2 = digit2;
    # this.digit3 = digit3; 
    # this.multiplier = multiplier;
    # this.tolerance = tolerance;
    # this.tempCoef = tempCoef;
    # value: compObj.value(),
    # bandCount: compObj.bandCount,
    # colorCode: compObj.colorCode.toString()




end
