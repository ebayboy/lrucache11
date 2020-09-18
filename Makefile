
CC := g++

TARGET	:= SampleMain LRUCache11Test 
#VectorKeyTest

DEFINES :=
LIBS	:= -L.
INCLUDE := -I.
LDFLAGS := -lpthread
CFLAGS	:= -c -std=c++17 -Wall

############## add self define  ######################

#DEFINES +=
#LIBS	+= 
#INCLUDE +=
#LDFLAGS +=
#CFLAGS	+= 

############## add self define  ######################

DEBUG=n
CONV=n

ifeq ($(DEBUG),y)
	CFLAGS += -g -O0
else
	CFLAGS += -O3 -g2
endif

ifeq ($(CONV),y)
	INCLUDE+= -I /usr/local/libiconv/include
	LIBS+= -L /usr/local/libiconv/lib

	CFLAGS += -fprofile-arcs -ftest-coverage
	LDFLAGS += -lgcov
endif

CXXFLAGS:= -DHAVE_CONFIG_H $(CFLAGS) $(DEFINES) $(INCLUDE)

.PHONY : clean all 

all : $(TARGET)

clean:
	rm -fr $(TARGET) $(OBJS)

SampleMain	:  SampleMain.cpp
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

LRUCache11Test : LRUCache11Test.cpp
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

VectorKeyTest : VectorKeyTest.cpp
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)
