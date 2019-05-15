import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description',
  ];

  String description;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeDesc);

    setState(() {
      description = allDescriptions[0];
    });
  }

  changeDesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();

    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350,
          child: ListView(
            padding: EdgeInsets.only(left: 25),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard(
                'assets/images/whiteplant.png',
                '25',
                'OUTDOOR',
                'Aloe Vera',
              ),
              SizedBox(width: 15),
              getPlantCard(
                'assets/images/smallplant.png',
                '25',
                'INDOOR',
                'Ficus',
              ),
              SizedBox(width: 15),
              getPlantCard(
                'assets/images/whiteplant.png',
                '25',
                'OUTDOOR',
                'Aloe Vera',
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 10),
          child: Text(
            'Decription',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 10),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  getPlantCard(
    String imgPath,
    String price,
    String plantType,
    String plantName,
  ) {
    return Stack(
      children: <Widget>[
        Container(
          height: 325,
          width: 225,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF399D63),
            ),
            height: 250,
            width: 225,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'FROM',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8AC7A4),
                          ),
                        ),
                        Text(
                          '\$$price',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Image(
                  image: AssetImage(imgPath),
                  height: 165,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plantType,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9AC7A4),
                          ),
                        ),
                        Text(
                          plantName,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(
                        Icons.wb_sunny,
                        color: Colors.white.withOpacity(0.4),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(
                        Icons.branding_watermark,
                        color: Colors.white.withOpacity(0.4),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(
                        Icons.hot_tub,
                        color: Colors.white.withOpacity(0.4),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF399D63),
                        ),
                        child: Icon(
                          Icons.help_outline,
                          color: Colors.white.withOpacity(0.4),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 90, top: 300),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
