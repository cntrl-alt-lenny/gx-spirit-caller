extern int func_02053d10(int *p, int a1, int a2, int a3, int a5);
extern void *func_020540d0(char *s, int index);
extern void func_020a6d54(int a, int b, int c, int d);
extern char data_020ffb8c[];
extern char data_020ffb80[];

typedef struct {
    int **items;
    int context;
    int unused;
    int (*hash)(int, int);
    int compare;
} Table;

void *func_0205442c(Table *p, int key) {
    int bucket;
    int index;
    if (p == 0) {
        func_020a6d54((int)data_020ffb8c, (int)data_020ffb80, 0, 0x94);
    }
    if (p == 0) {
        return 0;
    }
    bucket = p->hash(key, p->context);
    index = func_02053d10(p->items[bucket], key, p->compare, 0, 0);
    if (index == -1) {
        return 0;
    }
    return func_020540d0((char *)p->items[bucket], index);
}
