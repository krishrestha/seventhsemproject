import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seventhsemproject/Screens/course_screen.dart';
class Screen1 extends StatelessWidget{

  final User? user = FirebaseAuth.instance.currentUser;
  //Creating static data in lists
  List catNames =[
    "Category",
    'Classes',
    'Free Course',
    'BookStore',
    'Live Course',
    'LeaderBoard'
  ];

  List<Color>catColours = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE080),
    Color(0xFF618DFD),
    Color(0xFFFC7F7F),
    Color(0xFFC884F8),
    Color(0xFF78E667),

  ];

  List<Icon> catIcons= [
    Icon(Icons.category,color: Colors.white,size: 30),
    Icon(Icons.video_library,color: Colors.white,size: 30),
    Icon(Icons.assignment,color: Colors.white,size: 30),
    Icon(Icons.store,color: Colors.white,size: 30),
    Icon(Icons.play_circle_fill,color: Colors.white,size: 30),
    Icon(Icons.emoji_events,color: Colors.white,size: 30),
  ];
  List imgList = [
    'Flutter',
    'React Native',
    'Python',
    'C#',
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15,left: 15,bottom: 10),
              decoration: BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3,bottom: 15),
                    child: Text('Hi, ${user?.displayName ?? 'No Display Name'}',style:TextStyle(
                      fontSize: 25,fontWeight: FontWeight.w600,
                      letterSpacing:1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,right: 15,),
                    child: Container(
                        margin: EdgeInsets.only(top: 5,bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here........",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 25,
                                )
                            )
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 15,right: 15),
              child: Column(children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap:true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColours[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: catIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          catNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
        
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (MediaQuery.of(context).size.height-20-25)/(4*240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CourseScreen(imgList[index]),
                            ));
                      },
                      child:Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/images/${imgList[index]}.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              imgList[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("55 Videos",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),)
                          ],
                        ),
                      ) ,
                    );
                  },
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}