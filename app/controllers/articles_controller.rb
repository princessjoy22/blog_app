class ArticlesController < ApplicationController # Articles plural
    def index
        @articles = Article.all.order :id #method chain
        # render :index # convention over configuration no need to render explicitly if ffg. the ruby convention
    end

    def show
        @article = Article.find(params[:id])     
    end

    def new
        # @article = Article.new
    end

    def create
        #binding.break
        @article = Article.new(article_params)
        # @article.title = params[:title]
        # @article.body = params[:body]
        # @article.writer_name = params[:writer_name]

        if @article.save 
            redirect_to articles_path
        else
            render :new
        end
    end

    def edit
         @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to article_path(@article)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path, notice: 'Article was successfully deleted.'
    end 

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end

    
end
