typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern char data_ov004_0220b500[];
extern char data_ov004_022915e8[];
extern void func_0201ca88(void);
extern void *func_0201d030(void);
extern int func_0201d0e8(void);
extern int func_0201d34c(void);
extern void func_0201d398(void);
extern void *func_0202c0c0(int);
/* This caller supplies a fourth argument although the callee uses only three. */
extern void func_ov004_021c9dd4(void *, void *, int, int);
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
extern void func_ov004_021ca198(void);
extern void func_ov004_021cbf38(int id);
extern void func_ov004_021cbf84(void);
extern void func_ov004_021cc0e0(int);
extern void func_ov004_021cc63c(void);
extern void func_ov004_021cc97c(void);
extern void func_ov004_021cca30(void);
extern void func_ov004_021cd6c4(void);
extern int func_ov004_021cd924(void);
extern int func_ov004_021d8798(void *, void *, int);
extern int func_ov004_021d8d58(void *);
extern int func_ov004_021d9134(void *);

int func_ov004_021cda8c(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x54) == 0) func_0201ca88();
    if (func_ov004_021cd924() == 0 && func_0201d34c() == 0) {
        switch (*(int *)(b + 0x54)) {
        case 0:
            func_ov004_021cbf38(0);
            if (*(int *)(b + 0x58) == 0 && *(int *)(b + 0x64) == 0) {
                func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0xd6), 0x12);
                *(int *)(b + 0x58) = 1;
            }
            *(int *)(b + 0x64) = 0;
            func_ov004_021cc97c();
            break;
        case 1:
            switch ((int)func_0201d030()) {
            case 0:
                if (++*(int *)(b + 0x70) >= 8) {
                    *(int *)(b + 0x70) = 0;
                    func_0201d398();
                }
                break;
            case 1:
                *(int *)(b + 0x54) = 0;
                *(int *)(b + 0x58) = 0;
                break;
            case 3: func_ov004_021cca30(); break;
            }
            if (func_0201d0e8() != 0) func_ov004_021cbf38(2);
            else func_ov004_021cbf38(1);
            break;
        case 2:
            switch ((int)func_0201d030()) {
            case 4:
                func_ov004_021cc63c();
                func_ov004_021cbf38(3);
                break;
            case 5:
                func_ov004_021cc0e0(0);
                ++*(int *)(b + 0x54);
                break;
            case 0: case 1: case 3:
                *(int *)(b + 0x54) = 0;
                *(int *)(b + 0x58) = 0;
                break;
            }
            break;
        case 3:
            switch ((int)func_0201d030()) {
            case 4: func_ov004_021cc63c(); break;
            case 5:
                switch (*(int *)(b + 0x78)) {
                case 1:
                    *(int *)(b + 0x48) = 1;
                    ++*(int *)(b + 0x54);
                    break;
                case 2:
                    *(int *)(b + 0x54) = 0;
                    *(int *)(b + 0x58) = 0;
                    break;
                }
                func_ov004_021cbf38(4);
                break;
            case 0: case 1: case 3:
                *(int *)(b + 0x54) = 0;
                *(int *)(b + 0x58) = 0;
                break;
            }
            break;
        }
    }
    func_ov004_021d8d58(data_ov004_022915e8);
    func_ov004_021ca198();
    func_ov004_021cd6c4();
    func_ov004_021d9134(data_ov004_022915e8);
    func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0, 0, 2, 0x1f);
    func_ov004_021cbf84();
    func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0xe4, 3, 2, *(int *)(b + 0xa0));
    func_ov004_021c9dd4((void *)0x05000638, b + 0x5ef0, 4, 0x00600100);
    return 0;
}
