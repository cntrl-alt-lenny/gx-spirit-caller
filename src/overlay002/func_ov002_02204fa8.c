typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 idx : 5;
    u16 kind : 6;
    u16 pad : 4;
} Obj;

typedef struct {
    int pad0;
    int a;
    int b;
    int pad1[4];
    int c;
    int d;
} St;

extern St data_ov002_022cd3f4;
extern int data_ov002_022d016c[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021b3ecc(int a, int b, int c);

int func_ov002_02204fa8(Obj *self) {
    if ((u16)(self->kind + 0xffee) <= 1) {
        if (*(int *)((char *)data_ov002_022d016c + 0xcec) != self->bit0) {
            return 0;
        }
        if (*(int *)((char *)&data_ov002_022cd3f4 + 0x1c) != self->idx) {
            return 0;
        }
        if (func_ov002_021b3ecc(self->bit0, self->idx, self->f0) != 0) {
            return 0;
        }
        if (data_ov002_022cd3f4.b != 0) {
            return 0;
        }
        return *(u16 *)(data_ov002_022cf1a2 + (data_ov002_022cd3f4.a & 1) * 0x868 + data_ov002_022cd3f4.d * 0x14) != 0;
    }
    return 0;
}
