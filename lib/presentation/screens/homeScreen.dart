import 'package:asignment_m_14/core/theme/colors.dart';
import 'package:asignment_m_14/data/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/theme/buttonTheme.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final repositories productController = repositories();

  Future<void> fetchData() async {
    await productController.fetchProduct();
    print(productController.product.length);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  alertDialogue({
    String? id,
    String? productName,
    String? img,
    int? qty,
    int? unitPrice,
    int? totalPrice,
  }) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController imgController = TextEditingController();
    TextEditingController qtyController = TextEditingController();
    TextEditingController unitPriceController = TextEditingController();
    TextEditingController totalPriceController = TextEditingController();

    if (id != null) {
      productNameController.text = productName.toString();
      imgController.text = img.toString();
      qtyController.text = qty.toString();
      unitPriceController.text = unitPrice.toString();
      totalPriceController.text = totalPrice.toString();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              id == null ? Text('Add Product') : Text('Update Product'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(hintText: 'Product Name'),
              ),
              TextField(
                controller: imgController,
                decoration: InputDecoration(hintText: 'Image'),
              ),
              TextField(
                controller: qtyController,
                decoration: InputDecoration(hintText: 'Quantity'),
              ),
              TextField(
                controller: unitPriceController,
                decoration: InputDecoration(hintText: 'Unit Price'),
              ),
              TextField(
                controller: totalPriceController,
                decoration: InputDecoration(hintText: 'Total Price'),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await productController.createProduct(
                          productName: productNameController.text,
                          img: imgController.text,
                          qty: int.parse(qtyController.text.toString()),
                          unitPrice: int.parse(unitPriceController.text),
                          totalPrice: int.parse(totalPriceController.text),
                        );
                      } else {
                        await productController.updateProduct(
                          id: id,
                          productName: productNameController.text,
                          img: imgController.text,
                          qty: int.parse(qtyController.text),
                          unitPrice: int.parse(unitPriceController.text),
                          totalPrice: int.parse(totalPriceController.text),
                        );
                      }
                      setState(() {});
                      Navigator.pop(context);
                      fetchData();
                    },
                    child: id == null ? Text('Add ') : Text('Update'),
                    style: buttonStyle(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operation'),
        backgroundColor: colors.primaryColors,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
              ),
              itemCount: productController.product.length,
              itemBuilder: (BuildContext context, int index) {
                var product = productController.product[index];
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Face image
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 160,
                              width: 155,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                child: Image.network(
                                  product.img.toString().trim(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.broken_image),
                                        Text('Image Not Found'),
                                      ],
                                    );
                                  },
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            height: 50,
                            width: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${product.productName.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Price: ${product.unitPrice.toString()} | Quantity: ${product.qty.toString()} ',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 20,
                                  left: 125,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: colors.primaryColors,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.add_shopping_cart_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Delete product
                              Card(
                                child: ListTile(
                                  title: Text('Delete'),
                                  trailing: Icon(
                                    Icons.delete,
                                    color: colors.primaryColors,
                                  ),
                                  onTap: () {
                                    productController.deleteProduct(
                                      id: product.sId.toString(),
                                    );
                                    Navigator.pop(context);
                                    fetchData();
                                    setState(() {});
                                  },
                                ),
                              ),
                              //Update product
                              Card(
                                child: ListTile(
                                  title: Text('Update'),
                                  trailing: Icon(
                                    Icons.edit,
                                    color: colors.primaryColors,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    alertDialogue(
                                      productName:
                                          product.productName.toString(),
                                      id: product.sId.toString(),
                                      img: product.img.toString(),
                                      qty: product.qty,
                                      unitPrice: product.unitPrice,
                                      totalPrice: product.totalPrice,
                                    );
                                    fetchData();
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alertDialogue();
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
        backgroundColor: colors.primaryColors,
      ),
    );
  }
}
