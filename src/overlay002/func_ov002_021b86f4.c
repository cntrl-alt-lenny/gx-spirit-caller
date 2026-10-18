typedef unsigned short u16;
struct Node0223def4 {
    u16 kind;
    u16 pad[2];
    u16 count : 8;
    u16 rest : 8;
    u16 arr8[5];
    u16 f18;
};
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
int func_ov002_021b86f4(struct Node0223def4 *self, int value) {
    int i;
    switch (self->kind) {
    case 0x132e:
    case 0x14b4:
    case 0x1754:
    case 0x1a30:
        return 1;
    case 0x147e:
    case 0x1489:
    case 0x16ab:
    case 0x1727:
        for (i = 0; i < self->count; i++) {
            if (value == func_ov002_0223def4(self, i)) return 1;
        }
        break;
    case 0x1af0:
        break;
    }
    return 0;
}
