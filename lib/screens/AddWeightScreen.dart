import 'package:WeightLossCal/constants.dart';
import 'package:WeightLossCal/view/AnimatedView.dart';
import 'package:WeightLossCal/widgets/buttonBlur.dart';
import 'package:flutter/material.dart';

class AddWeightScreen extends StatefulWidget {
  @override
  _AddWeightScreenState createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: kTargetBackgroundColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedView(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Enter Weight",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextFormField(
                            maxLength: 4,
                            buildCounter: (BuildContext context,
                                    {int currentLength,
                                    int maxLength,
                                    bool isFocused}) =>
                                null,
                            style:
                                TextStyle(fontSize: 35.0, color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              final isDigitsOnly = int.tryParse(input);
                              return isDigitsOnly == null
                                  ? 'Input needs to be digits only'
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          width: 60.0,
                          child: ButtonBlur(
                            height: 30,
                            color: Colors.black12,
                            child: FlatButton(
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              color: Colors.white,
                              onPressed: () => {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "KG",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBlur(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.black12,
                      child: FlatButton(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        color: Colors.black.withOpacity(0.2),
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_enhance,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Photo",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.0),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                      ),
                    ),
                    ButtonBlur(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: Colors.black12,
                      child: FlatButton(
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        color: Colors.black.withOpacity(0.2),
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_comment,
                              color: Colors.white,
                              size: 26.0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Comment",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.0),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ButtonBlur(
                  height: 55.0,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.black12,
                  child: FlatButton(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Done",
                          style: TextStyle(color: Colors.black, fontSize: 19.0),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
