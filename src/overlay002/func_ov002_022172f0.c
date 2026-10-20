struct Bits { unsigned int pad0:13, bit:1, pad1:8, field:8, pad2:2; };
struct Entry {
    int side, slot, unused, value;
    char pad[0x1c];
    int busy;
    char tail[8];
};
struct State { char pad[0xcec]; int index; };
extern struct State data_ov002_022d016c;
extern struct Entry data_ov002_022cd420[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021de910(int a, int b, int c);
int func_ov002_022172f0(int a) {
    struct Entry *entry = &data_ov002_022cd420[data_ov002_022d016c.index];
    if (entry->busy == 0) {
        struct Bits *word = (struct Bits *)(data_ov002_022cf16c + (entry->side & 1) * 0x868 + 0x30 + entry->slot * 0x14);
        if (entry->value == (word->field * 2 + word->bit))
            func_ov002_021de910(a, entry->side, entry->slot);
    }
    return 0;
}


