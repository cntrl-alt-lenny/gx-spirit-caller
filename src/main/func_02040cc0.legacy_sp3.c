extern char data_020fe7b8[];
extern char data_020fe7d4[];

typedef void (*FreeFn)(const char *label, void *p, int line);

typedef struct {
    void *label;
    void *value;
} Entry;

void func_02040cc0(char *self, Entry *entries, int n) {
    FreeFn fn = *(FreeFn *)(self + 0x1014);
    int i;
    for (i = 0; i < n; i++) {
        if (entries[i].label != 0) {
            fn(data_020fe7b8, entries[i].label, 0);
            entries[i].label = 0;
        }
        if (entries[i].value != 0) {
            fn(data_020fe7d4, entries[i].value, 0);
            entries[i].value = 0;
        }
    }
}
