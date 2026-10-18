typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u8 magic[4];
    u32 kind;
    u8 command;
    u8 size;
    u16 tag;
    u32 arg2;
    u32 arg1;
} Header;
extern int func_020469b4(void);
extern void *func_020498f0(void);
extern void func_02094688(const void *src, void *dst, u32 size);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
extern int func_0204d97c(int command, u32 arg1, u32 arg2, int tag, void *payload, int count);
extern u8 data_020ff96c[];
void func_02049d70(u8 *src, u32 size) {
    Header header;
    u32 payload[32];
    u32 offset = 0;
    if (func_020469b4() != 5) {
        if (func_020469b4() != 6) return;
        if (((u8 *)func_020498f0())[0x15] != 2 && ((u8 *)func_020498f0())[0x15] != 3) return;
    }
    while (offset + 20 <= size) {
        func_02094688(src, &header, 20);
        if (func_020ab054(header.magic, data_020ff96c, 4) != 0) return;
        if (header.kind != 3) return;
        func_02094688(src + 20, payload, header.size);
        if (func_0204d97c(header.command, header.arg1, header.arg2, header.tag, payload, header.size >> 2) == 0) return;
        offset += header.size + 20;
    }
}
