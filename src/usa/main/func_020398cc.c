typedef struct {
    char _pad_00[0x2];
    unsigned short field_2;
} data_0219c480_t;

extern unsigned short data_0219b212;
extern void (*data_0219b220)(void *);
extern void *data_0219b22c;
extern data_0219c480_t data_0219c3a0;

extern void func_02091c10(void);
extern int func_0203a0b4(void);
extern void func_020919a4(int);

void func_020398cc(void) {
    int r;

    for (;;) {
        if (data_0219b212 & 4) {
            data_0219b212 &= ~4;
            func_02091c10();
        }
        r = func_0203a0b4();
        data_0219c3a0.field_2 = r & 1;
        if (r != 0) {
            continue;
        }
        if (data_0219b220 != 0) {
            data_0219b220(data_0219b22c);
        }
        func_020919a4(0);
    }
}
