struct Event { unsigned id:9; unsigned pad:7; unsigned flag16:1; unsigned pad17:2; unsigned kind:4; unsigned rest:9; };
struct Card { unsigned id:13; unsigned rest:19; };
extern char data_ov002_022ce288[];
extern struct Event data_ov002_022ce884[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224ac6c(int player) {
    unsigned i = 0;
    char *types;
    struct Event *event;
    char *base;
    int idx;
    if (*(unsigned *)(data_ov002_022ce288 + 0x5d4) <= i) return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    types = data_ov002_022ce288;
    event = data_ov002_022ce884;
    do {
        if ((unsigned char)types[0x5dc] == 0x16 && event->flag16 != 0 && ((*(unsigned *)event << 16) >> 31) != 0 && event->kind == 14) {
            idx = func_ov002_021b99b4(player, event->id);
            if (idx >= 0 && func_0202e234(((struct Card *)(base + 0x418))[idx].id) != 0 && func_ov002_021c33e4(player, player, idx) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
        }
        i++;
        types++;
        event++;
    } while (i < *(unsigned *)(data_ov002_022ce288 + 0x5d4));
}

