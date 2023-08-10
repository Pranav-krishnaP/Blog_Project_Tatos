import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../data/objects.dart';

class Mhomescreen extends StatelessWidget {
  const Mhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Fetchdetails obj = Get.find();
    obj.fetchdata();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff374151), Color(0xff111827)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Container(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(color: Color(0xff4B5563)),
                      child: const Center(
                        child: Text(
                          "E",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: const Text(
                        "Epilectus",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Patrick Hand"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Obx(() => obj.isLoading.value == 1
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: 300,
                      child: ListView.builder(
                          itemCount: obj.result.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Blocks(obj: obj, index: index);
                          }),
                    )),
            ),
          ),
        ),
      ),
    );
  }
}

class Blocks extends StatelessWidget {
  Blocks({super.key, required this.obj, required this.index});

  Fetchdetails obj;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(obj.result[index].courseimage!),
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Opacity(
              opacity: 0.6,
              child: Row(
                children: [
                  Text(obj.result[index].group!,
                      style: TextStyle(
                          fontFamily: "Patrick Hand", color: Colors.white)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(" " + obj.result[index].date!,
                      style: TextStyle(
                          fontFamily: "Patrick Hand", color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(obj.result[index].title!,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Patrick Hand",
                    color: Colors.white)),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Opacity(
              opacity: 0.6,
              child: Text(obj.result[index].desc!,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Patrick Hand",
                      color: Colors.white)),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(obj.result[index].authorimage!),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(obj.result[index].author!,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Patrick Hand",
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(obj.result[index].profession!,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Patrick Hand",
                              color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(flex: 2, child: SizedBox()),
          Container(
            height: 0.23,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
          ),
          Expanded(flex: 2, child: SizedBox())
        ],
      ),
    );
  }
}
