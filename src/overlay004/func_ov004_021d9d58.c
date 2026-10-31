extern char data_ov004_0220b500[];
extern struct { char pad[0xbd8]; int value; } data_ov004_0220e500;
extern char data_ov004_022915e8[];
extern void func_0201d050(void *p);
extern int func_020347b8(void);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern void func_ov004_021c9d8c(int x);
extern void func_ov004_021c9ef0(int selfv);
extern void func_ov004_021d8cd0(void *rec);
extern int func_ov004_021d9948(void);
extern void func_ov004_021d997c(void);
extern void func_ov004_021d9b98(void);
int func_ov004_021d9d58(void) {
    char *b;
    data_ov004_0220e500.value = -1;
    b = data_ov004_0220b500;
    if (*(int *)(b + 0x5c) == 0) {
        if (func_020347b8() == 0) func_ov004_021c9d8c(1);
        switch (*(int *)(b + 0x54)) {
        case 4:
            func_0201d050(0);
            if (*(int *)(b + 0x220)) {
                func_ov004_021d8cd0(data_ov004_022915e8);
                func_ov004_021c9ef0(0xe1);
                ++*(int *)(b + 0x54);
            }
            break;
        case 5:
            func_ov004_021d997c();
            if (*(int *)(b + 0x224)) ++*(int *)(b + 0x224);
            if (*(int *)(b + 0x228)) ++*(int *)(b + 0x228);
            if (*(int *)(b + 0x224) > 30 && *(int *)(b + 0x228) > 30) {
                if (func_ov004_021d9948()) {
                    *(int *)(b + 0x234) = 1;
                    switch (*(int *)(b + 0x22c)) {
                    case 0: func_0201d050((void *)1); break;
                    case 1: func_0201d050((void *)2); break;
                    }
                    ++*(int *)(b + 0x54);
                    *(int *)(b + 0x78) = 1;
                } else {
                    *(int *)(b + 0x228) = 0;
                    *(int *)(b + 0x224) = 0;
                    func_ov004_021c9ef0(0xea);
                    func_02037208(0x42, -1, 0, 1);
                }
            }
            break;
        }
    }
    func_ov004_021d9b98();
    return 0;
}


