typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ov002Obj {
    u16 f0;
    u16 flag : 1;
    u16 pad : 5;
    u16 kind : 6;
    u16 rest : 4;
    u32 pad4[4];
    u32 w14_lo : 9;
    u32 w14_bit : 1;
} Ov002Obj;

extern int func_ov002_021ff3bc(Ov002Obj *self, int a);

int func_ov002_02205c4c(Ov002Obj *self, int a) {
    if ((u16)(self->kind + 0xfffa) <= 1) {
        if (self->w14_bit == self->flag)
            return 0;
        return func_ov002_021ff3bc(self, a);
    }
    return 0;
}
