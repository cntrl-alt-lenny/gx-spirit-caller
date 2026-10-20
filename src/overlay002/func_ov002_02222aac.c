typedef unsigned int u32;
typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; int result; };
struct Global { char pad[0xd44]; int result; };
struct Card { u32 id:13; u32 low:1; u32 pad:8; u32 high:8; u32 end:2; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int data_ov002_022cd744[];
extern int func_0202e234(int x);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern void func_ov002_021ae514(int a, int b, int c, int d, int e, int f);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
int func_ov002_02222aac(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (*(u32 *)(data_ov002_022cf17c + (self->player & 1) * 0x868) == 0) return 0;
        if (data_ov002_022cd744[self->player] == 0)
            func_ov002_021af9d0(self->player, 5, self->id, 0);
        return 0x7f;
    case 0x7f:
        if (*(u32 *)(data_ov002_022cf17c + (self->player & 1) * 0x868) < 2) return 0;
        if (data_ov002_022cd744[self->player] == 1) {
            data_ov002_022d016c.result = func_0202e234(((struct Card *)(data_ov002_022cf16c + (self->id & 1) * 0x868 + 0x260))->id) == 0;
        } else {
            func_ov002_021ae514(0x126, 0x1b6, 0x1b7, 0, 0, 15);
        }
        return 0x7e;
    case 0x7e:
        data_ov002_022ce288.result = data_ov002_022d016c.result;
        func_ov002_0226b0d0(1 - self->player, self->id, data_ov002_022d016c.result);
        return 0x7d;
    case 0x7d:
        if (data_ov002_022ce288.result != 0) {
            u32 player = self->player;
            u32 flag = player ? 0x8000 : 0;
            struct Card *card = (struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
            func_ov002_021d479c((u16)(0x57 | flag), 13, (u16)(card->high * 2 + card->low), 1);
        }
        return 0;
    default:
        return 0;
    }
}

