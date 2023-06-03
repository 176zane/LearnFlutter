// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test_app/provider_shopper/models/shopper_cart_model.dart';
import 'package:provider/provider.dart';


class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(
                fontFamily: 'Corben',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.black,),
              // Theme.of(context).textTheme.displayLarge,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = const TextStyle(
                fontFamily: 'Corben',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.black,
              // Theme.of(context).textTheme.displayLarge,
        );
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =const TextStyle(
                fontFamily: 'Corben',
                fontWeight: FontWeight.w700,
                fontSize: 48,
                color: Colors.black,
              // Theme.of(context).textTheme.displayLarge,
        );
        //Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            //Consumer widget 唯一必须的参数就是 builder。当 ChangeNotifier 发生变化的时候会调用 builder 这个函数。
            //builder 在被调用的时候会用到三个参数。第一个是 context。在每个 build 方法中都能找到这个参数。

            //builder 函数的第二个参数是 ChangeNotifier 的实例。它是我们最开始就能得到的实例。你可以通过该实例定义 UI 的内容。

            //第三个参数是 child，用于优化目的。如果 Consumer 下面有一个庞大的子树，当模型发生改变的时候，该子树 并不会 改变，那么你就可以仅仅创建它一次，然后通过 builder 获得该实例

            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('\$${cart.totalPrice}', style: hugeStyle)),
            const SizedBox(width: 24),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
