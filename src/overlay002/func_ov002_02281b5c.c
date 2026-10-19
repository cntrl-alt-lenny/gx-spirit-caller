extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021c3cf0(int player);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
struct Slot { unsigned int id : 13; };
struct Row { char pad[12]; unsigned int count; char pad2[272]; struct Slot slots[466]; };
int func_ov002_02281b5c(int player, int slot) {
    unsigned int i;
    int a = 0;
    int b = 0;
    int id;
    int result;
    struct Slot *entry;
    struct Row *row;
    if (func_ov002_021c3cf0(player)) {
        unsigned int kind = func_0202b878(((struct Row *)(data_ov002_022cf16c + (player & 1) * 0x868))->slots[slot].id);
        if (kind == 22) return 1;
        if (kind == 23) return 2;
        return 0;
    }

    i = 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868) > i) {
    row = (struct Row *)(data_ov002_022cf16c + (player & 1) * 0x868);
    entry = row->slots;
    do {
        if (i < (row->count + 1) / 2) {
            id = entry->id;
            if (func_0202e234(id)) a++;
            else if (func_0202b878(id) == 22) b++;
        } else {
            if (func_ov002_021b00d0(2)) a++;
            else b++;
        }
        i++; entry++; } while (i < row->count);
    }
    result = (int)func_ov002_021b00d0(*(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868));
    return (result >= a) + (result >= a + b);
}





