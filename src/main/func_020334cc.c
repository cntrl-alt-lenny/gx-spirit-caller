typedef struct {
    char   _pad[0xe80];
    void  *handle;
    int    handle_a;
    int    handle_b;
    char   _pad2[0x38];
    void (*callback)(void *h, int a, int b);
} obj_020334cc_t;

extern void *func_020452c4(int *a, int *b);

void *func_020334cc(obj_020334cc_t *o) {
    int a;
    int b;
    void *h;

    if (o->handle != 0) {
        return o->handle;
    }
    h = func_020452c4(&a, &b);
    if (h == 0) {
        return 0;
    }
    o->handle = h;
    o->handle_a = a;
    o->handle_b = b;
    if (o->callback != 0) {
        o->callback(h, a, b);
    }
    return h;
}
