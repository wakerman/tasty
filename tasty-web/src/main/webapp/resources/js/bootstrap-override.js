$(function() {
$('[data-toggle="tab"], [data-toggle="pill"]').bind("show", function(e) {
	var contentId = $(e.target).attr("data-target");
	var contentUrl = $(e.target).attr("href");
	var self = this;
	site.load(contentId, contentUrl, function() {
		$(self).tab();
	});
}).bind("shown", function(e) {
	location.hash = "_" + $(e.target).attr("data-target");
});

$('.nav-tabs, .nav-pills').each(function (idx, tabContainer) {
	var tabs = $(tabContainer).find('[data-toggle="tab"], [data-toggle="pill"]');
	if (tabs.size() > 0) {
		var target = tabs.first();
		if (location.hash.indexOf("#_#") == 0) {
			var hash = location.hash.substring(2);
			tabs.each(function (){
				var tab = $(this);
				if (tab.attr("data-target") == hash) {
					target = tab;
				}
			});
		}
		target.tab('show');
	}
});
});
