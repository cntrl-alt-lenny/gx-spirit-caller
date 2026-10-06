typedef struct {
    char  _0[0x4];
    void *list;
} obj_0206b778_t;

extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);

int func_0206b778(obj_0206b778_t *o, int key) {
    int n = func_02054140(o->list);
    int i;

    for (i = 0; i < n; i++) {
        if (key == *(int *)func_020540d0(o->list, i)) {
            return i;
        }
    }
    return -1;
}
