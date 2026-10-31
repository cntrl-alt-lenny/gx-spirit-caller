typedef struct Context Context;
typedef struct { Context *owner; int size; int offset; char *first; char *second; } Entry;
struct Context {
    int pad0[2];
    int arg;
    char *first;
    char *second;
    int pad14;
    int size;
    int index;
    int pad20[4];
    int count;
    void (*callback)(char *, char *, int, int, int);
    int extra;
};
extern int data_021a5204;
extern int data_021a5208;
extern char data_021a520c[];
extern Entry data_021a52a0[];
extern int func_0209256c(void *, void *, int);
extern void func_020928cc(void *, int);
void func_020886a0(Context *p) {
    char *first;
    char *second;
    int size = p->size;
    int offset = size * p->index;
    first = p->first + offset;
    second = p->second + offset;
    if (data_021a5204) {
        Entry *entry = &data_021a52a0[data_021a5208];
        entry->owner = p;
        entry->size = size;
        entry->offset = offset;
        entry->first = first;
        entry->second = second;
        func_0209256c(data_021a520c, entry, 0);
        if (++data_021a5208 >= 8) data_021a5208 = 0;
    } else {
        func_020928cc(first, size);
        func_020928cc(second, size);
        p->callback(first, second, size, p->arg, p->extra);
    }
    p->index++;
    if (p->index >= p->count) p->index = 0;
}

