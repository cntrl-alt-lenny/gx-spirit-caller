typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct {
    Obj *resource;
    char pad04[0x60];
    unsigned int flags[4];
    int mode, columns, rows;
    char pad80[8];
    int left, top;
    char pad90[0x1c];
    short values[35];
} State;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
/* Division helper returns quotient in r0 and remainder in r1. */
extern long long func_020b3870(int numerator, int denominator);
extern int func_ov006_021c9c54(int *base, int x, int y);
int func_ov006_021c9030(State *base) {
    int flags;
    int i;
    int x, y, tile;
    int col, row, columns;
    void *h;
    for (i = 0; i < 35; i++) {
        columns = base->columns;
        if (i < columns * base->rows) {
            col = (int)(func_020b3870(i, columns) >> 32);
            row = (int)func_020b3870(i, columns);
            x = base->left + 9 + col * 20;
            y = base->top + 9 + row * 20;
            tile = func_ov006_021c9c54((int *)base, col, row);
            if (tile >= 0) {
                flags = 0x8c1;
                switch (base->mode) {
                case 22: case 24: case 25: case 26: case 27: case 28: case 29:
                    if (base->values[i] < 0) flags |= 4;
                    break;
                }
                if (base->flags[i / 32] & (1 << (i % 32))) flags |= 4;
            } else {
                tile = 0;
                flags = 0;
            }
        } else {
            x = 0;
            y = 0;
            flags = 0;
        }
        h = (void *)func_02021660(base->resource, 5, i + 1);
        func_020216b0(h, 2, i);
        func_020216b0(h, 3, x);
        func_020216b0(h, 4, y);
        func_020216b0(h, 17, 1);
        func_020216b0(h, 18, 1);
        func_020216b0(h, 12, 0);
        func_020216b0(h, 13, tile);
        func_020216b0(h, 0, flags);
    }
    return 1;
}




