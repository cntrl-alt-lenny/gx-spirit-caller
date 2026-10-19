typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 rest2 : 15;
    u16 pad4 : 6;
    u16 id : 9;
    u16 rest4 : 1;
} Obj;
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021bd030(int self);
extern int func_ov002_0223df38(Obj *self, int index, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d8414(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);
extern int func_ov002_021d5d48(int a, int b, int c, int unused);
int func_ov002_0221baa4(Obj *self) {
    int packed;
    int a, b, index;
    if (func_ov002_021b99b4(self->side, self->id) < 0) return 0;
    if (func_ov002_021bd030(self->side) == -1) return 0;
    if (func_ov002_0223df38(self, 0, &packed) != 0) {
        a = (unsigned char)packed;
        b = (unsigned char)((u16)packed >> 8);
        if (func_ov002_0225764c((int)self, a, b) != 0) {
            index = func_ov002_021bd030(self->side);
            func_ov002_021d8414(self->side, 14, self->id, self->side, index, 1, 0);
            func_ov002_021d5d48(self->side, (u16)((unsigned char)self->side | ((unsigned char)index << 8)), (u16)((unsigned char)a | ((unsigned char)b << 8)), (unsigned char)self->side | ((unsigned char)index << 8));
        }
    }
    return 0;
}
