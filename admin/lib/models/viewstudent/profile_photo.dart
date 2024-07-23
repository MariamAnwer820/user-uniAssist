class ProfilePhoto {
	String? url;
	dynamic publidId;

	ProfilePhoto({this.url, this.publidId});

	factory ProfilePhoto.fromJson(Map<String, dynamic> json) => ProfilePhoto(
				url: json['url'] as String?,
				publidId: json['publidId'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'url': url,
				'publidId': publidId,
			};
}
