extern void *func_ov002_0229da60(void *, int);

void *func_ov002_022a6324(char *base, int idx, int type, int sub) {
    unsigned s;
    switch (type) {
    case 12:
    case 13:
    case 14:
    case 15:
        if (type < 12) {
            return 0;
        }
        return base + 0x280 + idx * 0xb0 + (type - 12) * 0x2c;
    case 11:
        return func_ov002_0229da60(base + 0x3e0 + idx * 0xcc, sub);
    }
    s = type + sub;
    if (s <= 10) {
        return base + idx * 0xdc + s * 0x14;
    }
    if ((unsigned)type > 4) {
        return 0;
    }
    return base + 0x1b8 + idx * 0x64 + type * 0x14;
}
