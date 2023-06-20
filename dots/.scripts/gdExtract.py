import sys, re

link = str(sys.argv[1])

# extracts the unique ID of the image/file
x = re.search(r"\bd\/\w+[^/]([A-Za-z0-9-_])*", link)
print("https://drive.google.com/uc?export=view&id="+x.group()[2:])
