typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u8 pad0[0x3c];
    u16 active;
    u8 pad3e[6];
    u32 field44;
    u8 pad48[8];
    u8 payload[8];
} Entry;
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern void func_020928e8(void *ptr, unsigned int size);
int func_020a6924(Entry *entry) {
    u16 data[4];
    if (entry == 0) return 0;
    if (entry->active == 0) return 0;
    func_02094688(entry->payload, data, 8);
    func_020928e8(data, 8);
    if (entry->field44 == 0 && (*(volatile u16 *)data == 0x2348 || *(volatile u16 *)data == 0xbd8a)) {
        if (data[3] == 4) return 1;
    }
    return 0;
}

