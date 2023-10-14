

import 'dart:io';

import 'package:bookstore/book.dart';

void main(List<String> arguments) {

  bool run = true;
  String numSelected = "";
  Book book = Book(id: "id", name: "name", author: "author", category: "category", price: 0, noCopies: 0);
  
  

  

  while (run) {
    print("Welcome to My Bookstore! \n Please select a number from the list bellow, or type q to exit");

    print("1: Display available books at the bookstore.");
    print("2: Search a book at the bookstore.");
    print("3: Add new book to the bookstore.");
    print("4: Delete a book from the bookstore.");
    print("5: Purchase from the bookstore.");
    print("6: Print invoice");
    print("q: end");
    print("=============================================");
    
    numSelected = stdin.readLineSync()!;

    switch(numSelected){
      case '1':
      book.displayBooks();
      break;

      case '2':
      book.searchBook();
      break;

      case '3':
      book.addNewBook();
      break;

      case '4':
      book.deleteBook();
      break;

      case '5':
      book.purchase();
      break;

      case '6':
      book.printInvoice();
      break;

      case 'q':
      print("Thank you for visiting see you later!");
      exit(0);

    }



  }
}
