# fraudemail
api for fraudemail.com checking email service
# Example
```nim
import asyncdispatch, fraudemail, json
let email_data = waitFor check_email("email")
echo email_data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
