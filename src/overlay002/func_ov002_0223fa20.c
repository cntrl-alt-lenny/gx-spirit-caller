typedef unsigned short u16;
struct Self {
    u16 f0;
    u16 bit0:1;
    u16 pad1:11;
    u16 kind:2;
    u16 bit14:1;
    u16 pad2:1;
};
struct SelfDE04 {
    char _pad[6];
    union U6 { u16 raw; struct { u16 byte0:8; u16 byte1:8; } b; } f6;
};
struct State { char pad[0x5b8]; int step; };
struct Word { unsigned pad:13; unsigned bit13:1; unsigned pad2:8; unsigned byte22:8; unsigned pad3:2; };
extern struct State data_ov002_022ce288;
extern int func_ov002_0223f6c4(struct Self *self);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
int func_ov002_0223fa20(struct Self *self) {
    int player = self->bit0 ^ self->bit14;
    int value = func_ov002_0223f6c4(self);
    switch (data_ov002_022ce288.step) {
    case 0:
        if (func_ov002_022536e8(player, self->f0, value) == 0) {
            return self->kind == 2 ? -1 : 1;
        }
        func_ov002_021ae400(player, 0x5e);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        func_ov002_021af9d0(player, 6, self->f0, value);
        data_ov002_022ce288.step++;
        return 0;
    case 2: {
        int *a = func_ov002_021afb74();
        int b = func_ov002_021afba0();
        int *c = func_ov002_021afb74();
        int *d = func_ov002_021afb74();
        func_ov002_0223de04((struct SelfDE04 *)self, ((struct Word *)a)->bit13, b, ((struct Word *)d)->byte22 * 2 + ((struct Word *)c)->bit13);
        break;
    }
    }
    return 1;
}

