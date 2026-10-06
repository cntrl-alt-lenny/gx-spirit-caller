typedef struct {
    int key;
    int len;
} kv_02069de4_t;

typedef struct {
    char  _0[0x8];
    void *table;
} obj_02069de4_t;

extern void func_0206aacc(obj_02069de4_t *p);
extern void *func_020541b8(int elemSize, int count, int extra);
extern int func_0206b44c(signed char *s, int n);
extern int func_0206b4fc(void *a0, int a1);
extern void func_0205407c(void *self, void *val);

int func_02069de4(obj_02069de4_t *o, unsigned char *p, int len) {
    kv_02069de4_t kv;
    int i;
    int n;
    int l;

    len--;
    n = *p++;
    if (o->table != 0) {
        func_0206aacc(o);
    }
    o->table = func_020541b8(8, n, 0);
    if (o->table == 0) {
        return 5;
    }
    for (i = 0; i < n; i++) {
        if (len < 2) {
            return 4;
        }
        l = func_0206b44c((signed char *)(p + 1), len - 1);
        if (l == -1) {
            return 4;
        }
        kv.len = *p;
        kv.key = func_0206b4fc(o, (int)(p + 1));
        func_0205407c(o->table, &kv);
        p += l + 1;
        len -= l + 1;
    }
    return 0;
}
