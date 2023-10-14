import 'dart:io';

import 'package:bookstore/booklist.dart';

class Book{

  late String id, name, author, category;
  late int noCopies;
  late double price;


  Book({required this.id, required this.name, required this.author, required this.category, required this.price, required this.noCopies});

  Map<String, dynamic> bookMap(){
    return{
      'id': id, 'name': name, 'author': author, 'category': category, 'price': price, 'noCopies': noCopies};
  }
  printBook(){
    print("id: $id, book name: $name, author: $author, category: $category, price: $price, no. of copies: $noCopies");
  }


  

displayBooks(){

  print("=====================================================");
  print("The available books at the bookstore are as following: ");
  print("=====================================================");
  List<Book> objectList= [];
  
  for (var element in booklist) {
     Book book = Book(id: element["id"], name: element["name"], author: element["author"], category: element["category"], price: element["price"], noCopies: element["noCopies"]);
     objectList.add(book);
  }

  for (var object in objectList) {
    object.printBook();    
  }

  print("=====================================================");

}

searchBook(){
String? bookSearch;

print("====================================");
print("Enter book name, author or category:");
print("====================================");
bookSearch = stdin.readLineSync()!;


for (var element in booklist) {
  try {
    if (element['name'].contains(bookSearch) || element['author'].contains(bookSearch) || element['category'].contains(bookSearch)) {
    print("====================================");
    print("book found! ");
    print("====================================");
    print("Book id: ${element['id']}");
    print("Book name: ${element['name']}");
    print("Book author: ${element['author']}");
    print("Book category: ${element['category']}");
    print("Book price: ${element['price']}");
    print("Book number of copies: ${element['noCopies']}");
    print("=============================");
    print("\n");
  }
    
  } catch (e) {
    print("Book not found!");
  }
  
}

}
  


addNewBook(){
String? bookID, bookName, bookAuthor, bookCategory;
double? bookPrice;
int? bookCopies;

    print("=============================");
    print("Enter book data: ");
    print("============================="); 
    print("enter book ISBN: ");
    bookID =  stdin.readLineSync()!;
    print("enter book name: ");
    bookName = stdin.readLineSync()!;
    print("enter book author: ");
    bookAuthor = stdin.readLineSync()!;
    print("enter book category: ");
    bookCategory = stdin.readLineSync()!;
    print("enter book price: ");
    bookPrice = double.parse(stdin.readLineSync()!);
    print("enter book number of copies:");
    bookCopies = int.parse(stdin.readLineSync()!);
    print("=============================");
Book newBook = Book(id: bookID, name: bookName, author: bookAuthor, category: bookCategory, price: bookPrice, noCopies: bookCopies);
booklist.add(newBook.bookMap());
print("Book added succesfully!");
}

deleteBook(){///////// problem to print deleted book from list
  
    print("====================================");
    print("Enter book id you want to delete or enter to return");
    print("===================================="); 


    String? bookID = stdin.readLineSync();

        booklist.removeWhere((element) => element.containsValue(bookID));
        print(" book removed sucessfully! ");
        print("===================================="); 
  
    }
    

purchase(){
  print("=======================================================");
    print("Enter book id you want to purchase or enter to return");
    print("====================================================="); 

    String? bookID = stdin.readLineSync();
    int? copiesAvilable, copiesBuy;


    for (var element in booklist) {
      if (element['name'].contains(bookID)){
        int? copiesAvilable = int.parse(element['noCopies']);

        if (copiesAvilable>0) {
          print("enter how many copy you need");
          copiesBuy = int.parse(stdin.readLineSync()!);
          copiesAvilable -= copiesBuy;
          print("book purchase is done, thank you");
          // here i had a problem with entering this if statement to enter no. of copies
        }
      }
      
    }


}

printInvoice(){}


}



  





