# Wonders of the World 🌍✨

Welcome to the **Wonders of the World** project! This application presents detailed information about the seven wonders of the world, divided into three categories: The Old 7 Wonders, The New 7 Wonders, and The 7 Natural Wonders. It is built using XML to structure and validate the data and uses XSLT to transform the XML data into HTML for display in the browser. Created in collaboration with Hristina Gadzheva.

## Project Overview 🏛️🌏

The goal of this project is to provide future tourists with a comprehensive resource, containing all the necessary information about the world's wonders in one place. This will save time and effort for tourists searching through multiple websites. Additionally, each wonder is paired with nearby attractions, making it easier to plan a full trip.

### Key Features:
- **Detailed Information**: Each wonder includes historical background, geographical location, entry fees, and other interesting facts.
- **Nearby Attractions**: Suggestions for other notable attractions around each wonder.
- **Search and Sort**: Easily find wonders by category, location, or name.

### Categories of Wonders:
- **The Old 7 Wonders of the World** 🏯
- **The New 7 Wonders of the World** 🏰
- **The 7 Natural Wonders of the World** 🌲

### Technologies Used 💻🛠️
- **XML**: Structuring and validating the data.
- **DTD and XML Schema**: Ensuring well-formed and structured data.
- **HTML & CSS**: Displaying the data on the web.
- **XSLT**: Transforming XML data into HTML.
- **Python**: Running a local server for serving the content.

## Running the Project 🚀

To run this project on your local machine, follow these steps:

### 1. Clone the Repository:
```bash
git clone https://github.com/your-username/wonders-of-the-world.git
2. Install Python (if not already installed):
If you don’t have Python installed, download it first.

3. Start the Python HTTP Server:
Once the repository is cloned, navigate to the project directory in your terminal/command prompt and run the following command to start a local Python server:

python -m http.server 8000

This command will start a server on http://localhost:8000/ where you can view the project.

4. Access the Project in Your Browser:
Open your browser and go to:
http://localhost:8000
You should see the project live, and you can start exploring the different wonders!
```

## Project Structure 📁
```plaintext
wonders-of-the-world/
├── data.xml                # XML file containing the main data for the wonders
├── mathml.xsd              # XML Schema Definition for the data.xml file
├── README.md               # Project documentation (this file)
├── wonders_of_the_world.css # CSS file for styling the pages
├── wonders_of_the_world.xml # Main XML data file
├── wonders_of_the_world.xsd # XML Schema Definition for wonders_of_the_world.xml
├── wonders_of_the_world.xsl # XSLT file for transforming XML to HTML
│
├── images/                 # Folder containing images
│   ├── site_background.jpg # Background image for the site
│   ├── natural_wonders/    # Folder for natural wonders images
│   │   ├── grand_canyon1.jpg
│   │   ├── great_barrier_reef1.jpg
│   │   ├── harbour_of_rio_de_janeiro1.jpg
│   │   ├── mount_everest1.jpg
│   │   ├── northern_lights1.jpg
│   │   ├── paricutin1.jpg
│   │   ├── victoria_falls1.jpg
│   ├── new_wonders/        # Folder for new wonders images
│   │   ├── chichen_itza1.jpg
│   │   ├── colosseum1.jpg
│   │   ├── great_wall_of_china1.jpg
│   │   ├── machu_picchu1.jpg
│   │   ├── petra1.jpg
│   │   ├── statue_of_christ_the_redeemer1.jpg
│   │   ├── taj_mahal1.jpg
│   └── old_wonders/        # Folder for old wonders images
│       ├── colossus_of_rhodes1.jpg
│       ├── hanging_gardens_of_babylon1.jpg
│       ├── lighthouse_of_alexandria1.jpg
│       ├── mausoleum_at_halicarnassus1.jpg
│       ├── pyramid_giza1.jpg
│       ├── statue_of_zeus_at_olympia1.jpg
│       └── temple_of_artemis1.jpg
```

## UI 📸
- ![](image_url)# Wonders-of-the-World-Catalog
