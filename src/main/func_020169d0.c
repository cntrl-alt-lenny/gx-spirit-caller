extern char *GetSystemWork(void);
/* These forwarders leave a result in r0, consumed by the original caller. */
extern int func_020190ec(void);
extern int func_020139c4(void);
extern int func_020139b4(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201b7b4(void);

struct Bit0 { unsigned int b : 1; };

void func_020169d0(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(w + 0x8dc) + 1))
            *(int *)((char *)o + 8) = 0x001d0100;
        return;
    case 2:
        if (func_02019664() != 0x6a) return;
        if (func_020139b4() != 2) return;
        *(int *)((char *)o + 8) = 0x001d0200;
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        *(int *)((char *)o + 8) = 0x001d0300;
        return;
    case 4:
        *(int *)((char *)o + 8) = 0x001d0400;
        return;
    case 5:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            *(int *)((char *)o + 8) = 0x001d0500;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x001d0501;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x001d0502;
                return;
            }
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x001d0503;
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201b7b4();
            return;
        }
        break;
    case 6:
        *(int *)((char *)o + 8) = 0x001d0600;
        func_0201aabc(0x7a);
        return;
    }
}






