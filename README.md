# Readview
Readview is a mobile application that allows you to store and review your favorite quotes and notes from books. The name is a combination of "read" and "review", reflecting the app's goal of helping you review the content you read in books.

## Technologies Used
Previously, this app used a custom backend prepared using Python's FastAPI library and hosted on Heroku. However, due to the cost associated with hosting on Heroku, the backend has been replaced with a local JSON file acting as an API. The file contains all the quotes and related metadata, including book and author information. The app reads the JSON file and dynamically populates the quotes into various screens such as the Daily Review, Books, Authors, and Favorites. 

## Features and Functionalities
  1. Daily Review: View some of your saved quotes and notes at random to keep them fresh in your memory.
  2. Books: Browse and select the books that you have saved quotes and notes for.
  3. Authors: Browse and select the authors that you have saved quotes and notes for.
  4. Favorites: Access your favorite quotes and notes.

## App Demonstration Video
https://drive.google.com/file/d/1rSjEPigggeWE2vvQbEz4ERhE4T7hD5b6/view?usp=share_link

## Screens

<div style="overflow-x:auto;">
  <table style="height: 400px;">
    <tr>
      <th>Home</th>
      <th>Daily Review</th>
      <th>Books</th>
      <th>Authors</th>
    </tr>
    <tr>
      <td><img src="https://user-images.githubusercontent.com/40627412/224575483-f9fda0e0-3c69-4399-894b-5dc9e3512f16.png" height="400"></td>
      <td><img src="https://user-images.githubusercontent.com/40627412/224575511-e8215379-0453-4785-bf72-799f223f0267.png" height="400"></td>
      <td><img src="https://user-images.githubusercontent.com/40627412/224575542-66e38210-7ba7-4258-bb0f-acbb6a8df623.png" height="400"></td>
      <td><img src="https://user-images.githubusercontent.com/40627412/224575574-940ba4dd-0b7c-4ada-84aa-aa25f73e8e6e.png" height="400"></td>
    </tr>
  </table>
</div>
