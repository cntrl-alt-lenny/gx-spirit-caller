typedef unsigned short u16;
struct State { char pad[0x5a8]; int state; int flag; };
struct Info { char pad[0xb0]; u16 count; };
struct Cards { char pad[0x1db2]; u16 cards[1]; };
struct Self { u16 value; u16 bit:1; u16 :15; char pad[8]; u16 amount; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d0e6c;
extern struct Cards data_ov002_022cf16c;
extern void func_ov002_021e1870(int arg0, int idx, int arg2);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
int func_ov002_022224e0(struct Self *self) {
    int amount = self->amount;
    int i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.flag = func_ov002_0225368c(1-self->bit, self->value, 0) < amount;
        func_ov002_0226b194(1-self->bit, self->value, amount);
        return 0x7f;
    case 0x7f:
        for (i = 0; i < data_ov002_022d0e6c.count; i++)
            func_ov002_021e1870(1-self->bit, data_ov002_022cf16c.cards[i], 1);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022ce288.flag != 0)
            func_ov002_0226b054(self->bit);
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(1-self->bit);
        return 0;
    default:
        return 0;
    }
}
