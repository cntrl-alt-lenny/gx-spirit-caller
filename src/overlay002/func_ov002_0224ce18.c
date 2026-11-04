struct Card { unsigned id:13; unsigned rest:19; };
struct Count { unsigned count; char pad[0x864]; };
struct Player { char pad[0x10]; unsigned count13; unsigned count14; char pad18[0x248]; struct Card cards13[110]; struct Card cards14[110]; char tail[0x298]; };
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf17c[];
extern struct Count data_ov002_022cf180[];
extern int func_0202e6f4(int id);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224ce18(int player, int arg1, int mode) {
    if (mode == 1) {
        unsigned int idx = 0;
        if (data_ov002_022cf17c[player & 1].count > idx) {
            struct Card *row = data_ov002_022cf16c[player & 1].cards13;
            struct Player *base = &data_ov002_022cf16c[player & 1];
            do {
                if (func_0202e6f4(row->id))
                    func_ov002_02253458(player, 13, idx);
                idx++;
                row++;
            } while (idx < base->count13);
        }
    } else {
        struct Card *row;
        char *base;
        unsigned int idx = 0;
        if (data_ov002_022cf180[player & 1].count > idx) {
            row = data_ov002_022cf16c[player & 1].cards14;
            base = (char *)&data_ov002_022cf16c[player & 1];
            do {
                if (func_0202e6f4(row->id))
                    func_ov002_02253458(player, 14, idx);
                idx++;
                row++;
            } while (idx < *(unsigned int *)(base + 0x14));
        }
    }
}



