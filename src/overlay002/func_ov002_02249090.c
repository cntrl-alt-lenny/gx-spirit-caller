struct Card { unsigned id:13; unsigned rest:19; };
struct Player { char pad0[0x10]; unsigned count; char pad1[0x24c]; struct Card cards[1]; char tail[0x604]; };
extern struct Player data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202df78(int a, int b);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02249090(int player, int arg1) {
    unsigned i;
    int target;
    struct Card *p;
    struct Player *s;
    switch (arg1) {
    case 0x1232: target = 0x1117; break;
    case 0x12de: target = 0xfc9; break;
    }
    i = 0;
    if (*(unsigned *)(data_ov002_022cf17c + (player & 1) * 0x868) <= i) return;
    s = &data_ov002_022cf16c[player & 1];
    p = s->cards;
    do {
        int id = p->id;
        if (func_0202df78(id, target) != 0 && func_ov002_021ca3f0(player, id) != 0)
            func_ov002_02253458(player, 13, i);
        i++;
        p++;
    } while (i < s->count);
}


