class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
    end

    def angular
        @angular_portfolio_items = Portfolio.angular
    end

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio.save
            format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    def edit
        @portfolio = Portfolio.find(params[:id])
    end

    def update
        @portfolio = Portfolio.find(params[:id])

        respond_to do |format|
          if @portfolio.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfolios_path, notice: "portfolio was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
    end

    def show
        @portfolio = Portfolio.find(params[:id])
    end

    def destroy
      @portfolio = Portfolio.find(params[:id])

      @portfolio.destroy
  
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
      end
    end
end
