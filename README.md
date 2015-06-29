# Ekko
Ekko is an OS X App with a Firebase backend that allows you to share webpages with your friends instantly by bumping the window against the right side of your screen. Ekko's you share will open up on your friends' screens in realtime. Ekko was a top 10 hack at Greylock Hackfest 2015!

# Features
Focus mode: Allows you to continue to share link, but blocks EKko's from coming in from your friends. Perfect for when you're busy and don't want to be distracted.

Notifications: Have the option for a desktop notification to be shown when you receive an Ekko or not.

Mute Sound: Mutes the sound when an Ekko comes in.

# How To Use
Under "Login & Auth" in your Firebase backend, turn on Email and Password authentication, and add an email and password login.
In ```AppDelegate.swift```, when creating your Firebase endpoint, specify the link for your backend:

```Swift
    var myRef = Firebase(url:"https://YOUR_FIREBASE_HERE.firebaseio.com")
```

Additionally, fill in your email and username with the login you set up in your Firebase.

```Swift
func authWithPassword() {
        myRef.authUser("YOUR_EMAIL_HERE", password: "YOUR_PASSWORD_HERE",
            withCompletionBlock: {error, authData in
                
                if error != nil {
                    //error logging in
                }
                else {
                    //now logged in
                }
        });
        firebaseListener()
    }
```

Then simply package out the .app, and share with your friends!

