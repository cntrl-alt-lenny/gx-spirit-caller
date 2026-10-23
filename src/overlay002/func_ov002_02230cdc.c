typedef unsigned short u16;
struct Obj { u16 id; u16 player:1; u16 pad:15; u16 low:6; u16 key:9; u16 high:1; };
struct State { char pad[0x5a8]; int state; };
struct Buf { char pad[0xd44]; int flag; };
extern struct State data_ov002_022ce288;
extern struct Buf data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae4bc(int self, int idx);
extern int func_ov002_021ba294(int player, int arg1);
extern int func_ov002_021bc618(int arg0);
/* This caller supplies only r0; the thunk definition includes unused argument registers. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02230cdc(struct Obj *self) {
    int result, player, idx;
    switch (data_ov002_022ce288.state) {
    case 128:
        if (!func_ov002_021bc618(self->player)) return 0;
        if (!func_ov002_021ca2b8(self->player)) return 0;
        result = func_ov002_0225368c(self->player, self->id, 0);
        if (!result) {
            func_ov002_021ae400(self->player, 13);
            return 120;
        }
        func_ov002_021e2b3c(result);
        data_ov002_022d016c.flag = 1;
        return 126;
    case 127:
        if (!func_ov002_021bc618(self->player) || !func_ov002_0225368c(self->player, self->id, 0)) return 125;
        if (data_ov002_022cd744[self->player] == 1) data_ov002_022d016c.flag = 1;
        else func_ov002_021ae4bc(53, self->key);
        return 126;
    case 126:
        if (!data_ov002_022d016c.flag) return 125;
        player = self->player;
        idx = func_ov002_021ba294(player, self->id);
        func_ov002_0227adb8(player, (int)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x260 + idx * 4), 1, 0);
        return 127;
    case 125:
        result = func_ov002_021e286c(self->player);
        func_ov002_021e2c5c(result);
        return 0;
    case 120:
        func_ov002_0226b054(1 - self->player);
        return 100;
    case 100:
        func_ov002_021e286c(self->player);
        return 0;
    }
    return 0;
}

