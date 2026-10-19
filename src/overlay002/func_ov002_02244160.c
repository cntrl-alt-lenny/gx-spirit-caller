struct Card {
    unsigned short id;
    unsigned short bit : 1;
    unsigned short rest : 15;
};
struct State { char pad[0x5b8]; int state; };
struct Request { char pad[0xd70]; int player; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(struct Card *self, int player, int slot);
extern int func_ov002_021f27b4(struct Card *self, int player, int slot);
extern int func_ov002_021f208c(struct Card *self, int player, int slot);

int func_ov002_02244160(struct Card *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(self->bit, 0x7c);
        func_ov002_0225935c(self->bit, self->id, (int)func_ov002_021f27b4);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_021ae400(self->bit, 0x64);
        func_ov002_0225935c(self->bit, self->id, (int)func_ov002_021f208c);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
    case 3:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.player,
                data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
    default:
        return 1;
    }
}
