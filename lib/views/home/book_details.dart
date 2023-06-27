import 'package:book_store/themes/theme.dart';
import 'package:book_store/views/home/pdf_viewer.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final bool purchased;
  const BookDetails({Key? key, required this.purchased}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
              size: 30,
            ),
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 260,
                  width: 170,
                  child: Image.asset(
                    "assets/images/book 1.jpg",
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Girl Made of Gold",
                style: CustomTheme.lightTheme().textTheme.displayLarge,
                softWrap: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Nuclear Security Management Certification Programme",
                textAlign: TextAlign.center,
                style: CustomTheme.lightTheme().textTheme.displayMedium,
                softWrap: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'World Institute for Nuclear Security',
                style: CustomTheme.lightTheme().textTheme.displaySmall,
                softWrap: true,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  if(purchased){
                    /// open pdf
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PDFViewer(),));
                  }else{
                    /// stripe payment
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  decoration: BoxDecoration(
                      color: const Color(0xFF578DCD),
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(color: const Color(0xFF578DCD))),
                  child: Text(
                    purchased ? "Read now" : "Buy 3,49 €",
                    style: CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(padding: const EdgeInsets.symmetric(horizontal: 25), child: Divider(color: CustomColor.divider)),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  child: Text(
                    'Description',
                    style: CustomTheme.lightTheme().textTheme.displayLarge!.copyWith(fontSize: 22),
                    softWrap: true,
                  )),
              const SizedBox(height: 8,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  child: Text(
                    '''At the end of this course, you will find three additional features: a list of acronyms used in the course, a key terms section that defines the major terms discussed in this course (using the definitions provided in the content), and a bibliography. The WINS Academy programmes are specifically designed to support the professional development of personnel within the nuclear sector.''',
                    style: CustomTheme.lightTheme().textTheme.displaySmall,
                    softWrap: true,
                  )),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
