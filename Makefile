# Makefile

# 資料夾設定
SRC_DIR := src-a
INC_DIR := inc-a
BUILD_DIR := build

# 來源檔與目標檔
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRCS))

# 編譯器與選項
CC := gcc
CFLAGS := -I$(INC_DIR) -Wall -Wextra -O2

# 最終執行檔名
TARGET := $(BUILD_DIR)/main

# 預設目標
all: $(TARGET)

# 建立 build/ 目錄
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# 編譯成可執行檔
$(TARGET): $(BUILD_DIR) $(OBJS)
	$(CC) $(OBJS) -o $@

# 編譯物件檔
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清除編譯產物
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

