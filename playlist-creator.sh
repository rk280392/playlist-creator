for name in ./*/; do 
    echo "File -> $name"
   cd $name && rename "s/ *//g" * 
   cd /home/rajeshk/Videos/study/my-learning-videos 
done

find -type f -name "*.mp4" | sort  > my-playlist1.m3u
