class RssResource {
  String id, name;
  String startDescriptionRegrex, endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;

  RssResource(
      {required this.id,
      required this.name,
      required this.startDescriptionRegrex,
      required this.endDescriptionRegrex,
      required this.startImageRegrex,
      required this.endImageRegrex,
      required this.resourceHeaders});
}

List<RssResource> rssResources = [
  RssResource(
      id: "vnexpress",
      name: "VN Express",
      startDescriptionRegrex: "</a></br>",
      endDescriptionRegrex: "",
      startImageRegrex: '<img src="',
      endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ": "https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Tin tức mới nhất": "https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới": "https://vnexpress.net/rss/the-gioi.rss",
        "Giáo dục": "https://vnexpress.net/rss/giao-duc.rss",
        "Giải trí": "https://vnexpress.net/rss/giai-tri.rss",
        "Thể thao": "https://vnexpress.net/rss/the-thao.rss",
        "Tâm sự": "https://vnexpress.net/rss/tam-su.rss",
        "Kinh doanh": "https://vnexpress.net/rss/kinh-doanh.rss",
        "Xe": "https://vnexpress.net/rss/oto-xe-may.rss",
        "Cười": "https://vnexpress.net/rss/cuoi.rss",
      }),
  RssResource(
      id: "tuoi_tre",
      name: "Tuổi trẻ",
      startDescriptionRegrex: "</a></br>",
      endDescriptionRegrex: "",
      startImageRegrex: '<img src="',
      endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ": "https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Tin tức mới nhất": "https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới": "https://vnexpress.net/rss/the-gioi.rss",
        "Giáo dục": "https://vnexpress.net/rss/giao-duc.rss",
        "Giải trí": "https://vnexpress.net/rss/giai-tri.rss",
        "Thể thao": "https://vnexpress.net/rss/the-thao.rss",
        "Tâm sự": "https://vnexpress.net/rss/tam-su.rss",
        "Kinh doanh": "https://vnexpress.net/rss/kinh-doanh.rss",
        "Xe": "https://vnexpress.net/rss/oto-xe-may.rss",
        "Cười": "https://vnexpress.net/rss/cuoi.rss",
      })
];
