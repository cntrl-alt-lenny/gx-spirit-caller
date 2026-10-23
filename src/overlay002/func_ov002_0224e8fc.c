typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
typedef struct { char pad[0x14]; unsigned int count; Card cards[1]; } Side;
typedef struct { unsigned int count; char pad[0x864]; } Count;
extern Side data_ov002_022cf16c[];
extern Count data_ov002_022cf180[];
extern int func_0202df78(int a, int b);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224e8fc(int player, int key) {
    unsigned int i;
    int match;
    Card *p;
    Side *s;
    int kind;
    switch (key) {
    case 0x183d: match = 0x1782; break;
    case 0x1a42: match = 0xfe4; break;
    }
    i = 0;
    if (i < data_ov002_022cf180[player & 1].count) {
        kind = 14;
        s = (Side *)((char *)data_ov002_022cf16c + (player & 1) * 0x868);
        p = (Card *)((char *)s + 0x418);
        do {
            if (func_0202df78(p->id, match) != 0) {
                if (func_ov002_021c33e4(player, player, i) != 0) {
                    func_ov002_02253458(player, kind, i);
                }
            }
            i++;
            p++;
        } while (i < s->count);
    }
}


