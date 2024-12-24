import 'package:flutter/material.dart';
import '../models/pic.dart';
import '../components/pic_card.dart';
import '../pages/add_pic_page.dart';

class MainPage extends StatefulWidget {
  final Function(Picture) onFavoriteToggle;
  final Function(Picture) onAddToCart;

  const MainPage({super.key, required this.onFavoriteToggle, required this.onAddToCart});

  @override
  _MainPageState createState() => _MainPageState();
}

final List<Picture> devices = [
  Picture(1, 'Бумажная картина с одинаковым  подрамником', 10, 'Картина Пушкин', 3799, 'https://basket-17.wbbasket.ru/vol2828/part282889/282889711/images/big/1.webp'),
  Picture(2, 'Бумажная картина с одинаковым  подрамником', 1, 'Картина Пушкин 2', 3799, 'https://basket-12.wbbasket.ru/vol1779/part177910/177910898/images/big/1.webp'),
  Picture(3, 'Бумажная картина с одинаковым  подрамником', 14, 'Картина Мотивация', 3999, 'https://basket-12.wbbasket.ru/vol1678/part167806/167806062/images/big/1.webp'),
  Picture(4, 'Бумажная картина с одинаковым  подрамником', 12, 'Картина Демотивация', 70000, 'https://basket-17.wbbasket.ru/vol2818/part281845/281845278/images/big/1.webp'),
  Picture(5, 'Бумажная картина с одинаковым  подрамником', 15, 'Картина Чехов', 3999, 'https://basket-12.wbbasket.ru/vol1792/part179243/179243052/images/big/1.webp'),
  Picture(6, 'Стильный и вместительный холодильник', 6, 'Картина Чехов 2', 4299, 'https://basket-12.wbbasket.ru/vol1792/part179243/179243053/images/big/1.webp'),
];

class _MainPageState extends State<MainPage> {
  void _addDevice(Picture device) {
    setState(() {
      devices.add(device);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Товары',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: devices.isEmpty
          ? const Center(child: SizedBox()) 
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6, 
                mainAxisSpacing: 8.0, 
                crossAxisSpacing: 8.0, 
              ),
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return PicCard(
                  picture: devices[index],
                  onFavoriteToggle: widget.onFavoriteToggle,
                  onAddToCart: widget.onAddToCart, 
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDevicePage(onAddDevice: _addDevice),
            ),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xFFF5DEB3),
        child: const Icon(Icons.add),
      ),
    );
  }
}