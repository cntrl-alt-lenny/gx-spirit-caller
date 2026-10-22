extern char *GetSystemWork(void);
extern void func_02018a38(unsigned int value);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_0201967c(int value);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b708(int arg);
extern void func_0201b7b4(void);
struct Bit0 { unsigned int b : 1; };
struct Bits { unsigned int a : 1; unsigned int b : 1; };
void func_02017018(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 4) return;
        func_0201abd4(4);
        func_0201abb0(2);
        *(int *)((char *)o + 8) = 0x00200100;
        return;
    case 2:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 2) return;
            *(int *)((char *)o + 8) = 0x00200200;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            *(int *)(w + 0x900) |= 0x1000000;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00200204;
                if (((struct Bits *)(w + 0x8e0))->b == 0)
                    --*(int *)(w + 0x924);
                func_0201b7b4();
                return;
            } else {
                *(int *)((char *)o + 8) = 0x00200202;
                return;
            }
        case 2:
            *(int *)((char *)o + 8) = 0x00200203;
            if (((struct Bits *)(w + 0x8e0))->b == 0) {
                *(int *)(w + 0x920) = 2;
                *(int *)(w + 0x924) = 5;
            }
            func_0201967c(0);
            return;
        }
        break;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x65) return;
            if (func_0201969c() != 2) return;
            *(int *)((char *)o + 8) = 0x00200300;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00200304;
                func_0201b708(0xb);
                func_0201abd4(2);
                if (((struct Bits *)(w + 0x8e0))->b == 0)
                    --*(int *)(w + 0x924);
                func_02018a38(0x14);
                return;
            } else {
                *(int *)((char *)o + 8) = 0x00200302;
                return;
            }
        case 2:
            *(int *)((char *)o + 8) = 0x00200303;
            if (((struct Bits *)(w + 0x8e0))->b != 0) return;
            *(int *)(w + 0x920) = 3;
            *(int *)(w + 0x924) = 5;
            return;
        }
        return;
    }
}

