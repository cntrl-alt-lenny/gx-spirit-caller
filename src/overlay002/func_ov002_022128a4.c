typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 flag : 1;
    u16 pad0 : 11;
    u16 kind : 2;
    u16 pad1 : 2;
    u16 pad2 : 2;
    u16 busy : 1;
    u16 pad3 : 13;
    char pad4[0x0e];
    u32 pad5 : 23;
    u32 bit : 1;
    u32 pad6 : 8;
} Obj;

extern void func_ov002_021df7cc(int a, int b);
extern void func_ov002_021e05fc(int a, int b);

int func_ov002_022128a4(Obj *self) {
    if (self->busy) {
        return 0;
    }
    if (self->kind != 2) {
        func_ov002_021e05fc(self->flag, 0xbb8);
    } else {
        if (self->bit) {
            func_ov002_021e05fc(self->flag, 0xbb8);
        }
        func_ov002_021df7cc(self->flag, 0x1388);
    }
    return 0;
}
