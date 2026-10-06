typedef struct {
    char _pad[0xc];
} entry_0203276c_t;

typedef struct {
    char              _pad[0xe7c];
    entry_0203276c_t *entries;
    char              _pad2[0x2c];
    int               count;
} obj_0203276c_t;

extern int func_02053170(entry_0203276c_t *e);
extern void func_020535a4(entry_0203276c_t *e);

void func_0203276c(obj_0203276c_t *o) {
    int i;

    for (i = 0; i < o->count; i++) {
        if (func_02053170(&o->entries[i]) == 1) {
            func_020535a4(&o->entries[i]);
        }
    }
}
