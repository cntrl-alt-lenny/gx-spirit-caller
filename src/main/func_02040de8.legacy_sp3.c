extern int func_020aaf40(const char *a, const char *b);

typedef struct {
    const char *key;
    char *value;
} KeyValue;

typedef struct {
    char pad[0x1a34];
    KeyValue entries[0x20];
} Table;

char *func_02040de8(Table *table, const char *key) {
    int i;
    for (i = 0; i < 0x20; i++) {
        if (table->entries[i].key == 0) {
            break;
        }
        if (func_020aaf40(key, table->entries[i].key) == 0) {
            return table->entries[i].value;
        }
    }
    return 0;
}
