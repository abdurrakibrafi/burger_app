class PaymentModel {
  final String name;
  final String imgUrl;
  


  PaymentModel({
    required this.name,
    required this.imgUrl,
   
  });
  PaymentModel copyWith({
    String? name,
    String? imgUrl,
   
  }){
    return PaymentModel(
      name: name ?? this.name,
       imgUrl:imgUrl ?? this.imgUrl,
     
    );
  }

}