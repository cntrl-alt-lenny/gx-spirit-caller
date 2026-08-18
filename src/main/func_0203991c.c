typedef struct {
    char _pad_00[0x2];
    unsigned short field_2;
} data_0219c480_t;

extern unsigned short data_0219b2f2;
extern void (*data_0219b300)(void *);
extern void *data_0219b30c;
extern data_0219c480_t data_0219c480;

extern void func_02091cf8(void);
extern int func_0203a104(void);
extern void func_02091a8c(int);

void func_0203991c(void) {
    int r;

    for (;;) {
        if (data_0219b2f2 & 4) {
            data_0219b2f2 &= ~4;
            func_02091cf8();
        }
        r = func_0203a104();
        data_0219c480.field_2 = r & 1;
        if (r != 0) {
            continue;
        }
        if (data_0219b300 != 0) {
            data_0219b300(data_0219b30c);
        }
        func_02091a8c(0);
    }
}
