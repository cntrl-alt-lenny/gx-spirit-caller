typedef struct Entry {
    short id;
    char rest[0x16];
} Entry;
extern Entry data_020c9694[];
extern int func_0202bcb0(int value);

Entry *func_ov007_021b2ef0(void *unused, int value) {
    Entry *entry = data_020c9694;
    value = func_0202bcb0(value);
    while (entry->id >= 0) {
        if (entry->id == value) {
            return entry;
        }
        entry++;
    }
    return 0;
}
