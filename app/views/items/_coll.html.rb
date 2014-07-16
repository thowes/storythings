<% if item.is_a_box %>
<li>COLL <b><%= link_to item.name, item %></b>, <%= link_to 'Edit', edit_item_path(item) %></li>
<% end %>