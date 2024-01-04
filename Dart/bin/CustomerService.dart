import 'Customer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class CustomerService{
  final String baseUrl = 'http://localhost:8080/customers';

    Future<List<Customer>> getAllCustomers() async {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Customer.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load customers');
      }
    }

Future<Customer> addCustomer(Customer customer) async {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(customer.toJson()),
      );
      if (response.statusCode == 201) {
        return Customer.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to add customer');
      }
    }

}