/* func_02077a28: find the entry in ctx's table whose first field matches key. */
typedef struct {
    int *name;
} Ent;
typedef struct {
    unsigned char _pad_00[0x814];
    Ent **table;
    int count;
} Ctx;
extern int func_020aaf40(int *a, void *b);

Ent *func_02077a28(Ctx *c, void *key) {
    int i;
    Ent **t;
    int n;
    n = c->count;
    i = 0;
    if (n > 0) {
        t = c->table;
        do {
            if (func_020aaf40(t[i]->name, key) == 0) {
                return t[i];
            }
            i++;
        } while (i < n);
    }
    return 0;
}
