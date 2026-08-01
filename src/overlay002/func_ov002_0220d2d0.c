typedef unsigned short u16;

struct Obj {
    u16 f0;
    struct {
        u16 x1 : 1;
        u16 x2 : 5;
        u16 _rest : 10;
    } f2;
};

extern int data_ov002_022cf17c[];
extern int func_ov002_021bb91c(int arg0);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_0223f6c4(struct Obj *self);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_0220d2d0(struct Obj *self) {
    int setupresult;

    if (func_ov002_021bb91c(0x1a77) == 0) {
        return 0;
    }
    if (func_ov002_021bc8c8(self->f2.x1, self->f2.x1, self->f2.x2) == 0) {
        return 0;
    }
    if (func_ov002_021ca2b8(self->f2.x1) == 0) {
        return 0;
    }
    if (*(int *)((char *)data_ov002_022cf17c + (self->f2.x1 & 1) * 0x868) == 0) {
        setupresult = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->f2.x1, self->f0, setupresult) == 0) {
            return 0;
        }
    }
    return 1;
}
