struct Self022145ec {
    unsigned short card;
    unsigned short player : 1;
    unsigned short rest : 15;
};
struct State022145ec { char pad[0x5a8]; int state; };
extern struct State022145ec data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void func_ov002_021afb64(void *p);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);

int func_ov002_022145ec(struct Self022145ec *self) {
    switch (data_ov002_022ce288.state) {
    case 128:
        if (func_ov002_0225368c(self->player, self->card, 0))
            return 127;
        func_ov002_021ae400(self->player, 21);
        return 120;
    case 127:
        if (self->card == 0x139d)
            func_ov002_021af9d0(self->player, 6, self->card, 0);
        else
            func_ov002_021afb64(0);
        return 126;
    case 126:
        func_ov002_021d8288(self->player, (int)func_ov002_021afb74());
        return 100;
    case 120:
        func_ov002_0226b054(1 - self->player);
        return 100;
    case 100:
        func_ov002_021e286c(self->player);
        return 0;
    default:
        return 0;
    }
}

