import 'package:cinema_app/shared/constances/constances.dart';
import 'package:cinema_app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final EdgeInsetsGeometry margin;
  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: MaterialButton(
        height: 50,
        textColor: Colors.white,
        color: AppColors.basecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

class OnBoardItem extends StatelessWidget {
  final String image;
  final String title;
  const OnBoardItem({Key? key, required this.image, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)))),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                textAlign: TextAlign.center,
                title,
                style: Theme.of(context).textTheme.headline1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const TabItem({
    Key? key,
    required this.label,
    required this.color,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.basecolor,
            size: 28,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: AppColors.basecolor,
            ),
          )
        ],
      ),
    );
  }
}

class NowPlaying extends StatelessWidget {
  final String moviename;
  final String? image;
  final dynamic rate;
  final VoidCallback onPressed;

  const NowPlaying(
      {Key? key,
      required this.moviename,
      this.image,
      required this.rate,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage(
              image: NetworkImage('${AppConstances.imageUrl}$image'),
              placeholderFit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/loading2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            child: Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Now Playing',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 60,
            start: 20,
            end: 10,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    moviename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ratewidget(context, rate: rate),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopRatedRow extends StatelessWidget {
  final String text;
  final VoidCallback seemoreOnPressed;
  const TopRatedRow(
      {Key? key, required this.text, required this.seemoreOnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const Expanded(child: SizedBox()),
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: seemoreOnPressed,
          child: Row(
            children: const [
              Text(
                'See More',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MovieItem extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  final dynamic rate;
  const MovieItem({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.rate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: onPressed,
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/loading2.jpeg'),
              image: NetworkImage('${AppConstances.imageUrl}$image'),
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
              fadeInCurve: Curves.easeInQuint,
            ),
          ),
        ),
        Positioned(
            bottom: 10, right: 10, child: ratewidget(context, rate: '$rate')),
      ],
    );
  }
}

Widget ratewidget(
  context, {
  required dynamic rate,
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 5,
    height: 28,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(.8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow.shade700,
          size: 25,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          '$rate',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade700),
        ),
      ],
    ),
  );
}

PreferredSizeWidget myAppbar(context,
    {required String text,
    Color color = Colors.white,
    Color textColor = Colors.black,
    Color backColor = Colors.black}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: color,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 25, color: backColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    title: Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(color: textColor),
    ),
  );
}

class MovieReview extends StatelessWidget {
  final String image;
  final String title;
  final String year;
  final dynamic rate;
  final String discription;
  final VoidCallback onPressed;
  const MovieReview(
      {Key? key,
      required this.image,
      required this.title,
      required this.year,
      required this.rate,
      required this.discription,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: FadeInImage(
                  image: NetworkImage('${AppConstances.imageUrl}$image'),
                  placeholder:
                      const AssetImage('assets/images/loadinggrey.png'),
                  fit: BoxFit.cover,
                  fadeInCurve: Curves.easeInCubic,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 25, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.red.shade400),
                          child: Text(
                            textAlign: TextAlign.center,
                            year,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '$rate',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      discription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> navigateTo(context, {required Widget screen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}

Widget movieDetails(
  context, {
  required double width,
  required String text,
}) {
  return Container(
    height: 40,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(.4)),
    child: Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
      ),
    ),
  );
}

class ActorItem extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const ActorItem({Key? key, required this.image, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 6.5,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade600,
        ),
        clipBehavior: Clip.antiAlias,
        child: FadeInImage(
          image: NetworkImage('${AppConstances.imageUrl}$image'),
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/images/loadinggrey.png'),
          placeholderFit: BoxFit.cover,
        ),
      ),
    );
  }
}
