typedef struct { char pad34[0x34]; unsigned int value; char pad6a[0x32]; signed char active; char tail[0xd]; } Entry;
extern unsigned char data_0219b760[];
extern unsigned char data_0219b2e0[];
extern int func_02036298(int x, int arg);
extern int func_02036584(void *p, int arg);
extern int func_020364c4(unsigned int id, int (*cb)(void *, int), int arg);

int func_02036590(unsigned int id, int arg) {
    int savedArg = arg;
    unsigned char *base;
    Entry *entry;
    int i;
    unsigned int mask;
    unsigned int flag;
    int type;
    unsigned int bits;
    unsigned int value;
    if (id < 0x8f00000 || id > 0x8f0000f)
        return func_020364c4(id, func_02036584, savedArg);
    mask = 0;
    flag = 0;
    switch (id) {
    case 0x8f00000: type = 0; break;
    case 0x8f00001: type = 0x1000000; break;
    case 0x8f00005: flag = 1;
    case 0x8f00003: mask = 0x1000000;
    case 0x8f00002: type = 0x3000000; break;
    case 0x8f00004: type = -1; break;
    default: return 0;
    }
    entry = (Entry *)data_0219b760;
    base = data_0219b2e0;
    for (i = 0; i < 0x1c; i++, entry++) {
        if (entry->active < 0) continue;
        value = entry->value;
        bits = value & 0x3000000;
        if (type >= 0 && bits != type && !(bits & mask)) continue;
        if (flag && ((*(unsigned char **)(base + 0x34))[(unsigned short)value * 12 + 7] & 0x10)) continue;
        func_02036298((int)entry, savedArg);
    }
    return 1;
}









