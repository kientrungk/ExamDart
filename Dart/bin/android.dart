import 'dart:io';

import 'package:args/args.dart';

import 'Customer.dart';
import 'CustomerService.dart';

Future<void> main(List<String> arguments) async {
  var service = CustomerService();
  var choice = '';

  do {
    print('Choose an option:');
    print('1. Add a customer');
    print('2. Get all customers');
    print('3. Exit');
    choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        await addCustomer(service);
        break;
      case '2':
        await getAllCustomers(service);
        break;
      case '3':
        exit(0);
        break;
      default:
        print('Invalid choice');
    }
  } while (choice != '3');
}


Future<void> addCustomer(CustomerService service) async {
  print('print full name:');
  var fullName = stdin.readLineSync() ?? '';

  print('print birthday (YYYY-MM-DD):');
  var birthday = stdin.readLineSync() ?? '';

  print('print address:');
  var address = stdin.readLineSync() ?? '';

  print('print phone number:');
  var phoneNumber = stdin.readLineSync() ?? '';

  var newCustomer = Customer(fullName, birthday, address, phoneNumber);

  try {
    var addedCustomer = await service.addCustomer(newCustomer);
    print('Customer added successfully:');
    print(addedCustomer.toJson());
  } catch (e) {
  }
}

Future<void> getAllCustomers(CustomerService service) async {
  try {
    var customers = await service.getAllCustomers();
    print('All Customers:');
    customers.forEach((customer) {
      print(customer.toJson());
    });
  } catch (e) {
  }
}
