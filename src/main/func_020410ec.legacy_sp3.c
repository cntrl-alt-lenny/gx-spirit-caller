extern char data_020fe81c[];
extern char data_020fe83c[];
extern char data_020fe85c[];
extern char data_020fe878[];
extern int func_020aaddc(const char *s);
extern char *func_020aadf8(char *dst, const char *src);
typedef void *(*AllocFn)(const char *label, int size);
typedef void (*FreeFn)(const char *label, void *p, int line);
typedef struct { char *first; char *second; } Entry;
typedef struct { Entry *entries; int capacity; int count; } Table;
int func_020410ec(char *self, Table *table, const char *first, const char *second) {
    AllocFn alloc_fn = *(AllocFn *)(self + 0x1010);
    FreeFn free_fn = *(FreeFn *)(self + 0x1014);
    if (table->count > table->capacity) return 0;
    table->entries[table->count].first = alloc_fn(data_020fe81c, func_020aaddc(first) + 1);
    if (table->entries[table->count].first != 0) {
        table->entries[table->count].second = alloc_fn(data_020fe83c, func_020aaddc(second) + 1);
        if (table->entries[table->count].second != 0) {
            func_020aadf8(table->entries[table->count].first, first);
            func_020aadf8(table->entries[table->count].second, second);
            table->count++;
            return 1;
        }
    }
    if (table->entries[table->count].first != 0) {
        free_fn(data_020fe85c, table->entries[table->count].first, 0);
        table->entries[table->count].first = 0;
    }
    if (table->entries[table->count].second != 0) {
        free_fn(data_020fe878, table->entries[table->count].second, 0);
        table->entries[table->count].second = 0;
    }
    return 0;
}
