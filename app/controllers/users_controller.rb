class UsersController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    if user.save
      self.current_user = user.id
      redirect_to home_path, notice: "Você está conectado."
    else
      logger.error %Q[Não conseguiu logar o usuário: #{user.inspect}
      Ocorreram os seguintes erros: #{user.errors.inspect}]
      redirect_to home_path, notice: "Falha ao conectar."
    end
  end

  def logout
    self.current_user = nil
    redirect_to home_path
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end
