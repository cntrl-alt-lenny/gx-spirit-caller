typedef unsigned short u16;
struct SelfDE04 {
    u16 f0;
    u16 side : 1;
    u16 rest : 15;
    u16 f4;
    union U6 { u16 raw; struct { u16 byte0:8; u16 byte1:8; } b; } f6;
};
struct State { char pad[0x5b8]; int state; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_02242f28(struct SelfDE04 *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022536e8((void *)self->side, self->f0, 0) == 0) return -1;
        if (func_ov002_022536e8((void *)self->side, self->f0, 1) == 0) return -1;
        func_ov002_021ae400(self->side, 0x5e);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(self->side, 6, self->f0, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 2: {
        int *a = func_ov002_021afb74();
        int *b = func_ov002_021afb74();
        int *c = func_ov002_021afb74();
        func_ov002_0223de04(self, (unsigned)(*a << 18) >> 31, 14,
            ((unsigned)(*c << 2) >> 24) * 2 + ((unsigned)(*b << 18) >> 31));
        data_ov002_022ce288.state++;
        return 0;
    }
    case 3:
        func_ov002_021ae400(self->side, 0x56);
        data_ov002_022ce288.state++;
        return 0;
    case 4:
        func_ov002_021af9d0(self->side, 6, self->f0, 1);
        data_ov002_022ce288.state++;
        return 0;
    case 5: {
        int *a = func_ov002_021afb74();
        int *b = func_ov002_021afb74();
        int *c = func_ov002_021afb74();
        func_ov002_0223de04(self, (unsigned)(*a << 18) >> 31, 14,
            ((unsigned)(*c << 2) >> 24) * 2 + ((unsigned)(*b << 18) >> 31));
        data_ov002_022ce288.state++;
        return 0;
    }
    default: return 1;
    }
}
