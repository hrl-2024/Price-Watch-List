Original App Design Project - README Template
===

# Price Watch List

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that can compare prices from different online shopping website. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Online Shopping
- **Mobile:** primarily mobile
- **Story:** App searches the items on multiple websites (preferably website with API provided) and displays them from lowest to highest prices.
- **Market:** US citizens
- **Habit:** This app that can minimize the shopping time and optmize users' purchasing powers. (the lower the prices, the more you can purchase)
- **Scope:** Nationwide (US)

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories

* Users can type in an item they want.
* Users can see the prices for the item from multiple websites.
* Users can see the customer reviews from multiple websites.
* Users can add the item to the item watch list
* Users can log in to store the watch list
* Users stays sign-in if they had signed in before

**Optional Nice-to-have Stories**

* Search based on contraints. Ex: blue dress must display dress that is blue-colored.
* If API allows, User can buy the item directly from our app
* Users can also see the prices from the foreign shopping websites
* The app will convert the prices based on the current currencies.
* User can set a threshold for an item. App can notify the user when the item drops below the threshold.

### 2. Screen Archetypes

* Main Screen
   * a text field for the user to type in the product they want.
* Search-result Screen
    * A table view for all the items that matches the user's description. Display them from lowest price to highest price.
        * each table have a picture of the item + price + which website this item is from
    * A slider for the price range displayed (also a text field type in the lower and upper bound for the price)
* Item Page
    * An image view for the item
    * An image view for the website this item from (ex: Amazon)
    * A link for which the item is found
    * A button that brings up an UI for the user to set a threshold.
    * Some general indormation: reviews, prices, number of items avaliable
* Watch list
   * A table view for all items the user has added to the shopping list
* Log-in Page (Optional Feature)
    * Just like the Twitter app. A screen for log-in and sign-up

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* A tab that navigates the user to a new screen where items are ranked by prices.
* A tab that navigates to the user's watch list

**Flow Navigation** (Screen to Screen)

* Type in the item -> Search-result Screen
    * -> the price range slider(or text field)
    * -> Item Page

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/8iIHtyd.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
| Property |  Type  | Description |
|----------|--------|-------------|
| UserId   | String | unique Id for each user|
| ObjectId | String | Id for the item which the user has added to the watch list|
| set_Price| Double | the threshold price for an item, set by the user|
| current_Price| Double | the current price for an item, updated from the website |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

* Main Screen
    * No networking request needed
* Search-result Screen
    * (Search/Display) Search for the item user typed in and display them out
    * (Read/GET) Using the Rainforest API to get the item user searched for and parse the data from the .JSON returned
* Item Page
    * (Read/GET) Get the item URL first from the Search-result screen
    * (Read/GET) From the URL, make another request to Rainforest API to get the item detail JSON file and parse it (product name, image, price, rating, or anything we decide later to include)
* Watch list
    * (Create)
        * create a table cell for the product user added to their watch list
        * can be done locally by using UserDefault
    * (Delete) 
        * remove the table cell
        * ask for help on how to remove items during breakout session
    * (Read/Get)
        * grab the URL of the product from UserDefault and use Rainforest API to grab the image and the current price of the product
* Log-in Page (Optional Feature)
