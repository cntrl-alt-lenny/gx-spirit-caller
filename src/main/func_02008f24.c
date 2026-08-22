typedef struct {
    char _pad_00[0x14];
    unsigned int lowbits : 3;
} Struct02104f3c;

extern Struct02104f3c data_02104f3c;
extern void func_02008c10(void);
extern int func_02008d60(int a1, void *a2);
extern void func_020945f4(void *dst, int val, int size);
extern int func_02011b68(int i);
extern void func_020aadf8(void *p, int v);
extern unsigned short func_02011b4c(int i);
extern int func_02011b9c(void *p, int v);

int func_02008f24(int mode, int a1, char *a2) {
    func_02008c10();
    switch (mode) {
    case 0:
        return func_02008d60(a1, a2);
    case 1:
        func_020945f4(a2, 0, 0x124);
        *a2 = data_02104f3c.lowbits;
        func_020aadf8(a2 + 1, func_02011b68(a1 + 1));
        return func_02011b9c(a2 + 0x1c, func_02011b4c(a1 + 1));
    default:
        return 0;
    }
}
