typedef unsigned short u16;
struct Obj { u16 pad; u16 player:1; u16 :15; };
struct State { char pad[0x5a8]; int state; int count; };
struct Player { char pad[0xcec]; int player; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022d016c;
/* Original callers supply only two arguments to this four-parameter thunk. */
extern int func_ov002_021e104c();
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0226ad5c(int a, int b, int c, int d);
int func_ov002_0223b2ec(struct Obj *self) {
    int player = data_ov002_022d016c.player ^ data_ov002_022ce288.count;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e104c(self->player, 1);
        func_ov002_021e104c(1 - self->player, 1);
        return 0x7f;
    case 0x7f:
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
        return 0x7e;
    case 0x7e:
        func_ov002_0226ad5c(player, 1, 0, player != self->player);
        return 0x7d;
    case 0x7d:
        if (++data_ov002_022ce288.count < 2) return 0x7e;
        func_ov002_021e2c5c(data_ov002_022ce288.count);
        return 0;
    }
    return 0;
}

