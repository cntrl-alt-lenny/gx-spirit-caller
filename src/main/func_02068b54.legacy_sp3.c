typedef struct {
    int a;
    int b;
} key_02068b54_t;

typedef struct {
    char _0[0x18];
    int  table;
} rec_02068b54_t;

extern int func_0206b4fc(void *a0, int a1);
extern void func_02054568(int handle, key_02068b54_t *key);

void func_02068b54(rec_02068b54_t *rec, int name, int value) {
    key_02068b54_t kv;

    kv.a = func_0206b4fc(0, name);
    kv.b = func_0206b4fc(0, value);
    func_02054568(rec->table, &kv);
}
