<h1>Job Employment list</h1>

<table>
  <tr>
    <th>Username</th>
    <th>Title</th>
    <th>Job</th>
  </tr>
  <tr>
    <% @employments.each do |application| %>
    <td><%= employment.job.user.name %></td>
    <td><%= employment.job.title %></td>
  </tr>
<% end %>
</table>

  <%= link_to 'Back', jobs_path %>