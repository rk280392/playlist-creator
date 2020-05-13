Goal :
So the goal was to create a playlist of my learning videos, so I won’t have to open the files manually in VLC.

Challenges:
So the challenges were:
1 – The names of filenames were having spaces, and special characters like square brackets [] and commas ‘.
2 – Files were placed in subdirectories and directories were having various text files as well.
3 – Finding a way to create a playlist that can run in VLC.

Solution:
I did not want to use UI to do this, as it would be time-consuming and moreover a boring task.
So I wrote a shell script to do this for me.
First was to rename directories and files to remove spaces.
There is very good utility ‘rename’ for this.
The rename utility renames given files by substituting the first occurrence of expression in their name by replacement.
The rename command comes preinstalled in most Unix-like operating systems. If it is not available by default, run the following command to install it on Debian-based systems:

$ sudo apt install rename -y
$ ls
abcd1.txt abcd2.txt abcd3.txt
$ rename 's/abc/xyz/' *
Above commd rename files starting with abcd to xyz.
Similarly we can use this to remove spaces.

$ rename "s/ *//g" *
Now i knew how to remove spaces from my files and directories, next was to make sure it does automatically to all the files and subdirectories.
For that I wrote a shell script in the root folder under which all of my files resides.
My directory structure some what looked like this.


So the wrote a script in the root directory of current structure i.e my-learning videos.

rename "s/ *//g" *
for name in ./*/; do 
   echo "File -> $name"
   cd $name && rename "s/ *//g" * 
   cd /home/rajeshk/Videos/study/my-learning-videos 
done
First line renames directories in present directoy.
Then for loop starts “for name in ./*/; ” lists all directories in present directory.
After that cd into the directoy and rename the files and directories under it and then get back to the root directory.
This will remove spaces from the file names.

Next step was to create a playlist.
It turns out that there exists a fairly universal format called m3u format, and it can be as simple as a list of filenames separated by newlines.
VLC does support this, so I just have to put the names of all my .mp4 files in a file name in .m3u format.

$ find -type f -name "*.mp4" | sort > my-playlist1.m3u
This did the trick for me.
