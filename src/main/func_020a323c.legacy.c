typedef struct {
    char pad_00[0xc];
    unsigned char field_c;
} data_021a9850_t;
extern data_021a9850_t data_021a9850;

extern int func_020a3190(void);
extern void func_020a3144(void);
extern int func_020a2fcc(int a0, int a1, int a2);
extern void func_020a2f9c(void);
extern int func_020a2cf8(int a0, int a1, int a2);

int func_020a323c(int a0, int a1, int a2) {
    int r;

    for (;;) {
        switch (data_021a9850.field_c) {
        case 0:
        case 1:
            r = func_020a3190();
            if (r == 0) {
                return r;
            }
            break;
        case 2:
            func_020a3144();
            break;
        case 3:
            return func_020a2fcc(a0, a1, a2);
        case 4:
            func_020a2f9c();
            break;
        case 5:
            return func_020a2cf8(a0, a1, a2);
        case 6:
        default:
            break;
        }
    }
}
