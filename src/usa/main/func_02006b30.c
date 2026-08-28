typedef struct {
    void *field_0;
    char _pad_4[4];
    signed char *field_8;
} S_020c3e68_t;

extern S_020c3e68_t data_020c3d88;
typedef struct {
    int field_0;
    unsigned int idx : 3;
} S_02104f4c_t;
extern S_02104f4c_t data_02104e6c;
extern signed char *data_020c3d8c[8];

extern int func_020070e8(void *b, void *x);
extern void func_020aad04(signed char *c, void *b);
extern void func_02098294(void *a);
extern int func_02097f44(void *a, void *b);

int func_02006b30(void *a, void *b, signed char *c) {
    int idx = func_020070e8(b, data_020c3d88.field_0);
    int result;
    if (idx != -1) {
        func_020aad04(c, b);
        b = c;
        c[idx] = *data_020c3d8c[data_02104e6c.idx];
    }
    func_02098294(a);
    result = func_02097f44(a, b);
    if (result == 0 && idx != -1) {
        c[idx] = *data_020c3d88.field_8;
        result = func_02097f44(a, b);
    }
    if (result == 0) {
        b = 0;
    }
    return (int)b;
}
