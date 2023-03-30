Wardrobe Management System

This is a Ruby-based wardrobe management system that allows users to add and remove items from their wardrobe, view their wardrobe, describe their overall style, and get an outfit suggestion based on their style and occasion.

Setup

To use this program, you will need to set up an .env file with your OpenAI API credentials and two data files: data/wardrobe.json and data/style.json.

.env File
Create a file called .env in the root directory of this project.
Add the following lines to your .env file, replacing YOUR_API_KEY with your OpenAI API key:
makefile
Copy code
OPENAI_API_KEY=YOUR_API_KEY
Data Files
Create a directory called data in the root directory of this project.
Create two empty JSON files inside the data directory: wardrobe.json and style.json.
Note that the data directory and its contents are excluded from version control using the .gitignore file. This means that any data you store in these files will not be pushed to GitHub.

Usage

To use this program, run the main.rb file from the command line. The program will display a menu of options:

Add an item to your wardrobe
Remove an item from your wardrobe
View your wardrobe
Describe your overall style
Get an outfit suggestion
Exit
Follow the prompts to add or remove items from your wardrobe, view your wardrobe, describe your overall style, or get an outfit suggestion. When you are finished using the program, choose option 6 to save your wardrobe data to the wardrobe.json file and exit the program.

