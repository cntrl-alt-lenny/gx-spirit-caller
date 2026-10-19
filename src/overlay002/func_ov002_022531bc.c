extern char data_ov002_022cf16c[];
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf17c[];
extern struct Count data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202ed90(int a0);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int index);
struct Slot { unsigned int id : 13; unsigned int rest : 19; };
struct Row { char pad[0x10]; unsigned int count13; unsigned int count14; struct Slot slots[1]; };
void func_ov002_022531bc(int player, int unused, unsigned int limit) {

    if (limit == 0) {
        int offset;
        int p = player & 1;
        unsigned int i = 0;
        struct Slot *slot;
        struct Row *row;
        int id;

        offset = p * 0x868;
        if (i < data_ov002_022cf180[p].count) {
            row = (struct Row *)(data_ov002_022cf16c + offset);
            slot = &row->slots[256];
            do {
                id = slot->id;
                if (func_0202e234(id) != 0 && func_0202ed90(id) != 0)
                    func_ov002_02253458(player, 14, i);
                i++;
                slot++;
            } while (i < row->count14);
        }
    } else {
        int offset2;
        int p2 = player & 1;
        struct Slot *slot2;
        struct Row *row2;
        unsigned int j = 0;
        int id2;

        offset2 = p2 * 0x868;
        if (j < data_ov002_022cf17c[p2].count) {
            row2 = (struct Row *)(data_ov002_022cf16c + offset2);
            slot2 = (struct Slot *)((char *)row2 + 0x260);
            do {
                id2 = slot2->id;
                if (func_0202e234(id2) != 0 && func_0202b8a8(id2) <= (limit >> 1) && func_0202ed90(id2) != 0 && func_ov002_021ca440(player, id2) != 0)
                    func_ov002_02253458(player, 13, j);
                j++;
                slot2++;
            } while (j < row2->count13);
        }
    }
}





