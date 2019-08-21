
[1mFrom:[0m /home/vagrant/www/rails_tutorial/app/controllers/blogs_controller.rb @ line 37 BlogsController#show:

    [1;34m31[0m: [32mdef[0m [1;34mshow[0m
    [1;34m32[0m:   @blog = [1;34;4mBlog[0m.includes([33m:user[0m).find(params[[33m:id[0m])
    [1;34m33[0m:   @comments = [1;34;4mComment[0m.where([35mblog_id[0m: @blog.id).includes([33m:user[0m).page(params[[33m:page[0m]).per([1;34m5[0m).order([35mcreated_at[0m: [31m[1;31m"[0m[31mdesc[1;31m"[0m[31m[0m)
    [1;34m34[0m:   @comment = [1;34;4mComment[0m.new
    [1;34m35[0m:   [1;34m# session[:search] = params[:q][0m
    [1;34m36[0m:   binding.pry
 => [1;34m37[0m: [32mend[0m

