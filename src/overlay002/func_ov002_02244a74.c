typedef unsigned short u16;

struct S {
    u16 f_0;
    u16 bit0 : 1;
    u16 mid : 5;
    u16 kind : 6;
    u16 rest : 4;
};

struct D1 {
    int pad[0x16e];
    int state;
};

struct D2 {
    char pad[0xb2];
    u16 val;
};

extern struct D1 data_ov002_022ce288;
extern struct D2 data_ov002_022d0e6c;
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
extern void func_ov002_0223de04(struct S *self, int arg1, int arg2, int arg3);

int func_ov002_02244a74(struct S *self) {
    if (self->kind == 5) {
        switch (data_ov002_022ce288.state) {
        case 0:
            func_ov002_0226b194(1 - self->bit0, self->f_0, 0);
            data_ov002_022ce288.state++;
            return 0;
        case 1:
            func_ov002_0223de04(self, self->bit0, 0xe, data_ov002_022d0e6c.val);
            return 1;
        }
    }
    return 1;
}
