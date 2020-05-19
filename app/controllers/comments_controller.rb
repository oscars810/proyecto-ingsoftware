class CommentsController < ApplicationController
  # Create
  def new
    if current_user
      @comentario = Comment.new
      @id_local = params[:id]
    else
      redirect_to root_path, notice: 'Debes Iniciar Sesión para comentar'
    end
  end

  def create
    comentario_params = params.require(:comment).permit(:idlocal, :contenido)
    id_usuario = current_user.id
    comentario_params[:idusuario] = id_usuario

    contenido = comentario_params[:contenido]
    id_local = comentario_params[:idlocal]
    unless contenido.empty?
      @comentario = Comment.create(comentario_params)
      if @comentario.save
        redirect_to local_path(id_local), notice: 'Comentario agregado con éxito'
      else
        redirect_to local_path(id_local), notice: 'Ocurrió un error al crear el Comentario'
      end
    else
      redirect_to local_path(id_local), notice: 'No puedes agregar comentarios vacíos'
    end

  end

  # Read
  def index
    @comentarios = Comment.all
  end

  def destroy
    @comentario = Comment.find(params[:id_comentario])
    @comentario.destroy
    redirect_back(fallback_location: root_path, notice: 'Comentario eliminado con éxito')
  end
end
