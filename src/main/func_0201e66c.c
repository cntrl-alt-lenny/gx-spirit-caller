extern void func_02092904(const void *, unsigned int);
extern void func_02090114(void);
extern void func_020900a0(const void *, unsigned int, unsigned int);
extern void func_02090048(void);
extern void func_02090330(void);
extern void func_020901cc(const void *, unsigned int, unsigned int);
extern void func_0209015c(void);

typedef struct Header {
    unsigned char pad[12];
    unsigned short offset, count;
} Header;
typedef struct Block {
    unsigned int tag, length;
    unsigned char format, width, height, pad;
    int extra, size;
} Block;

int func_0201e66c(Header *file, int texture, int palette) {
    int count = file->count;
    Block *block = (Block *)((char *)file + file->offset);
    int i;
    for (i = 0; i < count; i++) {
        if (block->tag != 0x45474d49) {
            if (block->tag == 0x544c4150) {
            int size = *(int *)((char *)block + 8) * 2;
            if (size != 0 && palette >= 0) {
                func_02092904((char *)block + 12, size);
                func_02090114();
                func_020900a0((char *)block + 12, palette, size);
                func_02090048();
            }
            }
        } else {
            unsigned int size = block->size;
            char *data = (char *)block + 20;
            if (size != 0 && texture >= 0) {
                if (block->format == 5) {
                    int width = 1 << (block->width + 3);
                    int height = 1 << (block->height + 3);
                    unsigned int originalSize = size;
                    size = width * height / 4;
                    func_02092904(data, originalSize);
                    func_02090330();
                    func_020901cc(data, texture, size);
                    func_020901cc(data + ((size + 3) & ~3), (unsigned int)texture < 0x20000 ? ((unsigned int)texture / 2 + 0x20000) : (((unsigned int)texture - 0x40000) / 2 + 0x30000), (int)size / 2);
                    func_0209015c();
                } else {
                    func_02092904(data, size);
                    func_02090330();
                    func_020901cc(data, texture, size);
                    func_0209015c();
                }
            }
        }
        block = (Block *)((char *)block + block->length);
    }
    return 0;
}





