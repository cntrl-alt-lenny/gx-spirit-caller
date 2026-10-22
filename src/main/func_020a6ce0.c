typedef struct Entry {
    int f0;
    unsigned int unused : 7;
    unsigned int state : 3;
    unsigned int rest : 22;
    char pad[0x44];
} Entry;
extern Entry data_02102718[];
extern int func_020a70fc(void *p);
static inline Entry *next_entry(int *i) {
    if (*i < 3) {
        return &data_02102718[(*i)++];
    } else {
        return 0;
    }
}
int func_020a6ce0(void) {
    Entry *p = data_02102718;
    int result = 0;
    int i = 1;
    do {
        if (p->state != 0) {
            if (func_020a70fc(p) != 0)
                result = -1;
        }
        p = next_entry(&i);
    } while (p != 0);
    return result;
}

