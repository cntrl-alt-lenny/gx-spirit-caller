typedef struct {
    int count;
    int capacity;
    int elem_size;
    int grow;
    int _pad10;
    char *data;
} Vec;

extern void *func_020453cc(void *p, int size);
extern void func_020a6d54(const char *expr, const char *file, const char *func, int line);
extern char data_020ffb70[];
extern char data_020ffb04[];

void func_020542b8(Vec *v) {
    v->capacity = v->capacity + v->grow;
    v->data = func_020453cc(v->data, v->capacity * v->elem_size);
    if (v->data == 0) {
        func_020a6d54(data_020ffb70, data_020ffb04, 0, 0x41);
    }
}
