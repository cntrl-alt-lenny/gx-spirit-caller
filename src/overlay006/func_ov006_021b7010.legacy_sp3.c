extern int func_0202df78(int a, int b);
typedef struct {
    unsigned short id;
    unsigned char count;
    unsigned char pad;
} Entry;

int func_ov006_021b7010(char *base, int kind, int target, int *out) {
    Entry *entry;
    int i;
    int total;
    int count;
    int j;
    switch (kind) {
    case 0: entry = (Entry *)(base + 0x2a0); entry = (Entry *)((char *)entry + 0x6000); break;
    case 1: entry = (Entry *)(base + 0xa60); entry = (Entry *)((char *)entry + 0x7000); break;
    case 2: entry = (Entry *)(base + 0xc60); entry = (Entry *)((char *)entry + 0x7000); break;
    case 3: entry = (Entry *)(base + 0xe60); entry = (Entry *)((char *)entry + 0x7000); break;
    case 4: entry = (Entry *)(base + 0x60); entry = (Entry *)((char *)entry + 0x8000); break;
    }
    count = *(unsigned short *)(base + kind * 2 + 0x8160);
    total = 0;
    for (i = 0; i < count; i++) {
        if (func_0202df78(target, entry->id)) {
            if (out) {
                for (j = 0; j < entry->count; j++) {
                    (out + total)[j] = entry->id;
                }
            }
            total += entry->count;
        }
        entry++;
    }
    return total;
}




