extern char data_020ffb8c[];
extern char data_020ffb80[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_02053d10(int *p, int a1, int a2, int a3, int a5);
extern void *func_020540d0(char *s, int index);
typedef struct {
    int **items;
    int ctx;
    int pad8;
    int (*cb)(int, int);
    int a2;
} Set;
void *func_0205442c(Set *self, int key) {
    int slot;
    int result;
    if (self == 0) func_020a6d54((int)data_020ffb8c, (int)data_020ffb80, 0, 0x94);
    if (self == 0) return 0;
    slot = self->cb(key, self->ctx);
    result = func_02053d10(self->items[slot], key, self->a2, 0, 0);
    if (result == -1) return 0;
    return func_020540d0((char *)self->items[slot], result);
}
