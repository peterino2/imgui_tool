CC = clang++
CFLAGS = -g -Wall -Wpedantic -std=c++20
PROG_NAME = imgui_tool

LIB_SEARCH_PATH = -Lsource/lib/sdl2/lib/x64
LIB_SEARCH_PATH +=  -L/usr/local/lib/
LIB_SEARCH_PATH +=  -L/opt/homebrew/lib/

INCLUDE_PATH = -Isource/

INCLUDE_PATH += -Isource/lib/imgui
INCLUDE_PATH += -Isource/lib/imgui/backends

INCLUDE_PATH += -Isource/lib/sdl2/include/
INCLUDE_PATH += -Isource/lib/glad/include/

LINKED_LIBRARIES = -lSDL2 -lm -lpthread 

SANITIZER = -fsanitize=address -fno-omit-frame-pointer

IMGUI_SRC = source/lib/imgui/imgui.cpp
IMGUI_SRC += source/lib/imgui/imgui_demo.cpp
IMGUI_SRC += source/lib/imgui/imgui_draw.cpp
IMGUI_SRC += source/lib/imgui/imgui_tables.cpp
IMGUI_SRC += source/lib/imgui/imgui_widgets.cpp
IMGUI_SRC += source/lib/imgui/backends/imgui_impl_sdl2.cpp
IMGUI_SRC += source/lib/imgui/backends/imgui_impl_sdlrenderer2.cpp

all: 
	mkdir build/; echo "building..."
	$(CC) source/main.cpp $(CFLAGS) -o build/$(PROG_NAME) $(SANITIZER) $(LINKED_LIBRARIES) $(LIB_SEARCH_PATH) $(INCLUDE_PATH) $(IMGUI_SRC)

clean:
	rm -rf build/
