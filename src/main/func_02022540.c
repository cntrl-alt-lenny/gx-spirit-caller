typedef struct {
    int f0;
    char pad[0xc];
} Slot;

typedef struct {
    char pad0[0x48];
    Slot slots[256];
} Pool;

extern Pool data_02197434;

int func_02022540(int val) {
    Pool *p = &data_02197434;
    int i = 1;
    while (i < 0x100) {
        if (p->slots[i].f0 < 0) {
            break;
        }
        i++;
    }
    if (i >= 0x100) {
        return -1;
    }
    p->slots[i].f0 = val;
    return i;
}
