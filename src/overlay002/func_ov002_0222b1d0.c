struct Self { unsigned short f0; unsigned short bit:1; unsigned short rest:15; };
struct State { char pad[0x5a8]; int state; int count; };
struct Global { char pad[0xcec]; int player; };
struct Card { unsigned int id:13; unsigned int rest:19; };
struct List { char pad[0x418]; struct Card cards[1]; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202e234(int x);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
int func_ov002_0222b1d0(struct Self *self) {
    int current;
    int player;
    struct List *list;
    int state = data_ov002_022ce288.state;
    player = data_ov002_022d016c.player;
    { int count = data_ov002_022ce288.count;
    player ^= count;
    switch (state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
        return 0x7f;
    case 0x7f: {
        int offset = (player & 1) * 0x868;
        current = *(int *)(data_ov002_022cf180 + offset) - 1;
        if (current >= 0) {
        list = (struct List *)(data_ov002_022cf16c + offset);
        do {
            if (func_0202e234(list->cards[current].id) != 0) {
                func_ov002_021d8128(player, &list->cards[current], player != self->bit);
                return 0x7f;
            }
        } while (--current >= 0);
        }
        return 0x78;
    }
    case 0x78:
        data_ov002_022ce288.count = count + 1;
        if (count + 1 < 2) return 0x7f;
        func_ov002_021e2c5c(count + 1);
        return 0;
    }
    return 0;
    }
}







