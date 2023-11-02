#!/bin/bash
unzip opencv.zip && unzip opencv_contrib.zip && \
mkdir -p build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=NO \

    -DCMAKE_INSTALL_PREFIX=/opt/opencv -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_java=OFF \
    -DBUILD_opencv_python=OFF -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.x/modules \
    ../opencv-4.x && \
make -j$(nproc) && sudo make install && \
cd .. && sudo rm -rf opencv-4.x opencv_contrib-4.x build

# cmake -DEXECUTABLE_OUTPUT_PATH:PATH=$(pwd) \
#     -DCMAKE_BUILD_TYPE=RELEASE \
#     -DCMAKE_INSTALL_PREFIX=/usr/local \
#     -DBUILD_JASPER=ON \
#     -DBUILD_JAVA=OFF \
#     -DBUILD_JPEG=ON \           #编译opencv 3rdparty自带的libjpeg
#     -DBUILD_PERF_TESTS=OFF \
#     -DBUILD_PNG=ON \            #编译opencv 3rdparty自带的libpng
#     -DBUILD_PROTOBUF=ON \       #编译opencv 3rdparty自带的libprotobuf
#     -DBUILD_SHARED_LIBS=NO \    #编译成静态库
#     -DBUILD_TESTS=OFF \
#     -DBUILD_TIFF=ON \           #编译opencv 3rdparty自带的libtiff
#     -DBUILD_ZLIB=ON \           #编译opencv 3rdparty自带的libzlib
#     -DBUILD_WEBP=ON \           #编译opencv 3rdparty自带的libwebp
#     -DBUILD_opencv_apps=OFF \
#     -DBUILD_opencv_core=ON \
#     -DBUILD_opencv_calib3d=ON \
#     -DBUILD_opencv_dnn=ON \
#     -DBUILD_opencv_features2d=ON \
#     -DBUILD_opencv_flann=ON \
#     -DBUILD_opencv_gapi=OFF \
#     -DBUILD_opencv_highgui=ON \
#     -DBUILD_opencv_imgcodecs=ON \
#     -DBUILD_opencv_imgproc=ON \
#     -DBUILD_opencv_java_bindings_generator=OFF \
#     -DBUILD_opencv_js=OFF \
#     -DBUILD_opencv_ml=ON \
#     -DBUILD_opencv_objdetect=OFF \
#     -DBUILD_opencv_photo=OFF \
#     -DBUILD_opencv_python2=OFF \
#     -DBUILD_opencv_python3=OFF \
#     -DBUILD_opencv_python_bindings_generator=OFF \
#     -DBUILD_opencv_stitching=OFF \
#     -DBUILD_opencv_ts=OFF \
#     -DBUILD_opencv_video=OFF \
#     -DBUILD_opencv_videoio=OFF \
#     -DWITH_GTK=OFF \
#     -DWITH_GTK_2_X=OFF \
#    -DWITH_LAPACK=OFF \