module ClientesHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(cliente)
    gravatar_id = Digest::MD5::hexdigest(cliente.mail.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: cliente.nome, class: "gravatar")
  end

end
