import 'package:designcredits/arts.dart';
import 'package:designcredits/bhapage.dart';
import 'package:designcredits/bswpage.dart';
import 'package:designcredits/dashboard1.dart';
import 'package:designcredits/education.dart';
import 'package:designcredits/extracurricular.dart';
import 'package:designcredits/sacboards.dart';
import 'package:designcredits/sports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../global/common/toast.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:designcredits/sports.dart';
import 'dashboard_circular.dart';
// import 'package:designcredits/education.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Student Hub",
              style: GoogleFonts.inriaSerif(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Let your journey begin here",
              style: GoogleFonts.inriaSerif(
                color: Color.fromARGB(207, 102, 92, 92),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/login");
                showToast(message: "Successfully signed out");
              },
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ImageLinkPage(),
      ),
    );
  }
}

class ImageLinkPage extends StatelessWidget {
  const ImageLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //   child: ,
          // ),
          SizedBox(height: 20),
          ImageLink(
            imageUrl: 'images/acadamic.jpg',
            linkText: 'Curricular',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardCircular(),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ImageLink(
            imageUrl: 'images/arts_logo.jpg',
            linkText: 'Extra Curricular',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dashboard1(),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ImageLink(
            imageUrl: 'images/essentials.jpg',
            linkText: 'Essentials',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExtraCurricularPage(),
                ),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ImageLink extends StatelessWidget {
  final String imageUrl;
  final String linkText;
  final VoidCallback onTap;

  const ImageLink({
    required this.imageUrl,
    required this.linkText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            linkText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
List<String> searchTerms = [
	"Eateries",
	"ATM",
	"Hospital",
	"Temple",
	"Bank",
	"Groceries",
	 "Salon",
	"Stationary",
  "Laundary",
  "Cycle Repair",
  "Atliers",
  "Designerds",
"Dramebaaz",
"Framex",
"Shutterbuggs",
 "TheGrooveTheory",
 "Sangam",
 "RAW",
  "Devlup Labs",
  "Raid",
  "TT",
"Squash",
"Badminton",
"Lawn Tennis",
"Volleyball",
"Football",
"Athletics",
"Basketball",
"Weightlifting",

];
	Map<String, Widget> pageMap = {
    "Eateries": ExtraCurricularPage(),
	"ATM": ExtraCurricularPage(),
	"Hospital": ExtraCurricularPage(),
	"Temple": ExtraCurricularPage(),
	"Bank": ExtraCurricularPage(),
	"Groceries": ExtraCurricularPage(),
	 "Salon": ExtraCurricularPage(),
	"Stationary": ExtraCurricularPage(),
  "Laundary": ExtraCurricularPage(),
  "Cycle Repair": ExtraCurricularPage(),
  "Atliers":ArtsPage(),
  "Designerds":ArtsPage(),
"Dramebaaz":ArtsPage(),
"Framex":ArtsPage(),
"Shutterbuggs":ArtsPage(),
 "TheGrooveTheory":ArtsPage(),
 "Sangam":ArtsPage(),
 "RAW":ArtsPage(),
 "Devlup Labs":EducationPage(),
  "Raid":EducationPage(),
   "TT":SportsPage(),
"Squash":SportsPage(),
"Badminton":SportsPage(),
"Lawn Tennis":SportsPage(),
"Volleyball":SportsPage(),
"Football":SportsPage(),
"Athletics":SportsPage(),
"Basketball":SportsPage(),
"Weightlifting":SportsPage(),
  };
// first overwrite to 
// clear the search text
@override
List<Widget>? buildActions(BuildContext context) {
	return [
	IconButton(
		onPressed: () {
		query = '';
		},
		icon: Icon(Icons.clear),
	),
	];
}

// second overwrite to pop out of search menu
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: Icon(Icons.arrow_back),
	);
}

// third overwrite to show query result
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return TextButton(
		child: Text(result),
    onPressed: () {
      if (pageMap.containsKey(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pageMap[result]!,
                ),
              );
            }
    },
		);
	},
	);
}

// last overwrite to show the 
// querying process at the runtime
@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var fruit in searchTerms) {
	if (fruit.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(fruit);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return TextButton(
		child: Text(result, style: TextStyle(color: Colors.black)),
    onPressed: () {
      if (pageMap.containsKey(result)) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pageMap[result]!,
                ),
              );
            }
    },
		);
	},
	);
}
}
