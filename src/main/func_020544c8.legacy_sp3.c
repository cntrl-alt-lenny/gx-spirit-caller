extern char data_020ffb8c[];
extern char data_020ffb80[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_02053d10(int *p, int a1, int a2, int a3, int a5);
struct Self02053e58 { int count; };
extern void func_02053e58(struct Self02053e58 *self, int idx);

typedef struct {
    int **lists;
    int arg;
    int unused;
    int (*hash)(int, int);
    int compare;
} Set;

int func_020544c8(Set *self, int value) {
    int bucket;
    int index;
    if (self == 0) {
        func_020a6d54((int)data_020ffb8c, (int)data_020ffb80, 0, 0x82);
    }
    if (self == 0) return 0;
    bucket = self->hash(value, self->arg);
    index = func_02053d10(self->lists[bucket], value, self->compare, 0, 0);
    if (index == -1) return 0;
    func_02053e58((struct Self02053e58 *)self->lists[bucket], index);
    return 1;
}
