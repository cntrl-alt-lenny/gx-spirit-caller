typedef struct {
    int count;
    int capacity;
    int elem_size;
    int grow;
    int _pad10;
    char *data;
} Vec;

extern int func_020453cc(int x, int y);
extern void func_020a6d54(void *a0, void *a1, int a2, int a3);
extern char data_020ffb70[];
extern char data_020ffb04[];

void func_020542b8(Vec *v) {
    v->capacity = v->capacity + v->grow;
    v->data = (char *)func_020453cc((int)v->data, v->capacity * v->elem_size);
    if (v->data == 0) {
        func_020a6d54(data_020ffb70, data_020ffb04, 0, 0x41);
    }
}
