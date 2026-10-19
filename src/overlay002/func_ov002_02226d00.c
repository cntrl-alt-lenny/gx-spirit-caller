typedef unsigned short u16;
struct Self { u16 id; u16 bit:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; int count; };
struct Player { char pad[0xcec]; int player; };
struct List { char pad[0xb0]; u16 count; };
struct Cards { char bytes[0x1db2]; u16 ids[32]; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022d016c;
extern struct List data_ov002_022d0e6c;
extern struct Cards data_ov002_022cf16c;
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021ca698(int arg0, int arg1);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b094(int arg0, int arg1);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
int func_ov002_02226d00(struct Self *self) {
    int player = data_ov002_022d016c.player ^ data_ov002_022ce288.count;
    char *cards;
    struct Cards *base;
    int i;
    int opponent;
    switch (data_ov002_022ce288.state) {
    case 128:
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
    case 127:
        if (func_ov002_021ca698(self->bit, 1-player) == 0) return 100;
        if (func_ov002_0225368c(player, self->id, 0) == 0) return 100;
        func_ov002_0226b094(player, self->id);
        return 126;
    case 126:
        if (data_ov002_022d0e6c.count == 0) return 100;
        func_ov002_0226b194(player, self->id, 3);
        return 125;
    case 125:
        i = 0;
        if (i < data_ov002_022d0e6c.count) {
            opponent = 1-player;
            base = &data_ov002_022cf16c;
            cards = base->bytes + (opponent & 1)*0x868 + 0x418;
            do {
                int index = func_ov002_021b99b4(opponent, base->ids[i]);
                func_ov002_021d8128(opponent, cards + index*4, 1);
                i++;
            } while (i < data_ov002_022d0e6c.count);
        }
        return 100;
    case 100:
        if (++data_ov002_022ce288.count < 2) return 127;
        func_ov002_021e2c5c(data_ov002_022ce288.count);
        return 0;
    default:
        return 0;
    }
}



