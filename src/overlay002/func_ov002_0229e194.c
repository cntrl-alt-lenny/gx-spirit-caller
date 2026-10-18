extern void func_ov002_0229d32c(void *p);
extern void func_ov002_0229d890(void *p, int a, int b);

typedef struct {
    unsigned short rest : 14;
    unsigned short flag : 1;
    unsigned short pad : 1;
} Bits;

typedef struct {
    char pad0[0xa];
    Bits bits;
    char pad1[0x8];
} Entry;

typedef struct {
    Entry entries[8];
    char pad[0x4];
    int count;
    int base;
    int cur;
    int prev;
    int timer;
    int pad2;
    unsigned int mask[1];
} Obj;

void func_ov002_0229e194(Obj *self) {
    int i;
    Entry *e;

    e = self->entries;
    for (i = 0; i < 8; i++) {
        func_ov002_0229d32c(e);
        e++;
    }

    e = self->entries;
    for (i = 0; i < 8; i++) {
        int idx = self->base + i;
        if (idx < self->count) {
            Bits b = e->bits;
            if (b.flag) {
                self->mask[idx / 32] |= 1 << (idx & 0x1f);
            }
        }
        e++;
    }

    if (self->prev == self->cur) {
        self->cur = 0;
    }
    self->prev = self->cur;

    if (self->timer != 0) {
        self->timer = self->timer - 1;
        if (self->timer == 8) {
            func_ov002_0229d890(self, self->base, 1);
        }
    }
}
