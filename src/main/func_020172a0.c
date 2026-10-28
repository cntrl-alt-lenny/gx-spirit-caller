extern char *GetSystemWork(void);
extern void *func_02017290(void);
extern void func_02018a64(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201b730(int a0);
extern void func_0201b7b4(void);
struct Bit0 { unsigned int b : 1; };
struct Bit1 { unsigned int pad : 1; unsigned int b : 1; };
void func_020172a0(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_02019664() != 0x70) return;
        *(int *)((char *)o + 8) = 0x00210100;
        if (((struct Bit1 *)(w + 0x8e0))->b == 0)
            func_02019640(0);
        func_02018a64();
        return;
    case 2:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x70) return;
            *(int *)((char *)o + 8) = 0x00210200;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                if (func_02017290() != 0) {
                    *(int *)((char *)o + 8) = 0x00210201;
                    return;
                }
                *(int *)((char *)o + 8) = 0x00210204;
                if (((struct Bit1 *)(w + 0x8e0))->b != 0) return;
                *(int *)(w + 0x920) = 2;
                *(int *)(w + 0x924) = 6;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x00210202;
                return;
            }
        case 5:
            *(int *)((char *)o + 8) = 0x00210205;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00210203;
            if (((struct Bit1 *)(w + 0x8e0))->b != 0) return;
            func_02019640(0);
            return;
        }
        break;

    case 3:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x70) return;
            *(int *)((char *)o + 8) = 0x00210300;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                if (func_02017290() != 0) {
                    *(int *)((char *)o + 8) = 0x00210301;
                    return;
                }
                *(int *)((char *)o + 8) = 0x00210304;
                if (((struct Bit1 *)(w + 0x8e0))->b != 0) return;
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 6;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x00210302;
                return;
            }
        case 5:
            *(int *)((char *)o + 8) = 0x00210205;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00210303;
            if (((struct Bit1 *)(w + 0x8e0))->b != 0) return;
            func_02019640(0);
            return;
        }
        break;

    case 4:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x70) return;
            *(int *)((char *)o + 8) = 0x00210400;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                if (func_02017290() != 0) {
                    *(int *)((char *)o + 8) = 0x00210401;
                    return;
                }
                *(int *)((char *)o + 8) = 0x00210404;
                if (((struct Bit1 *)(w + 0x8e0))->b != 0) return;
                *(int *)(w + 0x920) = 4;
                *(int *)(w + 0x924) = 6;
                return;
            } else {
                *(int *)((char *)o + 8) = 0x00210402;
                return;
            }
        case 5:
            *(int *)((char *)o + 8) = 0x00210205;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00210403;
            func_0201b7b4();
            *(int *)(w + 0x900) &= ~0x1000000;
            func_0201b730(0xb);
            return;
        }
        break;
    }
}


