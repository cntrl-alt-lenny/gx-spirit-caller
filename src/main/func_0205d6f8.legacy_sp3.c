typedef struct {
    void **items;
    void *ctx;
    char pad8[4];
    int (*cb)(int param1, void *ctx);
    int a2;
} Self02054568;

typedef struct {
    Self02054568 *list;
    int count;
} Pool;

typedef struct {
    int key;
    int x4;
    int x8;
    int xc;
    int x10;
    int x14;
    int x18;
} Entry;

extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern int func_0205d6bc(void **pp, int val, int *out);
extern void func_02054568(Self02054568 *self, int param1);
extern char data_02100d74[];
extern char data_02100d7c[];

int func_0205d6f8(char **pp, int key) {
    Pool *pool = (Pool *)(*pp + 0x428);
    int found;

    if (key <= 0) {
        func_020a6d54(data_02100d74, data_02100d7c, 0, 0x2b5);
    }
    if (key <= 0) {
        return 0;
    }
    if (func_0205d6bc((void **)pp, key, &found) != 0) {
        return found;
    }
    {
        Entry e = {0};

        e.key = key;
        e.x4 = 0;
        e.xc = 0;
        e.x10 = 0;
        e.x18 = 0;
        e.x14 = 0;
        func_02054568(pool->list, (int)&e);
    }
    pool->count++;
    if (func_0205d6bc((void **)pp, key, &found) != 0) {
        return found;
    }
    return 0;
}
