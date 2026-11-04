struct Card { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned index:8; unsigned rest:2; };
struct Player { char pad[0x120]; struct Card cards[190]; char tail[0x450]; };
extern char data_ov002_022cf16c[];
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf180[];
extern unsigned int func_0202b8c0(int id);
extern int func_0202b950(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02250a28(int player, int unused, unsigned int arg) {
    if (arg & 0x10000000) {
        int off;
        unsigned int i = 0;
        off = player & 1;
        off *= 0x868;
        if (*(unsigned int *)(off + (unsigned int)data_ov002_022cf180) > i) {
            struct Card *e;
            unsigned int limit = arg & 0x0fffffff;
            char *base = data_ov002_022cf16c + off;
            e = (struct Card *)(base + 0x418);
            do {
                int id = e->id;
                if (func_0202e234(id) != 0 && (unsigned int)func_0202b950(id) <= limit)
                    func_ov002_02253458(player, 14, i);
                i++;
                e++;
            } while (i < *(unsigned int *)(base + 0x14));
        }
    } else {
        int off;
        struct Card *cards;
        off = player & 1;
        off *= 0x868;
        cards = (struct Card *)(off + (unsigned int)data_ov002_022cf16c + 0x120);
        if (func_0202b8c0(cards[arg].id) == 3) {
            if (func_ov002_021ca5bc(cards[arg].index * 2 + cards[arg].side) != 0)
                func_ov002_02253458(player, 11, arg);
        }
    }
}






