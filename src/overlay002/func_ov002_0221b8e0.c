typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 pad2 : 5;
    u16 kind : 6;
    u16 pad2b : 4;
    u16 pad4 : 6;
    u16 id : 9;
    u16 pad4b : 1;
} Obj;
typedef struct {
    u16 w0;
    u16 bit0 : 1;
    u16 pad1 : 13;
    u16 bit14 : 1;
    u16 pad15 : 1;
} S021ff3bc;
extern char data_ov002_022cf16c[];
extern int data_ov002_022d016c[];
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern void func_ov002_0227ac64(int side, void *slot, int a, int b, unsigned int flags);
int func_ov002_0221b8e0(Obj *self, int arg1) {
    int idx;
    if (self->kind != 2) {
        unsigned char flag = (data_ov002_022d016c[0x33b] == self->side) + 1;
        func_ov002_021e276c((void *)self->side, self->f0, (u16)((flag << 4) | 1), self->id);
        return 0;
    }
    if (func_ov002_021ff3bc((S021ff3bc *)self, arg1) == 0) return 0;
    idx = func_ov002_021b99b4(self->side, self->id);
    if (idx >= 0) {
        if (func_ov002_021c33e4(self->side, self->side, idx) != 0) {
            func_ov002_0227ac64(self->side, data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x418 + idx * 4, 1, 1, self->f0 << 16);
        }
    }
    return 0;
}
