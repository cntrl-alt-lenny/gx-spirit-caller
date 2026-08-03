typedef unsigned short u16;

struct Obj {
    u16 f0;
    struct {
        u16 x1 : 1;
        u16 x2 : 5;
        u16 _rest : 10;
    } f2;
};

extern int data_ov002_022cf09c[];
extern int func_ov002_021bb83c(int arg0);
extern int func_ov002_021bc7e8(int a, int b, int c);
extern int func_ov002_021ca1d8(int a);
extern int func_ov002_0223f5dc(struct Obj *self);
extern int func_ov002_02253600(int a, int b, int c);

int func_ov002_0220d1e0(struct Obj *self) {
    int setupresult;

    if (func_ov002_021bb83c(0x1a77) == 0) {
        return 0;
    }
    if (func_ov002_021bc7e8(self->f2.x1, self->f2.x1, self->f2.x2) == 0) {
        return 0;
    }
    if (func_ov002_021ca1d8(self->f2.x1) == 0) {
        return 0;
    }
    if (*(int *)((char *)data_ov002_022cf09c + (self->f2.x1 & 1) * 0x868) == 0) {
        setupresult = func_ov002_0223f5dc(self);
        if (func_ov002_02253600(self->f2.x1, self->f0, setupresult) == 0) {
            return 0;
        }
    }
    return 1;
}
