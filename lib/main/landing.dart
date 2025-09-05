
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({super.key});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  final  _url = Uri.parse('https://www.instagram.com/hardik_prem_1298/');
  bool isHovered = false;
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (vis == true) {
              vis = false;
            } else {
              vis = true;
            }
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: vis == false ? 200 : 300,
            height: vis == false ? 100 : 500,
            
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ Color(0xFF9BAFD9),Color(0xFF103783)],),
              color: vis==false?Colors.grey:null,
              borderRadius: BorderRadius.circular(10)
            ),
            child: vis==false?
            
            Center(child: nicetext('Life'))
            
            :Container(
              width: 300,
              height: 500,
              
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Color(0xFF9BAFD9),Color(0xFF103783)],),
                
                borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                children: [
                  
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(r'Assets\images\IMG-20250707-WA0005.jpg'),fit: BoxFit.cover),
                            
                                      
                          ),
                        ),
                      ),
                      Center(child: nicetext('Hardik Prem')),
                      
                      Center(child: nicetext('Certified flutter designer',12)),
                      Center(child: nicetext('Vit Chennai',12)),

                      Row(
                        children: [
                          nicetext('Instagram:',17,5),
                          TextButton(onPressed: (){
                            launchUrl(_url);
                          }, child: Text('hardik_prem_1298'))
                        ],
                      ),

                      

                      

                    ],
                                    ),
                  ),
                ]
                 
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding nicetext(String strin,[double fs=17,double top1=0]) => Padding(
    padding:  EdgeInsets.only(left: 10.0,top:top1 ),
    child: Text('$strin',style: TextStyle(color: Colors.white,fontSize: fs),),
  );
}
