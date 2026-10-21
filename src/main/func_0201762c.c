extern char *GetSystemWork(void);
/* These void-defined forwarding thunks preserve the result in r0, read here. */
extern int func_020139b4(void);
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
struct Bit0 { unsigned int b : 1; };
struct Bit1 { unsigned int pad : 1; unsigned int b : 1; };
void func_0201762c(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 3;
        case 3:
            if (func_020190ec() == 0) return;
            if (func_020139c4() != 0) return;
            if (func_0201b7e0(o) != 4) return;
            if ((unsigned int)func_02019034() >= (unsigned int)*(int *)(w + 0x8dc) + 1)
                *(int *)((char *)o + 8) = 0x00220100;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00220101;
            return;
        }
        return;
    case 2:
        if (func_0201b7e0(o) != 4) return;
        if (func_020139b4() != 2) return;
        *(int *)((char *)o + 8) = 0x00220200;
        func_0201abb0(5);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 5) return;
            *(int *)((char *)o + 8) = 0x00220300;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00220304;
                if (((struct Bit1 *)(w + 0x8e0))->b == 0)
                    --*(int *)(w + 0x924);
                func_0201b7b4();
                func_0201abd4(5);
                *(int *)(w + 0x900) &= ~0x1000000;
                return;
            }
            *(int *)((char *)o + 8) = 0x00220302;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00220303;
            if (((struct Bit1 *)(w + 0x8e0))->b == 0) {
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 5;
            }
            if (((struct Bit1 *)(w + 0x8e0))->b == 0)
                func_02019640(0);
            return;
        }
        break;
    case 4:
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)*(int *)(w + 0x8dc) + 2) return;
        *(int *)((char *)o + 8) = 0x00220400;
        func_0201b7b4();
        return;
    }
}
