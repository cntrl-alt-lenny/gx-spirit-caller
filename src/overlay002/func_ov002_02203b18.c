extern char data_ov002_022cf16c[];
extern int func_ov002_021c2624(int side, int slot, unsigned int card);
struct Entry { unsigned int card : 13; unsigned int rest : 19; int pad[4]; };
int func_ov002_02203b18(void) {
    int side, slot;
    struct Entry *entry;
    for (side = 0; side < 2; side++) {
        slot = 5;
        entry = (struct Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x94);
        do {
            if (func_ov002_021c2624(side, slot, entry->card)) return 1;
            slot++;
            entry++;
        } while (slot < 10);
    }
    return 0;
}
