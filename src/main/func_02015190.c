extern char *GetSystemWork(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_02015190(int *o) {
    char *sw = GetSystemWork();
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(sw + 0x8dc) + 3)) func_0201abb0(2);
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 2) return;
            func_0201abd4(2);
            o[2] = 0xf0100;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x920) = 1;
                *(int *)(sw + 0x924) = 4;
            }
            x = *(int *)(sw + 0x8e0);
            x = (x & ~1) | 1;
            *(int *)(sw + 0x8e0) = x;
            break;
        case 3:
            if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
            if (func_020195ec() == 0) o[2] = 0xf0101;
            else o[2] = 0xf0102;
            break;
        case 2:
            o[2] = 0xf0103;
            func_0201b7b4();
            break;
        }
        break;
    case 2:
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 3)) return;
        if (func_0201b7e0(o) != 4) return;
        o[2] = 0xf0200;
        func_0201abb0(1);
        break;
    }
}
