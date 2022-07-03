# flutter_class_8

A new Flutter project for Class 8.

## Class Content

- **Cloud Firestore**
    - Configure firebase through flutterfire and then add firebase core and cloud_firestore.
    - Set minSdkVersion to 19
    - Setup db on firebase and initialize firebase app on main.
    - To add in db use **FirebaseFirestore.instance.collection('collectionName').add(mapOfValues);**
    - To add with specific docs **FirebaseFirestore.instance.collection('collectionName').doc('docName').set(mapOfValues);**
    - To Read data use **FirebaseFirestore.instance.collection('collectionName').get();**
    - To Read data use from specific docs **FirebaseFirestore.instance.collection('collectionName').doc('docName').get();**
    - To Delete data just do same as read but instead of get use delete.

- **FutureBuilder**
    - Same as Listview.builder the main difference is FutureBuilder is async and wait for data to come.
    - It takes future which is the data to come and builder which generate screens based on data.