module ItemsHelper
  # Returns the QR code for the given item url.
  def qrcode_for(item, options = { size: 50 })
    qrcode_id = item_url
    qrcode_size = options[:size]
    qrcode_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(qrcode_url, alt: item.name, class: "qrcode")
  end
end