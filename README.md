

## My Library: Simple-Qr:Qr Code generator
My name: Henry Walker

What I did was mess around with a Qr code generator. I've always been a big fan of qr codes so this library immediately caught my attention. Its very simple as all it does is generate a qr code. At first I was stuck because I wasn't able to generate any qr codes but everything seemed to be working correctly and it compiled fine. It was only after some snooping around that I noticed I was just making a dumb mistake and happened to be generating all the qr codes I was testing but theyre were just in a different directory I wasn't expecting. With that all sorted out I was able to see my qr codes and test them manually and they all preformed correctly. I then started messing with the parameters and was able to make large and small qr codes depending on the size I put in. Also found out how to manually specify the directory so that they didn't end up in the place I didn't want them to be. I also constructed a qr code that would take one directly to my github page. 

```
(qr-code "https://github.com/viceroyvonsalsa" "/home/henry/Desktop/mygit.png")
```

![mygit](/mygit.png?raw=true "my git")

