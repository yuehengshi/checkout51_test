# checkout51_test
1.  I'm using the MVVM 

2.  Model

    A.  I uploaded the json file to Firebase Storage, and I'm chose "Alamofire" to do the network request 
    
    B.  I used Codable Struct to decode json data to format it
    
3.  View
    A.  I used the UITableViewController and UINavigationController as the controller of the offer list
    
    B.  UITableCell
    
        a.  At first, I just created a simple layout to show the image, name and cashback, then after I got the basic features done, I started to rebuild the UI to mimic the Checkout 51 App
        
        b.  I noticed that in the c51, cell's height is dynamic based on the content(UILabels), the "Select Stores" and "Claim up to x times" have a fixed position, whereas the name and cashback are centered and they can have multiple lines. There is a grey gap between each cell. The image's width is fixed.
        
        c.  Based on the info I found, I used the UIView to contain all the content inside the cell. I used the StackView to contain the name and cashback to ensure they are vertically centered in the cell and ensure the cell's height is updating with the stackview's height
        
4.  ViewModel

    A.  Used the delegate to connect the View and ViewModel
    
    B.  Included the sort functions in the ViewModel

5.  Image Loader

    I used Nuke as image loader and cache

6.  Sort

    A.  I added a sort button on the nav bar and popup an actionsheet of sort options
    
    B.  I encapsulated the sort functions into the "OfferUtilities"

7.  Theme Colour

    I'm not sure the exact color value of c51 green, so I just used a tool to analyse the green on the app icon and use this green inside the app(navigation bar, button)
    
    
   
