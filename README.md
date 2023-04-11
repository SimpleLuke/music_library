# music_library

This application is designed to manage a music library. You can choose between two options to list all albums or all artists.

To run the application, execute the following command:

```
ruby app.rb
```

When the application is running, it will display a menu with two options:

1. List all albums
2. List all artists

Enter the number of the option you want to execute and press enter. Then, the application will display the list of albums or artists.

The Application class is initialized with a database name, IO object, and instances of AlbumRepository and ArtistRepository. These repositories are responsible for managing interactions with the database.

The run method displays the welcome message, menu options, and accepts user input. Depending on the user's input, the application either displays a list of all albums or all artists.
