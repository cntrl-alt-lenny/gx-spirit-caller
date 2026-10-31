typedef struct {
    char pad[0x68];
    unsigned short flags;
    signed char state;
    char pad6b[4];
    signed char priority;
} Entry;
extern Entry *data_0219b344[];
extern short data_0219b2e0[];

int func_0203724c(void) {
    int priority;
    int special;
    int count;
    count = 0;
    special = -1;
    priority = -1;
    int selected = -1;
    int last = -1;
    int i;
    for (i = 0; i < 4; i++) {
        Entry *entry = data_0219b344[i];
        if (entry == 0) continue;
        if (entry->state < 0) {
            data_0219b344[i] = 0;
            continue;
        }
        last = i;
        count++;
        if (entry->flags & 0x200) {
            special = i;
            if (entry->flags & 0x400) special |= 0x80;
        } else if (!(entry->flags & 0x3003)) {
            if (selected < 0 || entry->priority > priority) {
                priority = entry->priority;
                selected = i;
            }
        }
    }
    if (special >= 0 && (selected < 0 || !(special & 0x80)))
        selected = special & 0xf;
    if (selected < 0 && count == 1) selected = last;
    data_0219b2e0[2] = selected;
    return selected;
}



