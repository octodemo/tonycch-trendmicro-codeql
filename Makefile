CC := gcc
TARGET := main
CFLAGS := -g -MD

SRCS := $(wildcard *.c)
OBJS = $(patsubst %.c, %.o, $(SRCS))
DEPS = $(patsubst %.o, %.d, $(OBJS))

all:$(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY:clean distclean
clean distclean:
	rm -rf $(TARGET) $(OBJS) $(DEPS)

-include $(DEPS)
