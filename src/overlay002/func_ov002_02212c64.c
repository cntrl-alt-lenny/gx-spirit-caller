typedef unsigned short u16;

typedef struct {
    u16 id;
    u16 flag : 1;
} Obj;

extern int func_ov002_021c2f24(int a, int b);
extern int func_ov002_021e13f4();

int func_ov002_02212c64(Obj *self, int unused1) {
    int r = 1;
    switch (self->id) {
    case 0x11d8:
        r = 5;
        break;
    case 0x1744:
        r = 2;
        break;
    case 0x19d0:
        r = func_ov002_021c2f24(self->flag, self->id);
        break;
    }
    func_ov002_021e13f4(1 - self->flag, r, 1);
    return 0;
}
