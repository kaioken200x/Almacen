import 'package:flutter/material.dart';
import 'package:globomatik_app/models/product.dart';

class ProductEditScreen extends StatefulWidget {
  final Product product;

  const ProductEditScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _lotNumberController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _lotNumberController =
        TextEditingController(text: widget.product.lotNumber);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lotNumberController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _saveProduct() async {
    // Implementar a lógica para salvar as alterações do produto
    // Por exemplo, atualizar o produto no banco de dados ou na API
    /*
    final response = await http.put(
      Uri.parse('https://api.example.com/products/${widget.product.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _nameController.text,
        'lotNumber': _lotNumberController.text,
        'price': double.parse(_priceController.text),
      }),
    );

    if (response.statusCode == 200) {
      // Produto atualizado com sucesso
    } else {
      // Tratar erro
    }
    */

    // Dados mockados para teste
    final updatedProduct = Product(
      id: widget.product.id,
      name: _nameController.text,
      lotNumber: _lotNumberController.text,
      price: double.parse(_priceController.text),
      description: widget.product.description,
      expiryDate: widget.product.expiryDate,
      purchaseDate: widget.product.purchaseDate,
      invoiceNumber: widget.product.invoiceNumber,
      warehouseLocation: widget.product.warehouseLocation,
      quantity: widget.product.quantity,
    );

    // Exibir mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Producto ${updatedProduct.name} actualizado con éxito')),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration:
                  const InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: _lotNumberController,
              decoration: const InputDecoration(labelText: 'Número de Lote'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
