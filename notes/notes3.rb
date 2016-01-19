layouts/application.html.erb
  render partial: 'shared/flashes'
  
shared/_flashes.html.erb
  <div class="flashes">
    <% if flash[:notice] %>
      <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <%= flash[:notice] %>
      </div>
    <% elsif flash[:error] %>
      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <%= flash[:error] %>
      </div>
    <% elsif flash[:alert] %>
      <div class="alert alert-warning">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <%= flash[:alert] %>
      </div>
    <% end %>
  </div>


shared/_flashes.js.erb
  $('.flashes').replaceWith(<%= render partial: 'shared/flashes' %>)
  
  
destroy.js.erb
  <%= render partial: 'shared/flashes' %>
  
  <!--<%= render partial: 'shared/flashes', formats: [:js] %>-->