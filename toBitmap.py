import argparse
from PIL import Image

def writePixel(data, handle):
    handle.write("{0} {1} {2}\n".format(hex(data[0])[2:], hex(data[1])[2:], hex(data[2])[2:]))

def main(path, output):
    icon = Image.open(f'{path}')
    width, height = icon.size
    print(width, height)

    with open(f"{output}", "w") as file:
        for column in range(0, width):
            for row in range(0, height):
                writePixel(icon.getpixel((column, row)), file)
        file.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'Get the bitmap of an RGB image!')
    parser.add_argument('--i', default='icon.png', required=True, type=str,  help='The input filename of the original image. Example: --i "icon.png"')
    parser.add_argument('--o', default='bitmap.txt', required=True, type=str, help='The output filename of the text file. Example: --o "bitmap.txt"')

    args = parser.parse_args()
    path, output = args.i, args.o

    main(path, output)