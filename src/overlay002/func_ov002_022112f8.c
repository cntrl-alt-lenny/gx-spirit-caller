typedef unsigned short u16;
struct Self { u16 id; u16 side:1, pad:13, flag:1, tail:1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf17c[];
extern int func_ov002_0223f6c4(struct Self *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
/* Original supplies only two arguments to this four-argument thunk. */
extern int func_ov002_021d8288();
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_021e286c(int arg0);
int func_ov002_022112f8(struct Self *self) {
    int player = self->side ^ self->flag;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (*(int *)(data_ov002_022cf17c + (self->side & 1) * 0x868) == 0) return 0;
        if (func_ov002_0225368c(player, self->id, func_ov002_0223f6c4(self)) == 0) {
            func_ov002_021ae400(player, 0x15);
            return 0x78;
        } else {
            func_ov002_021ae400(player, 0x33);
            return 0x7e;
        }
    case 0x7e:
        func_ov002_021af9d0(player, 6, self->id, func_ov002_0223f6c4(self));
        return 0x7d;
    case 0x7d:
        func_ov002_021d8288(player, func_ov002_021afb74());
        return 0x64;
    case 0x78:
        func_ov002_0226b054(1-player);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(player);
        return 0;
    }
    return 0;
}
