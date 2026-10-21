typedef struct Self02054568 Self02054568;
typedef struct {
    int key;
    short kind;
    short pad6;
    void *owner;
    char padc[0x10];
    int time;
    char pad20[0x24];
    char first[0xc];
    char second[0xc];
    void *a;
    void *b;
    short x;
    short y;
    char pad68[0x20];
    int time2;
    char pad8c[0xc];
    void *c;
    void *d;
} Entry;
typedef struct {
    char pad0[0xc];
    Self02054568 *list;
    char pad10[0x28];
    void *size1;
    void *size2;
} Owner;
/* The original supplies only r0 to these allocation/free thunks. */
extern int func_02064a88();
extern int func_020453b4();
extern int *func_02064d10(void *p, int a, short b);
extern int func_020a73d4(int x, int unused1, int unused2);
extern int func_02055330(void);
extern int func_02061540(char *s, void *param1);
extern void *func_020541b8(int elemSize, int count, int extra);
extern void func_02054148(void *p);
extern void func_02054568(Self02054568 *self, int param1);

int func_02064864(Owner *owner, int **out, int key, short kind) {
    Entry *entry = 0;
    if (func_02064d10(owner, key, kind) != 0) return 5;
    entry = (Entry *)func_02064a88();
    if (entry != 0) {
        func_020a73d4((int)entry, 0, 0xa0);
        entry->key = key;
        entry->kind = kind;
        entry->owner = owner;
        entry->time = func_02055330();
        entry->time2 = entry->time;
        entry->x = 0;
        entry->y = 0;
        if (func_02061540(entry->first, owner->size2) != 0) {
            if (func_02061540(entry->second, owner->size1) != 0) {
                entry->a = func_020541b8(0x10, 0x40, 0);
                if (entry->a != 0) {
                    entry->b = func_020541b8(0x10, 0x40, 0);
                    if (entry->b != 0) {
                        entry->c = func_020541b8(4, 2, 0);
                        if (entry->c != 0) {
                            entry->d = func_020541b8(4, 2, 0);
                            if (entry->d != 0) {
                                func_02054568(owner->list, (int)&entry);
                                *out = func_02064d10(owner, key, kind);
                                if (*out != 0) return 0;
                            }
                        }
                    }
                }
            }
        }
    }
    if (entry != 0) {
        func_020453b4(*(void **)entry->first);
        func_020453b4(*(void **)entry->second);
        if (entry->a != 0) func_02054148(entry->a);
        if (entry->b != 0) func_02054148(entry->b);
        if (entry->c != 0) func_02054148(entry->c);
        if (entry->d != 0) func_02054148(entry->d);
        func_020453b4(entry);
    }
    return 1;
}
