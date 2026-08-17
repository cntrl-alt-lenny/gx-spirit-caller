typedef void *(*fnptr_t)(int, int);

typedef struct {
    char _pad_00[0x8];
    int field_8;
    int field_c;
    fnptr_t field_10;
} obj2_t;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02032344(obj2_t *obj, fnptr_t fn, int arg2);
extern void *func_020945f4(void *dst, int val, int len);

extern obj2_t *data_0219b2b4;

void *func_02032370(obj2_t *obj, fnptr_t fn, int arg2, int arg3) {
    int saved;
    void *r;

    if (obj == 0) {
        obj = fn(0x18, 4);
        if (obj == 0) {
            return obj;
        }
        func_020945f4(obj, 0, 0x18);
    }
    saved = OS_DisableIrq();
    data_0219b2b4 = obj;
    OS_RestoreIrq(saved);
    func_02032344(obj, fn, arg2);
    obj->field_8 = arg3;
    r = obj->field_10(arg3, 0x20);
    obj->field_c = (int)r;
    return func_020945f4(r, 0, obj->field_8);
}
