extern int func_020453e8(int a);
extern void func_020a6d54(int a, int b, int c, int d);
extern void *func_020541b8(int elemSize, int count, int extra);
extern char data_020ffb80[], data_020ffb8c[], data_020ffb94[], data_020ffb9c[], data_020ffba4[], data_020ffbb0[], data_020ffbbc[];
typedef struct {
    void ** volatile items;
    int count;
    int extra;
    int a3;
    int a4;
} Obj;
Obj *func_02054700(int elemSize, int count, int capacity, int a3, int a4, int extra) {
    Obj *obj;
    int i;
    if (a3 == 0) func_020a6d54((int)data_020ffb94, (int)data_020ffb80, 0, 0x38);
    if (a4 == 0) func_020a6d54((int)data_020ffb9c, (int)data_020ffb80, 0, 0x39);
    if (elemSize == 0) func_020a6d54((int)data_020ffba4, (int)data_020ffb80, 0, 0x3a);
    if (count == 0) func_020a6d54((int)data_020ffbb0, (int)data_020ffb80, 0, 0x3b);
    obj = (Obj *)func_020453e8(0x14);
    if (obj == 0) func_020a6d54((int)data_020ffb8c, (int)data_020ffb80, 0, 0x3e);
    obj->items = (void **)func_020453e8(count * 4);
    if (obj->items == 0) func_020a6d54((int)data_020ffbbc, (int)data_020ffb80, 0, 0x41);
    for (i = 0; i < count; i++) {
        obj->items[i] = func_020541b8(elemSize, capacity, extra);
    }
    obj->count = count;
    obj->extra = extra;
    obj->a4 = a4;
    obj->a3 = a3;
    return obj;
}

