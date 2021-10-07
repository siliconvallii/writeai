import 'package:flutter/widgets.dart';
import 'package:writeai/data/data.dart';
import 'package:writeai/providers/launch_url.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 100 * 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover more:',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const Text(
                  'Website',
                  style: TextStyle(
                    color: Color(0xff580A7A),
                    fontFamily: 'Lato',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => launchUrl(websiteUrl),
              ),
              const Text(
                '|',
                style: TextStyle(
                  color: Color(0xff580A7A),
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: const Text(
                  'Data sheet',
                  style: TextStyle(
                    color: Color(0xff580A7A),
                    fontFamily: 'Lato',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => launchUrl(websiteUrl),
              ),
              const Text(
                '|',
                style: TextStyle(
                  color: Color(0xff580A7A),
                  fontFamily: 'Lato',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: const Text(
                  'Contact us',
                  style: TextStyle(
                    color: Color(0xff580A7A),
                    fontFamily: 'Lato',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => launchUrl(websiteUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
