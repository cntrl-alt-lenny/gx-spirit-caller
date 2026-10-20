typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { u16 key, base; u8 count, pad; u8 flags[6]; } Entry;
typedef struct { Entry *entries; } Table;
extern void Fill32(unsigned int value, void *dest, unsigned int size);
extern int func_0202c518(unsigned short *a, unsigned short *b);
extern int func_020059b0(void *key, void *base, int count, int size, int (*compare)(unsigned short *, unsigned short *));
extern int data_020c7b40;
extern struct { int pad[2]; Table *table; } data_0219a93c;
int func_0202c528(signed char *s) {
    Entry key;
    int number, index;
    Entry *entry;
    int flags, part, i, found;
    number = (s[9]-'0')*1000 + (s[10]-'0')*100 + (s[11]-'0')*10 + (s[12]-'0');
    Fill32(0, &key, 12);
    key.key = number;
    index = func_020059b0(&key, data_0219a93c.table->entries, (u16)data_020c7b40, 12, func_0202c518);
    entry = &data_0219a93c.table->entries[index];
    if (index < 0) return 0;
    flags = 0;
    if (s[14] == 'a') part = 0; else part = 1;
    flags |= part << 6;
    if (s[15] == 'f') part = 0;
    else if (s[15] == 'b') part = 1;
    else part = 2;
    flags |= part << 4;
    if (s[16] == '0') part = 0;
    else if (s[16] == '1') part = 1;
    else if (s[16] == '2') part = 2;
    else if (s[16] == '3') part = 3;
    else part = 4;
    flags |= part << 1;
    flags |= s[17] == 'd' ? 1 : 0;
    found = 0;
    for (i = 0; i < entry->count; i++) {
        if (flags == entry->flags[i]) { found = i; break; }
    }
    return entry->base + found;
}

