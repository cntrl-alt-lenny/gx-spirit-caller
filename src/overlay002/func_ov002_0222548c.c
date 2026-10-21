typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 :15; };
struct Card { unsigned int id:13; unsigned int flag:1; unsigned int :8; unsigned int kind:8; unsigned int :2; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bb91c(int arg0);
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);
/* The original supplies only two arguments to the four-argument thunk. */
extern int func_ov002_021d8288();
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
int func_ov002_0222548c(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 128:
        if (func_ov002_0225368c(self->player, self->id, 0) == 0) {
            func_ov002_021ae400(self->player, 13);
            return 120;
        } else {
            func_ov002_021ae400(self->player, 94);
            return 127;
        }
    case 127:
        func_ov002_021af9d0(self->player, 6, self->id, 0);
        return 126;
    case 126:
        func_ov002_0226b0d0(1 - self->player, self->id, ((struct Card *)func_ov002_021afb74())->id);
        return 125;
    case 125:
        if (func_ov002_021bb91c(0x159d)) {
            if (data_ov002_022cd744[self->player] == 1)
                *(int *)(data_ov002_022d016c + 0xd44) = 1;
            else
                func_ov002_021ae484(0x131);
        } else {
            *(int *)(data_ov002_022d016c + 0xd44) = 0;
        }
        return 124;
    case 124:
        if (*(int *)(data_ov002_022d016c + 0xd44)) {
            func_ov002_021d8288(self->player, func_ov002_021afb74());
        } else {
            int flag;
            struct Card *card;
            func_ov002_021e286c(self->player);
            flag = self->player ? 0x8000 : 0;
            card = (struct Card *)func_ov002_021afb74();
            func_ov002_021d479c((u16)(flag | 0x57), 13, (u16)(((struct Card *)func_ov002_021afb74())->kind * 2 + card->flag), 0);
            func_ov002_021e2818(self->player);
            func_ov002_021e2b1c(30);
            func_ov002_021e2818(self->player);
            return 0;
        }
        return 100;
    case 120:
        func_ov002_0226b054(1 - self->player);
        return 100;
    case 100:
        func_ov002_021e286c(self->player);
        return 1;
    default:
        return 0;
    }
}
