# Wardrobe Management System

This is a Ruby-based wardrobe management system that allows users to add and remove items from their wardrobe, view their wardrobe, describe their overall style, and get an outfit suggestion based on their style and occasion.

## Setup

To use this program, you will need to set up an `.env` file with your OpenAI API credentials and two data files: `data/wardrobe.json` and `data/style.json`.

### .env File

Create a file called `.env` in the root directory of this project. Add the following lines to your `.env` file, replacing `YOUR_API_KEY` with your OpenAI API key:


```OPENAI_API_KEY=YOUR_API_KEY ```

to do this copy and past the following code into your terminal:

```echo "OPENAI_API_KEY=YOUR_API_KEY" > .env```

Note that you need to replace YOUR_API_KEY with your actual OpenAI API key.

### Data Files

Create a directory called `data` in the root directory of this project. Create two empty JSON files inside the `data` directory: `wardrobe.json` and `style.json`. Note that the `data` directory and its contents are excluded from version control using the `.gitignore` file. This means that any data you store in these files will not be pushed to GitHub. Copy and past this into terminal to do so:

```mkdir data && touch data/wardrobe.json && touch data/style.json && echo "{}" > data/wardrobe.json && echo "{}" > data/style.json```


## Usage

To use this program, run the `main.rb` file from the command line. The program will display a menu of options:

1. Add an item to your wardrobe
2. Remove an item from your wardrobe
3. View your wardrobe
4. Describe your overall style
5. Get an outfit suggestion
6. Exit

Follow the prompts to add or remove items from your wardrobe, view your wardrobe, describe your overall style, or get an outfit suggestion. When you are finished using the program, choose option 6 to save your wardrobe data to the `wardrobe.json` file and exit the program.

If you have any trouble with this program, chatgpt is sure to help.