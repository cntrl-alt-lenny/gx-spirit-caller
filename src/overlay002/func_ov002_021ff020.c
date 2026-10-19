typedef unsigned int u32;
struct Entry {
    u32 id : 13;
    u32 flag : 1;
    u32 pad : 8;
    u32 index : 8;
    u32 rest : 2;
};
struct State {
    char pad[12];
    u32 count;
    char pad2[272];
    struct Entry entries[466];
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
int func_ov002_021ff020(int player, int remaining, int excluded, int kind) {
    u32 offset = (player & 1) * 0x868;
    u32 i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + offset)) {
    struct Entry *entry;
    struct State *state = (struct State *)(data_ov002_022cf16c + offset);
    entry = state->entries;
    do {
        int id = entry->id;
        int allowed = id > 0;
        if (excluded == entry->index * 2 + entry->flag) allowed = 0;
        switch (kind) {
        case 0: break;
        case 7:
            if (func_0202b878(id) != 0x16) allowed = 0;
            break;
        case 8:
            if (func_0202b878(id) != 0x17) allowed = 0;
            break;
        default:
            if (func_0202e234(id) == 0) allowed = 0;
            break;
        }
        if (func_ov002_021b3fd8(player, 11, 0x12a1, entry->index * 2 + entry->flag) != 0) allowed = 0;
        if (allowed) remaining--;
        i++;
        entry++;
    } while (i < state->count);
    }
    return remaining <= 0;
}


