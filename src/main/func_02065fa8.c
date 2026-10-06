typedef struct {
    char _0[0x8];
    int  key;
} entry_02065fa8_t;

extern void *data_0219e968;
extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);

entry_02065fa8_t *func_02065fa8(int key) {
    entry_02065fa8_t *e;
    int i;

    if (data_0219e968 == 0) {
        return 0;
    }
    for (i = 0; i < func_02054140(data_0219e968); i++) {
        e = func_020540d0(data_0219e968, i);
        if (e->key == key) {
            return e;
        }
    }
    return 0;
}
