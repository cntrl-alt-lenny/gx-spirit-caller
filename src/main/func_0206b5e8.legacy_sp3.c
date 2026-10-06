typedef struct {
    char  _0[0x5d0];
    void *list;
} obj_0206b5e8_t;

extern int func_0206895c(void *p);
extern void func_02068b94(void **pp);

void func_0206b5e8(obj_0206b5e8_t *o) {
    void *p;
    void *next;

    if (o->list == 0) {
        return;
    }
    p = o->list;
    while (p != 0) {
        next = (void *)func_0206895c(p);
        func_02068b94(&p);
        p = next;
    }
    o->list = 0;
}
