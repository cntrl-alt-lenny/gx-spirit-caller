typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
int func_ov006_021c6104(char *self) {
    int *row = (int *)((self + 0x6c) + *(int *)(self + 0x4c) * 16);
    int i = 0, index, base = 0, y = 30;
    int valid, value;
    void *obj; int flags, j, slot, tile, x, offset;
    for (; i < 6; i++, base += 4, y += 22) {
        index = row[1] + i;
        valid = index >= 0 && index < row[2];
        value = valid ? *(int *)(self + 0x80 + index * 16) / 10 : 0;
        j = 0;
        x = 190;
        int hundreds = value % 1000 / 100;
        int tens = value % 100 / 10;
        int ones = value % 10;

        for (; j < 4; x += 6, j++) {
            slot = j + base;
            obj = (void *)func_02021660(*(Obj **)self, 5, slot + 8);

            if (valid) {
                flags = 0x1c1;
                switch (j) {
                case 0: tile = hundreds + 13; if (value < 100) flags = 0; break;
                case 1: tile = tens + 13; if (value < 10) flags = 0; break;
                case 2: tile = ones + 13; break;
                default: tile = 23; break;
                }
                if (index == 0 && value < 50) {
                    switch (j) {
                    case 0: flags = 0; break;
                    case 1: flags = 0; break;
                    case 2: tile = 24; break;
                    }
                }
            } else {
                flags = 0;
                tile = flags;
            }
            offset = j == 3 ? 2 : 0;
            func_020216b0(obj, 2, slot + 8);
            func_020216b0(obj, 3, x + offset);
            func_020216b0(obj, 4, y);
            func_020216b0(obj, 17, 3);
            func_020216b0(obj, 18, 0);
            func_020216b0(obj, 12, 0);
            func_020216b0(obj, 13, tile);
            func_020216b0(obj, 0, flags);
        }
    }
    return 1;
}








