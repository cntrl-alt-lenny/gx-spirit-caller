/* func_ov002_02242004: guard via func_ov002_022574e0(self), then branch on
 * a 2-value bitfield (hi8 at self+6) comparing arg1 against self->bit0. */
struct S022420ec {
    short pad0;
    unsigned short bit0 : 1;
    unsigned short rest1 : 15;
    short pad4;
    unsigned short lo8 : 8;
    unsigned short hi8 : 8;
};
extern int func_ov002_022574e0(struct S022420ec *self);

int func_ov002_02242004(struct S022420ec *self, int arg1) {
    if (func_ov002_022574e0(self) == 0) return 0;
    switch (self->hi8) {
    case 0: return arg1 != self->bit0;
    case 1: return arg1 == self->bit0;
    }
    return 1;
}
