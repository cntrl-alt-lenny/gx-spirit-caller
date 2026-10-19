struct Self02053e58 { int count; };
extern void func_02053e58(struct Self02053e58 *self, int idx);
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern char *data_0219e518;

typedef union Callback {
    void (*a)(int, int, int, int, int);
    void (*b)(int, int, int, int, int, int, int, int, int);
    void (*c)(int, int, int, int, int, int, int);
    void (*d)(int, int, int, int);
} Callback;
typedef struct Entry {
    unsigned int type;
    int a, b, c, d, context;
    Callback callback;
} Entry;

void func_02060604(int index, int a, int b, int c, int d) {
    Entry *entry;
    if (index < 0) return;
    if (index >= func_02054140(data_0219e518)) return;
    entry = func_020540d0(data_0219e518, index);
    if (entry->callback.a != 0) {
        switch (entry->type) {
        case 0:
            entry->callback.a(entry->a, entry->b, a, c, entry->context);
            break;
        case 1:
            entry->callback.b(entry->a, entry->b, entry->c, entry->d, a, b, c, d, entry->context);
            break;
        case 2:
            entry->callback.c(entry->a, entry->b, entry->c, entry->d, a, b, entry->context);
            break;
        case 3:
            entry->callback.d(entry->a, entry->b, a, entry->context);
            break;
        }
    }
    func_02053e58((struct Self02053e58 *)data_0219e518, index);
}
