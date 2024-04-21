set(library_name grouppropertycore)

set(CMAKE_AUTOMOC ON)

add_library(${library_name} STATIC "")
target_link_libraries(${library_name} PRIVATE MVVM::View)

target_sources(${library_name} PRIVATE
    mainwindow.cpp
    mainwindow.h
    items.cpp
    items.h
    widget.cpp
    widget.h
)

# 编译错误
# /opt/qt5.3.2/5.3/gcc_64/bin/moc -DQT_CORE_LIB -DQT_GUI_LIB -DQT_NO_DEBUG -DQT_WIDGETS_LIB \
#   -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_view -I/media/ubuntu/misc/wp/qt-mvvm-5.3/build/autogen/mvvm \
#   -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_viewmodel -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_model -I/opt/qt5.3.2/5.3/gcc_64/include -I/opt/qt5.3.2/5.3/gcc_64/include/QtWidgets -I/opt/qt5.3.2/5.3/gcc_64/include/QtGui -I/opt/qt5.3.2/5.3/gcc_64/include/QtCore -I/opt/qt5.3.2/5.3/gcc_64/mkspecs/linux-g++ -I/usr/include/c++/9 -I/usr/include/x86_64-linux-gnu/c++/9 -I/usr/include/c++/9/backward -I/usr/lib/gcc/x86_64-linux-gnu/9/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include -o /media/ubuntu/misc/wp/qt-mvvm-5.3/build/examples/groupproperty/grouppropertycore/grouppropertycore_autogen/EWIEGA46WW/moc_widget.cpp /media/ubuntu/misc/wp/qt-mvvm-5.3/examples/groupproperty/grouppropertycore/widget.h

# 编译成功
# 去掉 -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_viewmodel
# /opt/qt5.3.2/5.3/gcc_64/bin/moc -DQT_CORE_LIB -DQT_GUI_LIB -DQT_NO_DEBUG -DQT_WIDGETS_LIB \
#   -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_view -I/media/ubuntu/misc/wp/qt-mvvm-5.3/build/autogen/mvvm \
#   -I/media/ubuntu/misc/wp/qt-mvvm-5.3/source/libmvvm_model -I/opt/qt5.3.2/5.3/gcc_64/include -I/opt/qt5.3.2/5.3/gcc_64/include/QtWidgets -I/opt/qt5.3.2/5.3/gcc_64/include/QtGui -I/opt/qt5.3.2/5.3/gcc_64/include/QtCore -I/opt/qt5.3.2/5.3/gcc_64/mkspecs/linux-g++ -I/usr/include/c++/9 -I/usr/include/x86_64-linux-gnu/c++/9 -I/usr/include/c++/9/backward -I/usr/lib/gcc/x86_64-linux-gnu/9/include -I/usr/local/include -I/usr/include/x86_64-linux-gnu -I/usr/include -o /media/ubuntu/misc/wp/qt-mvvm-5.3/build/examples/groupproperty/grouppropertycore/grouppropertycore_autogen/EWIEGA46WW/moc_widget.cpp /media/ubuntu/misc/wp/qt-mvvm-5.3/examples/groupproperty/grouppropertycore/widget.h