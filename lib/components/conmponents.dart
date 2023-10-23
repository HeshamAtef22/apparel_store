



import 'package:flutter/material.dart';

//هعمل ديفولت بوتن للاب كله وهمرر الخواص عن طريق الكونستراكتور
class DefaultButton extends StatelessWidget {
  //الديفولت للعرض هو دابل انفنتي لو مدخلتش ليه ويدث عند الاستدعاء
  double width = double.infinity;
//اللون الديفولت للبوتن لو مدخلتش لون
  Color background = const  Color.fromRGBO(107, 111, 234, 100);
  //فانكشن همرره مكان الفانكشن اون بريسد
  dynamic function;
  String? text;
  double radius=100;
  bool isUpperCase = true;

  DefaultButton({
    this.width = double.infinity,
    this.background =const Color.fromRGBO(107, 111, 234, 100)  ,
    required this.function,
    @required this.text,
    this.radius=10,
    this.isUpperCase = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      minWidth: width,
      color: background,
      elevation: 10,
      height: 60,
      onPressed: function,
      child: Text( isUpperCase ?
      text!.toUpperCase():text!,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );;
  }
}

//Create class Card contain image and title and 2 icon and price and 2 icon buttom
class cardOfProduct extends StatefulWidget {
  final String imagetext;
  final String title;
  final String price;

  const cardOfProduct({
    Key? key,
    required this.imagetext,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<cardOfProduct> createState() => _cardOfProductState();
}
int counter = 1;
class _cardOfProductState extends State<cardOfProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white38,
      padding: EdgeInsets.all(5),
      height: 150,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            //image in card
            Image.asset(widget.imagetext),
            SizedBox(width: 5),
            // ثاني جزي في الكارد وهو عبارة عن كولوم فيه العنوان والسعر اسفل منه
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title),
                  Text(
                    widget.price,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Spacer(),
            //ثالث جزء من الكارد عبارة عن 2 ايقون بوتن ف الاعلي وفي الاسفل 2بوتن وكونتينر لزيادة عدد
            //العنصر المشتري او تقليله
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //الجزء الخاص باليقونات
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(Icons.favorite, color: Colors.red)),
                      SizedBox(width: 10),
                      InkWell(onTap: () {}, child: Icon(Icons.delete)),
                    ],
                  ),
                  //الجزء الخاص بعدد القطع والتحكم فيها بزيادة او نقص
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.remove),
                          onTap: () {
                            setState(() {
                              if (counter <= 1) {
                                counter == 1;
                              } else {
                                counter--;
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(width: .2)),
                        child: Center(child: Text("$counter")),
                        width: 25,
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            setState(() {
                              counter++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//defaultTextFormFiled
Widget defaultTextFormFiled ({
  required TextEditingController controller,
  required TextInputType keyboardtype,
  Function? onSubmit,
  Function? onChanged,
  //لو حصل مشكلة في نوع الفانكشن عند الكتابة اقف بالماوس علي الفانكشن اللي انت عايزها واطبع نوعها بالظبط في البراميتر
  required String? Function(String?)? validate,
  void Function(String?)? onSaved,
  required String label,
  required String hint,
  required IconData prefix,
  Widget? suffixicon,
  bool isPassword = false,
  int? maxLength,



})=>TextFormField(
  //controller لحفظ القيمة او الداتا داخل المتغير واقدر اكنترول عليها او استخدمها
  controller: controller,
  keyboardType: keyboardtype,
  //علشان استدعي الفانشكن من البراميتر لازم ااكده انه بيرجع داتا من نفس النوع
  onFieldSubmitted: onSubmit as void Function(String)?,
  onChanged: onChanged as void Function(String)?,
  onSaved: onSaved,
  //validator بيخزن التكست او الداتا اليي بيدخلها المستخدم في المتغير فاليو اللي هو المتغير الخاص بالفانكشن بتاعته
  //ليه مزايا كتير منها انه لو المستخدم مدخلش داتا في البورد يقدر يظهرله رسالة ان الحقل فارغ
  //او مثلا حددتله نوع داتا ودخل عكسها او عدد حروف اكبر هنا الفاليديتور بيظهر رسالة للمستخدم بالخطأ اللي بيعمله
  //تابع الكود علشان تعرف الاستخدام
  validator: validate,
  obscureText: isPassword,

  maxLength: maxLength,
  decoration:  InputDecoration(
    alignLabelWithHint: true,
    border: OutlineInputBorder(),
    labelText: label,
    hintText: hint,
    prefixIcon: Icon(prefix),
    //  suffix: suffix,
    suffixIcon: suffixicon,
  ),


);






//CircleContaner botton
Widget circleContainerBotton({required Widget child,void Function()? onTap})=>GestureDetector(
  onTap: onTap,
  child:   Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(
        color: Color.fromRGBO(107, 111, 234, 100), //New
        blurRadius: 35.0,
        offset: Offset(0,15),
      ),],
      borderRadius: BorderRadius.circular(100),
    ),
    child: child,
  ),
);




Color ColorTheme()=>Color.fromRGBO(107, 111, 234, 1);




//هعمل كلاس للسيرش ديلجيت علشان امرره في السيرش بوكس
class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //buildActions دي ليست بتحتوي علي ويدجيت ودا نفس الاكشن الموجود في الاب بار
    //فدا الاكشن او الجزئ الايمن من البوكس الخاص بالسيرش لما افتحه او اضغط عليه
    return [Icon(Icons.close)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //buildLeading دا نفس الليدنج اللي موجود بالاب بار بس هنا هيكون للبوكس الخاص بالسيرش واللي بيكون من نوع ويدجيت
    return IconButton(
        onPressed: () {
          //close فانكشن بيلد ان جاهز داخل السيرش ديليجيت ومهمته انه يقفل السيرش او يخرج منه
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //buildResults الخاصة بنتيجة البحث
    return Text("Prodact");
  }

  //buildSuggestions الاقتراحات اللي بتكون مكتوبة تحت البوكس سيرش علشان تقترح علي اليوزر كلمات معينة تقدر تساعده في السيرش
  //زي ما بتعمل سيرش في الفيس او تويتر او يوتيوب او غيره
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        child: ListView(children: [
          ...List.generate(40, (index) {
            return Text("product ${index}");
          }),
        ]));
  }
}



//CustomWidget for slider Banner
class SliderBanner extends StatelessWidget {
  String imagetext;
  Color containercolor;
  String title;
  int itemKey;


  SliderBanner({super.key,
    required this.imagetext,
    required this.containercolor,
    required this.title,
    required this.itemKey,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: containercolor,
              )),
          Image.asset(
            imagetext,
            height: 230,
          ),
          Positioned(
            height: 140,
            width: 290,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String? productName;
    bool? isFavorite;
    String? description;
 bool? showdetails = true;
  final double? price;

   ProductCard({
    Key? key,
    required this.imageUrl,
     this.productName,
    required this.isFavorite,
     this.price,
     this.description,
     this.showdetails ,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {


  @override
  Widget build(BuildContext context) {
    return Container(

      //width: MediaQuery.of(context).size.width * .42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(widget.imageUrl,fit:BoxFit.cover,height: 200,width: double.infinity,)),
              Positioned(
               right: 10,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(widget.isFavorite! ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite!;
                      });
                    },
                  ),
                ),
              )
            ]
          ),
           if(widget.showdetails == true)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productName.toString(),maxLines: 2, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 3,),
                Text("Rs.${widget.price}",),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



//widget for sale Banner
class SaleBanner extends StatelessWidget {
  Color backgroundcolor;
  String title;
  String subtitle;

   SaleBanner({super.key,required this.backgroundcolor,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .10, vertical: 20),
      width: double.infinity,
      height: 150,

      decoration:  BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),),
            SizedBox(height: 5),
            Text(subtitle,style: TextStyle(
              color: Color.lerp(Colors.yellow, Colors.red, 0.1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 15),
            Text("Terms & Conditions apply*",style: TextStyle(
              color: Colors.white,
              fontSize: 10,

            ),),
          ]
      ),
    );
  }
}



//container Categorie Element
class CategoriesElement extends StatelessWidget {
  String imageurl;
  String title;

  CategoriesElement({super.key,required this.imageurl,required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 170,
      height: 170,
      child: Card(
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.all(20),
          //t-shirt icon
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(imageurl,width: 70,height: 70,),
          ),

          subtitle: Text(title,textAlign: TextAlign.center,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),),

        ),
      ),
    );
  }
}


//favourite Product cart
class CartElement extends StatelessWidget {
  String imageUrl;
  String price;
  String title;


  CartElement({super.key,required this.imageUrl,required this.price,required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,

            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  //image
                  SizedBox(
                    height: 170,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  //details and price and rating
                  Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        width: 125,
                        child: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis),),
                      SizedBox(height: 10),
                      Text(price,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black54),),
                      SizedBox(height: 10),
                      Row(
                          children: [
                            Text("4.5/5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ColorTheme()),),
                            SizedBox(width: 5),
                            Icon(Icons.star,color: ColorTheme(),),
                          ]
                      ),





                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: IconButton(onPressed: (){}, icon:Icon(Icons.delete_outline) ),
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}


//Card of Product Cart

class CardOfProduct extends StatelessWidget {
  String imageUrl;
  String price;
  String title;



  CardOfProduct({super.key,required this.imageUrl,required this.price,required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,

            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  //image
                  SizedBox(
                    height: 170,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  //details and price and rating
                  Column(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        width: 125,
                        child: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis),),
                      SizedBox(height: 10),
                      Text(price,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black54),),
                      SizedBox(height: 10),
                      Row(
                          children: [
                            Text("4.5/5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ColorTheme()),),
                            SizedBox(width: 5),
                            Icon(Icons.star,color: ColorTheme(),),
                          ]
                      ),



                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.add_circle_outline),
                            Container(child: Center(child: Text("1")),width: 20,),
                            Icon(Icons.remove_circle_outline),
                          ],),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: IconButton(onPressed: (){}, icon:Icon(Icons.delete_outline) ),
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}







