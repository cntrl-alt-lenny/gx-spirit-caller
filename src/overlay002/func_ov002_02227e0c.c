typedef unsigned short u16;
struct Self { u16 a; u16 player:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; };
struct Card { unsigned int id:13; unsigned int rest:19; };
struct Side { char pad[0x260]; struct Card card; char tail[0x604]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf17c[];
extern struct Side data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ba5e0(int idx);
extern int func_ov002_021c988c(int player, int kind, int extra);
/* The original supplies only two arguments to this four-argument thunk. */
extern int func_ov002_021d8288();
extern void func_ov002_021d87dc(int arg0);
extern int func_ov002_021df708(int arg0, int arg1);
/* The original supplies only three arguments to this four-argument thunk. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0226b054(int arg0);
int func_ov002_02227e0c(struct Self *self) {
    int player;
    struct Side *side;
    int id;
    int state = data_ov002_022ce288.state;
    switch(state) {
    case 128:
        if (*(int *)(data_ov002_022cf17c + (self->player & 1) * 0x868) == 0) return 0;
        if (*(int *)(data_ov002_022cf17c + (self->player & 1) * 0x868) == func_ov002_021ba5e0(self->player)) return 100;
        return 126;
    case 126:
        func_ov002_021e2b3c(state);
        return 125;
    case 125:
        player = self->player;
        if (*(int *)(data_ov002_022cf17c + (player & 1) * 0x868) != 0) {
            side = &data_ov002_022cf16c[player & 1];
            id = side->card.id;
            func_ov002_021df708(player, id);
            if (func_ov002_021c988c(player, 13, 0) == 0) func_ov002_021e2818(player);
            func_ov002_021d87dc(player);
            if (func_0202e234(id) == 0) {
                func_ov002_021d8288(player, &side->card);
                return 124;
            }
            func_ov002_021e13f4(player, 1, 0);
            return 125;
        }
        return 124;
    case 124:
        func_ov002_021e2c5c(state);
        return 0;
    case 100:
        func_ov002_021ae400(self->player, 13);
        return 99;
    case 99:
        func_ov002_0226b054(1 - self->player);
        return 98;
    case 98:
        func_ov002_021e286c(self->player);
        return 0;
    }
    return 0;
}

