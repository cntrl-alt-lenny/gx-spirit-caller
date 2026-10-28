struct Entry {
    unsigned int id : 13;
    unsigned int rest : 19;
    char pad[0x10];
};
struct Side {
    char pad0[0x30];
    struct Entry entries[11];
    char pad1[0x75c];
};
extern struct Side data_ov002_022cf16c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_ov002_02281920(int a, int b);

int func_ov002_0228130c(int player, int id)
{
    int i;
    struct Entry *entry;
    if (func_0202b8c0(id) == 2) {
        return id != data_ov002_022cf16c[player & 1].entries[10].id;
    }
    if (func_0202b8c0(id) == 4) {
        if (func_0202b878(id) == 0x17) {
            if (func_ov002_02281920(player, 0x19a3)) return 1;
        } else {
            if (func_ov002_02281920(player, 0x19a4)) return 1;
        }
    }
    entry = &data_ov002_022cf16c[player & 1].entries[5];
    for (i = 5; i < 10; i++, entry++) {
        if (id == entry->id) return 0;
    }
    return 1;
}
