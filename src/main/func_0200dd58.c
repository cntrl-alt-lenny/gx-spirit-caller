typedef struct {
    unsigned int _pad_low : 21;
    unsigned int count : 4;
    unsigned int _pad_high : 7;
} Bits60;

typedef struct {
    char _pad_00[0x58];
    void (*cb_58)(void *);
    void *arg_5c;
    Bits60 field_60;
    char _pad_64[0x284 - 0x64];
} Obj_0200dd58;

extern int func_020109a8(Obj_0200dd58 *arg);
extern int func_02010a98(Obj_0200dd58 *arg);
extern void Fill32(int val, void *dst, int size);

void func_0200dd58(Obj_0200dd58 *a) {
    a->field_60.count += 1;
    if (a->field_60.count <= 2) {
        return;
    }

    func_020109a8(a);
    func_02010a98(a);

    if (a->cb_58) {
        a->cb_58(a->arg_5c);
    }

    Fill32(0, a, 0x284);
}
