typedef struct {
    char _pad_00[0x14];
    unsigned int lowbits : 3;
} Struct02104f3c;

extern Struct02104f3c data_02104e5c;
extern void func_02008bf4(void);
extern int func_02008d44(int a1, void *a2);
extern void func_02094500(void *dst, int val, int size);
extern int func_02011b34(int i);
extern void func_020aad04(void *p, int v);
extern unsigned short func_02011b18(int i);
extern int func_02011b68(void *p, int v);

int func_02008f08(int mode, int a1, char *a2) {
    func_02008bf4();
    switch (mode) {
    case 0:
        return func_02008d44(a1, a2);
    case 1:
        func_02094500(a2, 0, 0x124);
        *a2 = data_02104e5c.lowbits;
        func_020aad04(a2 + 1, func_02011b34(a1 + 1));
        return func_02011b68(a2 + 0x1c, func_02011b18(a1 + 1));
    default:
        return 0;
    }
}
