typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_ov006_021b6ad8(char *base, int sel, int n, int flag);
extern int func_ov006_021b6c30(char *base, int sel, int idx);
extern char data_ov006_0224f448[];
typedef struct { int a, base, c, d; } Entry;
typedef struct { int a; Obj *obj; char pad8[0x5c]; int index; char pad68[0x34]; Entry entries[1]; } State;
int func_ov006_021c39f8(State *self) {
    Entry *entry = &self->entries[self->index];
    enum { SELECT_FIRST = 0, SELECT_SECOND = 1 } sel;
    int row;
    int present;
    int offset;
    int y;
    void *h;
    int style;
    int i;
    int key;
    int tile;
    int x;
    int value;
    int adjust;
    int hundreds, tens, ones;
    if (self->index == 0) sel = SELECT_FIRST; else sel = SELECT_SECOND;
    for (row = 0, offset = 0, y = 0x1b; row < 6; row++, offset += 4, y += 0x13) {
        int base = entry->base;
        present = func_ov006_021b6ad8(data_ov006_0224f448, sel, base + row, 0);
        if (present == 0) value = 0;
        else value = func_ov006_021b6c30(data_ov006_0224f448, sel, base + row);
        i = 0;
        x = 0xb4;
        hundreds = (value % 1000) / 100;
        tens = (value % 100) / 10;
        ones = value % 10;
        for (; i < 4; x += 6, i++) {
            key = i + offset;
            h = (void *)func_02021660(self->obj, 5, key + 9);
            if (present != 0) {
                style = 0x1c1;
                switch (i) {
                case 0: tile = hundreds + 8; if (value < 100) style = 0; break;
                case 1: tile = tens + 8; if (value < 10) style = 0; break;
                case 2: tile = ones + 8; break;
                default: tile = 0x12; break;
                }
            } else { style = 0; tile = style; }
            if (i == 3) adjust = 2; else adjust = 0;
            func_020216b0(h, 2, key + 9);
            func_020216b0(h, 3, x + adjust);
            func_020216b0(h, 4, y);
            func_020216b0(h, 0x11, 3);
            func_020216b0(h, 0x12, 0);
            func_020216b0(h, 0xc, 0);
            func_020216b0(h, 0xd, tile);
            func_020216b0(h, 0, style);
        }
    }
    return 1;
}









