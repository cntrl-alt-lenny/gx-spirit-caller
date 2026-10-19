typedef struct {
    unsigned char pad0[0x34];
    int id;
    unsigned char pad38[0x30];
    unsigned short flags;
    signed char slot;
    unsigned char pad6b[3];
    signed char same;
    signed char group;
    unsigned char pad70[8];
} Entry;
extern Entry data_0219b760[];

void func_02036c6c(Entry *p, int clear) {
    Entry *entry;
    int i;
    int count;
    int old;
    int end;
    int id;
    int j;
    int old2;
    int count2;
    Entry *entry2;
    if (p == 0) return;
    if (p->slot >= 4) {
        if (p->slot >= 0x14) {
            i = 0x14;
            end = 0x1c;
        } else {
            i = 4;
            end = 0x14;
        }
    } else {
        i = 0;
        end = 4;
    }
    entry = &data_0219b760[i];
    old = p->group;
    count = 0;
    if (old < 0) old = 0xff;
    do {
        if (entry->slot >= 0 && !(entry->flags & 0x2000)) {
            count++;
            if (entry->group >= old) --entry->group;
        }
        i++;
        entry++;
    } while (i < end);
    p->group = count;
    old2 = p->same;
    id = p->id;
    entry2 = data_0219b760;
    if (old2 < 0) old2 = 0xff;
    j = count2 = 0;
    for (; j < 0x1c; j++, entry2++) {
        if (entry2->slot >= 0 && entry2->id == id) {
            count2++;
            if (entry2->same >= old2) --entry2->same;
        }
    }
    p->same = count2;
    if (clear) {
        p->group = -1;
        p->same = p->group;
    }
}






