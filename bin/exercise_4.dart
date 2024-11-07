// Importing necessary packages
import 'dart:convert'; // This package is used for decoding JSON data
import 'package:http/http.dart'
    as http; // 'http' package for making HTTP requests

// And here is the main function, entry point of the Dart application
void main() async {
  // Calling the function to fetch user data asynchronously
  await fetchUsers();
}

// Function to fetch user data from the API
Future<void> fetchUsers() async {
  // Define the URL for the random user data API with a parameter to get 10 users
  final url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');

  try {
    // Await the HTTP GET request and store the response
    final response = await http.get(url);

    // Check if the HTTP request was successful (status code 200)
    if (response.statusCode == 200) {
      // Decode the JSON data to a List of Map objects
      List<dynamic> users = jsonDecode(response.body);

      // Loop through each user in the list
      for (var user in users) {
        // Extract uid, first name, and last name from each user map
        final uid = user['uid'];
        final firstName = user['first_name'];
        final lastName = user['last_name'];

        // Print a single string containing the user's uid, first name, and last name
        print('User ID: $uid, Name: $firstName $lastName');
      }
    } else {
      // If the response code is not 200, print an error message
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Catch any errors and print an error message
    print('An error occurred: $e');
  }
}
