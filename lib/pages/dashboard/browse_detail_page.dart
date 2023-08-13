import 'package:flutter/material.dart';
import 'package:pinterest/modal/image.dart';

class BrowseDetailPage extends StatelessWidget {
  const BrowseDetailPage({super.key, required this.image});

  final Images image;

  @override
  Widget build(BuildContext context) {
    // print(image.user.links?.photos.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 8),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent.withOpacity(0.1),
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13.0, top: 8),
            child: CircleAvatar(
              backgroundColor: Colors.transparent.withOpacity(0.1),
              radius: 20,
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(image.urls!.regular.toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(image.urls?.raw.toString() ?? ""),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            image.user.username.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          if (image.user.location != null)
                            Text(
                              image.user.location.toString() ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black87),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  if (image.description != null) ...[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      image.description.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
