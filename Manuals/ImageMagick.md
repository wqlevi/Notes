# Manual of Imagemagick
## Simplistic usages
refer to the official [link](https://legacy.imagemagick.org/Usage/)
### Rotate image
```bash
$ convert image_in.png -rotate [DEGREE] image_out.png
```

### Crop & Chop image
```bash
# 1. crop
# Note: [SIZE]: could be WIDTH+HEIGHT+W_OFFSET+H_OFFSET or PERCENTAGE of original size
$ convert image_in.png -gravity [DIRECTION: East, West, North, South] -crop [SIZE] image_out.png

# 2. chop
# Same usage as above
$ convert image_in.png -gravity [DIRECTION] -chop [SIZE] image_out.png
```

### Add border 
```bash
# Usage: [SIZE] is in form of: WxH
#        [COLORNAME] could also be hexadecimal(e.g. enclosed by '#FFE15D' or 'rgb(0,255,255)' )
$ convert image_in.png -bordercolor [COLORNAME] -border [SIZE] image_out.png
```
