typedef struct {
    char  _0[0xc];
    int   state;
    char  _10[0x8c];
    void *f9c;
} obj_02064208_t;

extern int func_02054140(void *p);
extern int func_02061798(void *self, int arg1, void *arg2, int arg3, int arg4);
extern int func_02061b60(void *self, void *a, int b, int c);

int func_02064208(obj_02064208_t *o, void *a, int b) {
    if (o->state != 5 && o->state != 6) {
        return 1;
    }
    if (func_02054140(o->f9c) != 0) {
        return func_02061798(o, 0, a, b, 0) != 0;
    }
    return func_02061b60(o, a, b, 0) != 0;
}
