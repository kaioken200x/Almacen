import 'package:flutter/material.dart';
import 'package:globomatik_app/models/product.dart';
import 'package:globomatik_app/services/api_service.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;

  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _lotNumberController;
  late TextEditingController _invoiceNumberController;
  late TextEditingController _warehouseLocationController;
  late TextEditingController _quantityController;

  DateTime _expiryDate = DateTime.now();
  DateTime _purchaseDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name);
    _descriptionController =
        TextEditingController(text: widget.product?.description);
    _priceController =
        TextEditingController(text: widget.product?.price.toString());
    _lotNumberController =
        TextEditingController(text: widget.product?.lotNumber);
    _invoiceNumberController =
        TextEditingController(text: widget.product?.invoiceNumber);
    _warehouseLocationController =
        TextEditingController(text: widget.product?.warehouseLocation);
    _quantityController =
        TextEditingController(text: widget.product?.quantity.toString());

    if (widget.product != null) {
      _expiryDate = widget.product!.expiryDate;
      _purchaseDate = widget.product!.purchaseDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.product == null ? 'Agregar producto' : 'Editar producto'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
                  const InputDecoration(labelText: 'Nombre del producto'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un nombre de producto';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lotNumberController,
              decoration: const InputDecoration(labelText: 'Número de lote'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un número de lote';
                }
                return null;
              },
            ),
            ListTile(
              title: const Text('Fecha de vencimiento'),
              subtitle: Text(_expiryDate.toString().split(' ')[0]),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _expiryDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 3650)),
                );
                if (date != null) {
                  setState(() => _expiryDate = date);
                }
              },
            ),
            ListTile(
              title: const Text('Fecha de compra'),
              subtitle: Text(_purchaseDate.toString().split(' ')[0]),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _purchaseDate,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _purchaseDate = date);
                }
              },
            ),
            TextFormField(
              controller: _invoiceNumberController,
              decoration: const InputDecoration(labelText: 'Número de factura'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un número de factura';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _warehouseLocationController,
              decoration:
                  const InputDecoration(labelText: 'Ubicación del almacén'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una ubicación de almacén';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una cantidad';
                }
                if (int.tryParse(value) == null) {
                  return 'Por favor ingresa un número válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: Text(widget.product == null
                  ? 'Agregar producto'
                  : 'Actualizar producto'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveProduct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final product = Product(
        id: widget.product?.id ?? '',
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        lotNumber: _lotNumberController.text,
        expiryDate: _expiryDate,
        purchaseDate: _purchaseDate,
        invoiceNumber: _invoiceNumberController.text,
        warehouseLocation: _warehouseLocationController.text,
        quantity: int.parse(_quantityController.text),
      );

      if (widget.product == null) {
        await _apiService.addProduct(product);
      } else {
        await _apiService.updateProduct(product);
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el producto: $e')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _lotNumberController.dispose();
    _invoiceNumberController.dispose();
    _warehouseLocationController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
