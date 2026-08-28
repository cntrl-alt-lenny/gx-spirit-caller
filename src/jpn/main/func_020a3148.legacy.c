typedef struct {
    char pad_00[0xc];
    unsigned char field_c;
} data_021a9850_t;
extern data_021a9850_t data_021a9770;

extern int func_020a309c(void);
extern void func_020a3050(void);
extern int func_020a2ed8(int a0, int a1, int a2);
extern void func_020a2ea8(void);
extern int func_020a2c04(int a0, int a1, int a2);

int func_020a3148(int a0, int a1, int a2) {
    int r;

    for (;;) {
        switch (data_021a9770.field_c) {
        case 0:
        case 1:
            r = func_020a309c();
            if (r == 0) {
                return r;
            }
            break;
        case 2:
            func_020a3050();
            break;
        case 3:
            return func_020a2ed8(a0, a1, a2);
        case 4:
            func_020a2ea8();
            break;
        case 5:
            return func_020a2c04(a0, a1, a2);
        case 6:
        default:
            break;
        }
    }
}
