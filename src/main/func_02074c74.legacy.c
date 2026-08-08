typedef struct {
    char pad_00[0x8];
    unsigned char field_8;
    char pad_09[3];
    void *field_c;
} A0Type_02074c74;

extern int func_02070d90(A0Type_02074c74 *a0);
extern void func_020785cc(void *p);
extern void func_02077f8c(void *p);
extern int func_02074cdc(A0Type_02074c74 *a0);

int func_02074c74(A0Type_02074c74 *a0) {
    char *r4 = (char *)a0->field_c;
    if (a0->field_8 != 4) {
        if (func_02070d90(a0) != 0) {
            return 1;
        }
    }
    *(unsigned char *)(r4 + 0x455) = 0;
    *(int *)(r4 + 0x1d4) = 0;
    {
        void *p = r4 + 0x2ec;
        *(unsigned char *)(r4 + 0x454) = 0;
        func_020785cc(p);
    }
    func_02077f8c(r4 + 0x3a4);
    return func_02074cdc(a0);
}
