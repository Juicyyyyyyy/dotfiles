from PIL import Image, ImageFilter
import os
import subprocess


def get_screen_resolution():
	output = subprocess.check_output(['xrandr']).decode()
	for line in output.splitlines():
		if '*' in line:
			parts = line.strip().split()
			return tuple(map(int, parts[0].split('x')))
	return (1920, 1080)


res = os.popen("cat ~/.config/nitrogen/bg-saved.cfg | grep -o 'file=.*' | cut -f2- -d=").read().strip()
WALLPAPER = res

CACHE_DIR = os.path.expanduser('~/.config/wallpapers/i3lock')
os.makedirs(CACHE_DIR, exist_ok=True)

base_name = os.path.splitext(os.path.basename(WALLPAPER))[0]
CACHED_BLURRED = os.path.join(CACHE_DIR, f'blurred_{base_name}.png')
print(CACHED_BLURRED)

if not os.path.exists(CACHED_BLURRED):
	RESOLUTION = get_screen_resolution()
	img = Image.open(WALLPAPER).resize(RESOLUTION, Image.Resampling.LANCZOS)
	img = img.filter(ImageFilter.GaussianBlur(radius=8))
	img.save(CACHED_BLURRED)

subprocess.run(['i3lock', '-i', CACHED_BLURRED])
