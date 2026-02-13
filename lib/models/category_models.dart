class CategoryModels{
  String id;
  String label;
  String image;

  CategoryModels({required this.id,required this.label,required this.image});

 static List<CategoryModels> getCategory(){
    return[
      CategoryModels(id: "general", label: "General", image: "general"),
      CategoryModels(id: "business", label: "Business", image: "business"),
      CategoryModels(id: "entertainment", label: "Entertainment", image: "entertainment"),
      CategoryModels(id: "health", label: "Health", image: "health"),
      CategoryModels(id: "science", label: "Science", image: "science"),
      CategoryModels(id: "technology", label: "Technology", image: "technology"),
      CategoryModels(id: "sport", label: "Sports", image: "sport"),

    ];
  }
}