rocker-box
==========

simple a/b routing for static pages

1. Create a folder to fill with static assets (or use "statics", which I provided)
2. To serve from flat html files in your ```:statics_folder```, set the value of ```:deep_or_flat_structure``` to ```'flat'``` in the init method
3. To serve from folders with proper ```index.html``` files, set the value of ```:deep_or_flat_structure``` to ```'deep'``` in the init method
4. The app will reset its pool on restart, so take the server down and bring it back up to add more to the pool


*This software is provided without any warantee or guarantees of any sort.*
*If you use this library in your works, I only ask that you provide a link to this github repo so others can find it too!*
