typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; u16 pad:6; u16 index:9; u16 last:1; };
struct State { char pad[0x5a8]; int mode; int count; };
struct Result { char pad[0xd44]; int value; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae4bc(void *self, int idx);
extern int func_ov002_021ba294(int player, int arg1);
extern int func_ov002_021d8288(int a, int b, int unused, int d);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_022125e8(struct Self *self) {
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (self->id == 0x1919) data_ov002_022ce288.count = 9; else data_ov002_022ce288.count = 2;
        return 0x7f;
    case 0x7f: {
        int idx = func_ov002_021ba294(self->player, self->id);
        if (idx >= 0) {
            int player = self->player;
            if (func_ov002_021d8288(player, (int)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x260 + idx * 4), player & 1, (int)data_ov002_022cf16c)) {
                data_ov002_022ce288.count--;
                return data_ov002_022ce288.count > 0 ? 0x7e : 0x64;
            }
        }
        func_ov002_021ae400(self->player, 0x15);
        return 0x6f;
    }
    case 0x7e:
        if (func_ov002_0225368c(self->player, self->id, 0) <= 0) return 0x64;
        if (data_ov002_022cd744[self->player] == 1) {
            data_ov002_022d016c.value = 1;
            return 0x7d;
        }
        func_ov002_021ae4bc((void *)0x1c, self->index);
        return 0x7d;
    case 0x7d:
        return data_ov002_022d016c.value != 0 ? 0x7f : 0x64;
    case 0x6f:
        func_ov002_0226b054(1 - self->player);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(self->player);
        return 0;
    }
    return 0;
}

