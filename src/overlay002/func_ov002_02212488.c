typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca2b8();
extern int func_ov002_0223f6c4(struct Self *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_0227ac64(int a, int b, int c, int d, int e);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02212488(struct Self *self) {
    switch(data_ov002_022ce288.mode) {
    case 0x80:
        if (func_ov002_021ca2b8(self->player) == 0) return 0;
        if (func_ov002_021bc618(self->player) == 0) return 0;
        if (func_ov002_0225368c(self->player, self->id, func_ov002_0223f6c4(self)) == 0) return 0;
        func_ov002_021ae400(self->player, 0x1a);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->player, 6, self->id, func_ov002_0223f6c4(self));
        return 0x7e;
    case 0x7e:
        if (self->id == 0x114a) {
            func_ov002_0227ac64(self->player, (int)func_ov002_021afb74(), 1, 0, 0);
        } else {
            func_ov002_0227adb8(self->player, (int)func_ov002_021afb74(), 1, 0);
        }
        return 0;
    }
    return 0;
}

