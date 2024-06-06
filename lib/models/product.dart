
import 'package:get/get.dart';

class Product {
  final int id;
  final String title, subTitle, image;
  final double kValue,pValue,nValue, channelValue ,fertilizerQuantity;
  final List<String> descriptions; // قائمة الأوصاف
//description,

  Product(
    {required this.id,
    required this.title,
    required this.subTitle,
   // required this.description,
    required this.descriptions,
    required this.image,
    required this.kValue,
    required this.pValue,
    required this.nValue,
    required this.channelValue,
    required this.fertilizerQuantity, 
    });

}


//list of product
List<Product> product = [
  Product(
    id:1,
    title: "wheat".tr,
    subTitle: "good wheat".tr,
    image: 'images/wheat.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/wheat.jpg?alt=media&token=8d5fbe6e-0023-4a3c-897a-ab095a99e259",
    descriptions: [
      "Wheat seeds should be planted at a depth ranging from 3 to 5 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, wheat seedlings are sown at a spacing of 15-20cm. (The plant-to-plant distance should be 15-20cm)",
      "The distance between two rows of wheat should be 20-25cm.",
      "Depending on the variety, wheat becomes ready for the first harvest in about 100-120 days after planting. Since all the wheat does not mature at the same time, they are harvested at intervals. Generally, there will be 2-3 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 10-12 day intervals during the growing season. Heavy irrigation provided after a long spell of drought can cause lodging. Hence, it should be avoided.",
      "Wheat is a cool season crop. The best grain quality is obtained at a temperature range of 15-20°C. Adequate sunshine helps in the development of healthy grains. Temperature above 25°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Wheat seeds take 7-10 days to germinate.",
      "Wheat seeds are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, seeds are typically planted in October, while for the spring crop, planting occurs in February. Seeds are planted in rows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well-decomposed cow dung manure should be incorporated into the soil at the time of planting. Some amount of DAP and MOP can be applied 30 days after planting.",
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0, 
   // لازم نضيف هنا الامراض والصور
  ),
  Product(
    id:2,
    title: "Lemon".tr,
    subTitle: "a good Lemon".tr,
    image:'images/lemon.jpg',
     //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/lemon.jpg?alt=media&token=3f812209-33f8-417e-bbd9-d1d5e696dd09",
  descriptions: [
    "Lemon seeds should be planted at a depth ranging from 2 to 3 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
    "Normally, lemon seedlings are transplanted at a spacing of 200cm. (The plant-to-plant distance should be 200cm)",
    "The distance between two lemon trees should be 300cm.",
    "Depending on the variety, lemons become ready for the first harvest in about 6-9 months after planting. Since all the lemons do not mature at the same time, they are harvested at intervals. Generally, there will be multiple harvests throughout the year.",
    "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 7-8 day intervals during the growing season. Heavy irrigation provided after a long spell of drought can cause root rot. Hence, it should be avoided.",
    "Lemon is a subtropical crop. The best fruit quality is obtained at a temperature range of 20-30°C. Adequate sunshine helps in the development of healthy fruits. Temperature below 10°C adversely affects plant growth, thereby slowing down physiological activities.",
    "Lemon seeds take 10-14 days to germinate.",
    "Lemon trees are planted directly in the field rather than raising seedlings in nursery beds. Planting can occur throughout the year, but it's often done in spring or autumn. Trees are planted in rows with sufficient spacing between them. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the morning or late afternoon.",
    "For a good yield, well-decomposed organic matter should be incorporated into the soil at the time of planting. Some amount of balanced fertilizer can be applied after transplanting.",
    ],
    kValue : 12.0,
    pValue: 15,
    nValue : 14,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:3,
    title: "white potatoes".tr.tr,
    subTitle: "a good white potatoes",
    image: 'images/pota.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/pota.jpg?alt=media&token=263e71a2-9efa-417e-9083-25e0f1c2c846",
    descriptions: [
      "Potato seeds should be planted at a depth ranging from 10 to 15 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, potato seedlings are transplanted at a spacing of 45cm.(The plant-to-plant distance should be 45cm)",
      " The distance between two rows of potatoes should be 60cm.",
      "  Depending on the variety, potatoes become ready for the first harvest in about 60-70 days after planting. Since all the potatoes do not mature at the same time, they are harvested at intervals of 4 days.Generally, there will be 7-11 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting.Irrigation should be given at 7-8 day intervals during the kharif season, 10-12 days during the rabi season, and 5-6 days during the summer.Heavy irrigation provided after a long spell of drought causes cracking of the tubers. Hence, it should be avoided.",
      "Potato is a cool season crop.The best tuber quality is obtained at a temperature range of 15-20°C. Adequate sunshine helps in the development of healthy tubers.Temperature above 30°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Potato seeds take 10-14 days to germinate.",
      "Potato tubers are planted directly in the field rather than raising seedlings in nursery beds.For the autumn crop, tubers are typically planted in September, while for the spring crop, planting occurs in January.Tubers are planted in furrows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting.Planting should preferably be done in the evening.",
      "For a good yield, well decomposed cow dung manure should be incorporated into the soil at the time of planting.Some amount of DAP and MOP can be applied 30days after transplanting.",

      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0, 
  ),
  Product(
    id:4,
    title: "red potatoes".tr,
    subTitle: "a good red potatoes".tr,
    image: 'images/red pota.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/red%20pota.jpg?alt=media&token=9b1e4f5c-6cc5-4f5c-8994-3b7cd3b6f474",
    descriptions: [
    "Potato seeds should be planted at a depth ranging from 10 to 15 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, potato seedlings are transplanted at a spacing of 45cm.(The plant-to-plant distance should be 45cm)",
      " The distance between two rows of potatoes should be 60cm.",
      "  Depending on the variety, potatoes become ready for the first harvest in about 60-70 days after planting. Since all the potatoes do not mature at the same time, they are harvested at intervals of 4 days.Generally, there will be 7-11 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting.Irrigation should be given at 7-8 day intervals during the kharif season, 10-12 days during the rabi season, and 5-6 days during the summer.Heavy irrigation provided after a long spell of drought causes cracking of the tubers. Hence, it should be avoided.",
      "Potato is a cool season crop.The best tuber quality is obtained at a temperature range of 15-20°C. Adequate sunshine helps in the development of healthy tubers.Temperature above 30°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Potato seeds take 10-14 days to germinate.",
      "Potato tubers are planted directly in the field rather than raising seedlings in nursery beds.For the autumn crop, tubers are typically planted in September, while for the spring crop, planting occurs in January.Tubers are planted in furrows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting.Planting should preferably be done in the evening.",
      "For a good yield, well decomposed cow dung manure should be incorporated into the soil at the time of planting.Some amount of DAP and MOP can be applied 30days after transplanting.",

    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:5,
    title: "tomatoes".tr,
    subTitle: "a good tomatoes".tr,
    image: 'images/tom.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/tom.jpg?alt=media&token=cacb4be5-a3fa-461f-a5a9-c7255d686241",
    descriptions: [
    " The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters  I like to mark a pencil with different increments and use the non-pointy end to make the hole.",
      "Description 2 for whNormally the seedlings are transplanted at a spacing of 45cm.(Plant to plant distance should be 45cm)eat" ,
      "Distance between two rows should be 60cm",
      "Depending on the variety, the fruits are ready for first picking about 60-70 days after planting.Since not all fruits ripen at the same time, they are harvested at 4-day intervals.Generally there will be 7-11 harvests in the life of the crop.",                                              
      "Light irrigation should be given 3-4 days after transplanting. Irrigation should be given 7-8 days interval during kharif, during rabi 10-12 days and 5-6 days during summer.Heavy irrigation provided after a long spell of drought causes cracking of the fruits. Hence it should be avoided" ,
      "  Tomato is a warm season crop. The best fruit colour and quality is obtained at a temperature range of 21-24°C. Bright sunshine at the time of fruit set helps to develop dark red coloured fruits. Temperature below 10 °C adversely affects plant tissues thereby slowing down physiological activities.",
      "Tomato seeds take 7-10 days to germinate.",
      " Tomato seeds are sown on nursery beds to raise seedlings for transplanting in the field.Seeds are sown in June July for autumn winter crop and for spring summer crop seeds are sown in November. Seedlings are transplanted in furrows in light soils and on side of the ridges in case of heavy soils. A pre-soaking irrigation is given 3-4 days prior to transplanting.  Transplanting should preferably be done in the evening." ,                               
      "For a good yield, well decomposed cow dung manure should be incorporated into the soil at the time of planting.Some amount of DAP and MOP can be applied 30days after transplanting.",

    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0

  ),
  Product(
    id:6,
    title: "barley".tr,
    subTitle: "a good barley".tr,
    image: 'images/barley.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/barley.jpg?alt=media&token=e2fbe757-3a7e-4db0-a0fc-bb85cace772d",
    descriptions: [
      "Barley seeds should be planted at a depth ranging from 2 to 3 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, barley seedlings are sown at a spacing of 15-20cm. (The plant-to-plant distance should be 15-20cm)",
      "The distance between two rows of barley should be 20-25cm.",
      "Depending on the variety, barley becomes ready for the first harvest in about 70-90 days after planting. Since all the barley does not mature at the same time, they are harvested at intervals. Generally, there will be 1-2 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 10-12 day intervals during the growing season. Heavy irrigation provided after a long spell of drought can cause lodging. Hence, it should be avoided.",
      "Barley is a cool season crop. The best grain quality is obtained at a temperature range of 10-15°C. Adequate sunshine helps in the development of healthy grains. Temperature above 25°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Barley seeds take 7-10 days to germinate.",
      "Barley seeds are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, seeds are typically planted in September, while for the spring crop, planting occurs in February. Seeds are planted in rows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well-decomposed cow dung manure should be incorporated into the soil at the time of planting. Some amount of DAP and MOP can be applied 30 days after planting.",
    
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:7,
    title: "white onion".tr,
    subTitle: "a good white onion".tr,
    image: 'images/whiteon.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/whiteon.jpg?alt=media&token=39227a3d-0387-41c6-95b4-ff15708a4146",
    descriptions: [
      "White onion seeds should be planted at a depth ranging from 1 to 2 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, white onion seedlings are transplanted at a spacing of 10-15cm. (The plant-to-plant distance should be 10-15cm)",
      "The distance between two rows of white onions should be 20-25cm."
      "Depending on the variety, white onions become ready for the first harvest in about 90-120 days after planting. Since all the onions do not mature at the same time, they are harvested at intervals of 7-10 days. Generally, there will be 2-3 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 7-8 day intervals during the growing season. Heavy irrigation provided after a long spell of drought causes splitting of the bulbs. Hence, it should be avoided.",
      "White onion is a cool season crop. The best bulb quality is obtained at a temperature range of 10-25°C. Adequate sunshine helps in the development of healthy bulbs. Temperature above 30°C adversely affects bulb development, thereby slowing down physiological activities.",
      "White onion seeds take 7-14 days to germinate.",
      "White onion bulbs are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, bulbs are typically planted in September, while for the spring crop, planting occurs in January. Bulbs are planted in furrows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well-decomposed cow dung manure should be incorporated into the soil at the time of planting. Some amount of DAP and MOP can be applied 30 days after planting.",
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:8,
    title: "red onion".tr,
    subTitle: "a good red onion".tr,
    image: 'images/redon.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/redon.jpg?alt=media&token=19a1c94c-d737-4f4e-917a-f195dd5c1b86",
    descriptions: [
      "White onion seeds should be planted at a depth ranging from 1 to 2 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole.",
      "Normally, white onion seedlings are transplanted at a spacing of 10-15cm. (The plant-to-plant distance should be 10-15cm)",
      "The distance between two rows of white onions should be 20-25cm.",
      "Depending on the variety, white onions become ready for the first harvest in about 90-120 days after planting. Since all the onions do not mature at the same time, they are harvested at intervals of 7-10 days. Generally, there will be 2-3 harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 7-8 day intervals during the growing season. Heavy irrigation provided after a long spell of drought causes splitting of the bulbs. Hence, it should be avoided.",
      "White onion is a cool season crop. The best bulb quality is obtained at a temperature range of 10-25°C. Adequate sunshine helps in the development of healthy bulbs. Temperature above 30°C adversely affects bulb development, thereby slowing down physiological activities.",
      "White onion seeds take 7-14 days to germinate.",
      "White onion bulbs are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, bulbs are typically planted in September, while for the spring crop, planting occurs in January. Bulbs are planted in furrows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well-decomposed cow dung manure should be incorporated into the soil at the time of planting. Some amount of DAP and MOP can be applied 30 days after planting.",
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:9,
    title: "garlic".tr,
    subTitle: "a good garlic".tr,
    image: 'images/garlic.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/garlic.jpg?alt=media&token=b5561bc4-9edd-4ced-9588-d89a0726934b",
    descriptions: [
      "Garlic cloves should be planted at a depth ranging from 5 to 8 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a dibber marked with different increments and use the blunt end to make the hole.",
      "Normally, garlic cloves are planted at a spacing of 10-15cm. (The clove-to-clove distance should be 10-15cm)"
      "The distance between two rows of garlic should be 20-25cm.",
      "Depending on the variety, garlic becomes ready for the first harvest in about 180-210 days after planting. Since all the garlic does not mature at the same time, they are harvested at intervals. Generally, there will be 1-2 harvests in a crop's life span.",
      " Light irrigation should be given 3-4 days after planting. Irrigation should be given at 10-12 day intervals during the growing season. Heavy irrigation provided after a long spell of drought can cause rotting of the bulbs. Hence, it should be avoided.",
      "Garlic is a cool season crop. The best bulb quality is obtained at a temperature range of 15-20°C. Adequate sunshine helps in the development of healthy bulbs. Temperature above 25°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Garlic cloves take 7-14 days to sprout.",
      " Garlic cloves are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, cloves are typically planted in October, while for the spring crop, planting occurs in February. Cloves are planted in rows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well-decomposed compost should be incorporated into the soil at the time of planting. Some amount of nitrogen-rich fertilizer can be applied 30 days after planting.",
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  Product(
    id:10,
    title: "green pepper".tr,
    subTitle: "a good green pepper".tr,
    image:'images/pepper.jpg',
    //"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/pepper.jpg?alt=media&token=544a5891-4f92-4c77-92b6-e33d977455c8",
    descriptions: [
      "Green pepper seeds should be planted at a depth ranging from 1 to 1.5 centimeters. The temperature and moisture level can vary widely in the top inch of soil, so planting depth matters! You can use a pencil marked with different increments and use the non-pointy end to make the hole." ,
      "Normally, green pepper seedlings are transplanted at a spacing of 45cm. (The plant-to-plant distance should be 45cm)",
      "The distance between two rows of green peppers should be 60cm.",
      "Depending on the variety, green peppers become ready for the first harvest in about 60-70 days after planting. Since all the green peppers do not mature at the same time, they are harvested at intervals of 4 days. Generally, there will be multiple harvests in a crop's life span.",
      "Light irrigation should be given 3-4 days after planting. Irrigation should be given at 7-8 day intervals during the growing season, 10-12 days during the colder season, and 5-6 days during the hotter season. Heavy irrigation provided after a long spell of drought can cause cracking of the fruits. Hence, it should be avoided.",
      "Green pepper is a warm season crop. The best fruit quality is obtained at a temperature range of 21-24°C. Adequate sunshine helps in the development of healthy fruits. Temperature above 30°C adversely affects plant growth, thereby slowing down physiological activities.",
      "Green pepper seeds take 10-14 days to germinate.",
      "Green pepper plants are planted directly in the field rather than raising seedlings in nursery beds. For the autumn crop, seeds are typically planted in September, while for the spring crop, planting occurs in January. Plants are placed in furrows in light soils and on the sides of ridges in heavier soils. A pre-soaking irrigation is given 3-4 days prior to planting. Planting should preferably be done in the evening.",
      "For a good yield, well decomposed cow dung manure should be incorporated into the soil at the time of planting. Some amount of DAP and MOP can be applied 30 days after transplanting.",
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
];
























/*import 'package:get/get.dart';

class product {
  final int id;
  final String title, subTitle, image;
  final double kValue, pValue, nValue, channelValue, fertilizerQuantity;
  final List<String> descriptions; // قائمة الأوصاف

  product({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.descriptions,
    required this.image,
    required this.kValue,
    required this.pValue,
    required this.nValue,
    required this.channelValue,
    required this.fertilizerQuantity,
  });
}

List<product> products = [
  product(
    id: 1,
    title: "wheat".tr,
    subTitle: "good wheat".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/wheat.jpg?alt=media&token=8d5fbe6e-0023-4a3c-897a-ab095a99e259",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue: 10.0,
    pValue: 10,
    nValue: 10,
    channelValue: 0.5,
    fertilizerQuantity: 0,
  ),
   product(
    id:2,
    title: "Lemon".tr,
    subTitle: "a good Lemon".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/lemon.jpg?alt=media&token=3f812209-33f8-417e-bbd9-d1d5e696dd09",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 12.0,
    pValue: 15,
    nValue : 14,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:3,
    title: "white potatoes".tr.tr,
    subTitle: "a good white potatoes",
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/pota.jpg?alt=media&token=263e71a2-9efa-417e-9083-25e0f1c2c846",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:4,
    title: "red potatoes".tr,
    subTitle: "a good red potatoes".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/red%20pota.jpg?alt=media&token=9b1e4f5c-6cc5-4f5c-8994-3b7cd3b6f474",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:5,
    title: "tomatoes".tr,
    subTitle: "a good tomatoes".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/tom.jpg?alt=media&token=cacb4be5-a3fa-461f-a5a9-c7255d686241",
     descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0

  ),
  product(
    id:6,
    title: "barley".tr,
    subTitle: "a good barley".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/barley.jpg?alt=media&token=e2fbe757-3a7e-4db0-a0fc-bb85cace772d",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:7,
    title: "white onion".tr,
    subTitle: "a good white onion".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/whiteon.jpg?alt=media&token=39227a3d-0387-41c6-95b4-ff15708a4146",
     descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:8,
    title: "red onion".tr,
    subTitle: "a good red onion".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/redon.jpg?alt=media&token=19a1c94c-d737-4f4e-917a-f195dd5c1b86",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:9,
    title: "garlic".tr,
    subTitle: "a good garlic".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/garlic.jpg?alt=media&token=b5561bc4-9edd-4ced-9588-d89a0726934b",
    descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
  ),
  product(
    id:10,
    title: "green pepper".tr,
    subTitle: "a good green pepper".tr,
    image:"https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/pepper.jpg?alt=media&token=544a5891-4f92-4c77-92b6-e33d977455c8",
  descriptions: [
      "Description 1 for wheat",
      "Description 2 for wheat",
      "Description 3 for wheat",
      // أوصاف المربعات الأخرى للقمح
    ],
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0, 
  ),
];*/

  // أضف بقية المنتجات مع الوصف الخاص بها لكل مربع هنا

















































/*import 'package:get/get.dart';

class Product {
  final int id;
  final String title, subTitle, description, image;
  final double kValue,pValue,nValue, channelValue ,fertilizerQuantity;

  Product( 
    {required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
    required this.kValue,
    required this.pValue,
    required this.nValue,
    required this.channelValue,
    required this.fertilizerQuantity,
    }); 
}*/



  /* List<String> descriptions = [
  "Description 1",
  "Description 2",
  "Description 3",
    "Description 1",
  "Description 2",
  "Description 3",
    "Description 1",
  "Description 2",
  "Description 3",
  // أضف المزيد من الأوصاف حسب الحاجة
];*/

//list of product
/*List<Product> product = [
  Product(
    id:1,
    title: "wheat".tr,
    subTitle: "good wheat".tr,
    image: "https://firebasestorage.googleapis.com/v0/b/planar-oasis-416614.appspot.com/o/wheat.jpg?alt=media&token=8d5fbe6e-0023-4a3c-897a-ab095a99e259",
    description: "",
    kValue : 10.0,
    pValue: 10,
    nValue : 10,
    channelValue : 0.5,
    fertilizerQuantity : 0
   // لازم نضيف هنا الامراض والصور
  ),*/
 