import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project1/data/objects.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Fetchdetails obj = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    TextEditingController controller = TextEditingController();
    var active = 0.obs;
    var formed = obj.result.obs;

    List<Objects> listchange(String value) {
      List<Objects> res = [];
      for (var x in obj.result) {
        if (x.title!.toLowerCase().contains(value.toLowerCase())) {
          res.add(x);
        }
      }
      return res;
    }

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff374151), Color(0xff111827)])),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration:
                              const BoxDecoration(color: Color(0xff4B5563)),
                          child: const Center(
                            child: Text(
                              "E",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(),
                        Container(
                          child: const Text(
                            "Epilectus",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Patrick Hand"),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(flex: 3, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "UI DESIGN",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Patrick Hand"),
                        ),
                        const Text(
                          "UI DESIGN",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Patrick Hand"),
                        ),
                        const Text(
                          "UI DESIGN",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Patrick Hand"),
                        ),
                        const Text(
                          "UI DESIGN",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Patrick Hand"),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 3, child: SizedBox()),
                  Expanded(
                      flex: 3,
                      child: Opacity(
                        opacity: 1,
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: controller,
                            onChanged: (str) {
                              if (str == '') {
                                formed.value = obj.result;
                              } else {
                                formed.value = listchange(str);
                              }
                            },
                            onTap: () => active.value = 1,
                            onTapOutside: (event) => active.value = 0,
                            decoration: const InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Color(0xff1F293799),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                      ))
                ],
              ),
            )),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Obx(
          () => active == 1
              ? SafeArea(
                  child: Container(
                    child: GridView.count(
                      mainAxisSpacing: 0.08 * height,
                      crossAxisSpacing: 30,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      // ignore: invalid_use_of_protected_member
                      children: List.generate(
                          formed.value.length,
                          // ignore: invalid_use_of_protected_member
                          (index) => Blocks(obj: formed.value, index: index)),
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Obx(() => obj.isLoading.value == 1
                          ? const CircularProgressIndicator()
                          : Mainblock(obj: obj.result[0])),
                      const SizedBox(
                        height: 50,
                      ),
                      Obx(() => obj.isLoading.value == 1
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              child: GridView.count(
                                mainAxisSpacing: 0.08 * height,
                                crossAxisSpacing: 30,
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                children: List.generate(
                                    obj.result.length - 1,
                                    (index) =>
                                        Blocks(obj: obj.result, index: index)),
                              ),
                            )),
                      SizedBox(
                        height: height * 0.09,
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          "Copyright (c) 2021 - Design By Nauval",
                          style: TextStyle(
                              fontFamily: "Patrick Hand", color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
        )),
      ),
    );
  }
}

class Mainblock extends StatelessWidget {
  const Mainblock({super.key, required this.obj});

  final Objects obj;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 10,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(obj.courseimage!),
                          fit: BoxFit.fill)),
                )),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 9,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Row(
                          children: [
                            Text(obj.group!,
                                style: TextStyle(
                                    fontFamily: "Patrick Hand",
                                    color: Colors.white)),
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
                            Text(" " + obj.date!,
                                style: TextStyle(
                                    fontFamily: "Patrick Hand",
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      Text(obj.title!,
                          style: TextStyle(
                              fontSize: 46,
                              fontFamily: "Patrick Hand",
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text(obj.desc!,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Patrick Hand",
                                color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(obj.authorimage!),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(obj.author!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Patrick Hand",
                                      color: Colors.white)),
                              SizedBox(
                                height: 10,
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(obj.profession!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Patrick Hand",
                                        color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Blocks extends StatelessWidget {
  Blocks({super.key, required this.obj, required this.index});

  List<Objects> obj;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(obj[index].courseimage!),
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
                  Text(obj[index].group!,
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
                  Text(" " + obj[index].date!,
                      style: TextStyle(
                          fontFamily: "Patrick Hand", color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(obj[index].title!,
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
              child: Text(obj[index].desc!,
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
                  foregroundImage: NetworkImage(obj[index].authorimage!),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(obj[index].author!,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Patrick Hand",
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(obj[index].profession!,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Patrick Hand",
                              color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
