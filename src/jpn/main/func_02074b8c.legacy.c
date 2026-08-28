typedef struct {
    char pad_00[0x8];
    unsigned char field_8;
    char pad_09[3];
    void *field_c;
} A0Type_02074c74;

extern int func_02070ca8(A0Type_02074c74 *a0);
extern void func_020784e4(void *p);
extern void func_02077ea4(void *p);
extern int func_02074bf4(A0Type_02074c74 *a0);

int func_02074b8c(A0Type_02074c74 *a0) {
    char *r4 = (char *)a0->field_c;
    if (a0->field_8 != 4) {
        if (func_02070ca8(a0) != 0) {
            return 1;
        }
    }
    *(unsigned char *)(r4 + 0x455) = 0;
    *(int *)(r4 + 0x1d4) = 0;
    {
        void *p = r4 + 0x2ec;
        *(unsigned char *)(r4 + 0x454) = 0;
        func_020784e4(p);
    }
    func_02077ea4(r4 + 0x3a4);
    return func_02074bf4(a0);
}
