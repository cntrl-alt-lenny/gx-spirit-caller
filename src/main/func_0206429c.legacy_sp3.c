struct Self02053e58 { int count; };
typedef struct {
    char *data;
    int _4;
    int len;
} buf_0206133c_t;
typedef struct {
    char _0[0x50];
    buf_0206133c_t buf;
    int _5c;
    char *list;
} Obj;
extern void func_02053e58(struct Self02053e58 *self, int idx);
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern void func_0206133c(buf_0206133c_t *b, int off, int n);
extern int func_02064480(int a, int b);

int func_0206429c(Obj *self, int value) {
    int count;
    int i;
    int base;
    int *entry;

    count = func_02054140(self->list);
    if (count == 0) return 1;
    for (i = 0; i < count; i++) {
        if (func_02064480(*(unsigned short *)((char *)func_020540d0(self->list, i) + 8), value) >= 0)
            break;
    }
    if (i == 0) return 1;
    while (i-- != 0) {
        func_02053e58((struct Self02053e58 *)self->list, i);
    }
    count = func_02054140(self->list);
    if (count == 0) {
        self->buf.len = 0;
        return 1;
    }
    base = *(int *)func_020540d0(self->list, 0);
    for (i = 0; i < count; i++) {
        entry = func_020540d0(self->list, i);
        *entry -= base;
    }
    func_0206133c(&self->buf, 0, base);
    return 1;
}
