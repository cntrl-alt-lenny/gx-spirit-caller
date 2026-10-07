typedef struct {
    int field0;
    char pad[12];
} Elem0219747c;

typedef struct {
    int f0;
    int v[3];
} Slot;

typedef struct {
    char pad0[0x48];
    Slot slots[256];
} Pool;

extern Elem0219747c data_0219747c[];
extern Pool data_02197434;

int func_020225b4(int idx, int *src, int n) {
    int i;
    Pool *p = &data_02197434;
    if (data_0219747c[idx].field0 < 0) {
        return 0;
    }
    for (i = 0; i < n; i++) {
        p->slots[idx].v[i] = src[i];
    }
    return 1;
}
