struct Slot { unsigned id : 13; };
struct Count { unsigned count; char pad[0x864]; };
struct Side { char pad[0x1c]; unsigned count; char pad2[0x5b0]; struct Slot slots[166]; };
extern struct Count data_ov002_022cf188[];
extern struct Side data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c988c(int player, int kind, int extra);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02251c3c(int player, int card) {
    unsigned i = 0;
    if (i < data_ov002_022cf188[player & 1].count) {
        do {
            int id = data_ov002_022cf16c[player & 1].slots[i].id;
            if (func_0202e234(id) != 0 &&
                func_0202b878(id) == func_0202b878(card) &&
                func_ov002_021c988c(player, 15, i) != 0)
                func_ov002_02253458(player, 15, i);
            i++;
        } while (i < data_ov002_022cf16c[player & 1].count);
    }
}

