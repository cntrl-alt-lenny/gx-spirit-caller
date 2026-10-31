typedef struct {
    unsigned char pad0[0x3c];
    unsigned short field3c;
    unsigned char pad3e[6];
    int field44;
    unsigned char pad48[8];
    unsigned char field50[8];
} Entry;
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern void func_020928e8(void *addr, int len);
int func_020a6924(Entry *p) {
    unsigned short data[4];
    if (p == 0) return 0;
    if (p->field3c == 0) return 0;
    func_02094688(p->field50, data, 8);
    func_020928e8(data, 8);
    if (p->field44 == 0) {
        if (((volatile unsigned short *)data)[0] == 0x2348 || ((volatile unsigned short *)data)[0] == 0xbd8a) {
            if (data[3] == 4) return 1;
        }
    }
    return 0;
}

