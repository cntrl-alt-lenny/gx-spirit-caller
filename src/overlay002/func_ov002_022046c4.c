typedef unsigned short u16;
struct S022046c4 { u16 id; u16 lo : 6; u16 k : 6; u16 t : 2; u16 hi : 2; };

extern int func_ov002_0220472c(struct S022046c4 *self, int b);
extern int func_ov002_02204d78(struct S022046c4 *self, int b);

int func_ov002_022046c4(struct S022046c4 *self, int b) {
    if (self->t == 1 && self->k == 5) {
        return 2;
    }
    switch (self->id) {
    case 0x1506:
        return func_ov002_0220472c(self, b);
    case 0x1694:
        return func_ov002_02204d78(self, b);
    default:
        return 1;
    }
}
