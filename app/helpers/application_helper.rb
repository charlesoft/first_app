module ApplicationHelper
	def bootstrap_alert(type)
		html = <<-HTML
		<div class="alert #{type}">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			#{notice}
		</div>
		HTML
		html.html_safe
	end
end
