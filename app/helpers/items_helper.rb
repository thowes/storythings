module ItemsHelper
  # Returns the QR code for the given item url.
  def qrcode_for(item, options = { size: 50 })
    qrcode_id = item_url
    qrcode_size = options[:size]
    qrcode_url = "https://chart.googleapis.com/chart?cht=qr&chl=#{qrcode_id}&chs=180x180&choe=UTF-8&chld=L|2"
    image_tag(qrcode_url, alt: item.name, class: "qrcode")
  end

  def nested_items(items)
    items.map do |item, sub_item|
      content_tag(:div, render(item), :class => "media")
    end.join.html_safe
  end
end