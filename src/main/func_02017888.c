extern char *GetSystemWork(void);
/* These forwarders preserve r0, which this caller reads as a result. */
extern int func_020139c4(void);
extern int func_020190ec(void);
extern unsigned short func_02019034(void);
/* Original calls supply no arguments to this forwarding thunk. */
extern int func_020190c0();
extern unsigned int func_020195ec(void);
extern void func_02019640(unsigned int value);
extern int func_02019664(void);
extern void func_0201aabc(int id);
extern void func_0201aaf4(int unused0);
extern void func_0201ab5c(unsigned int value);
extern void func_0201b7b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned func_ov000_021ae4ac(void);
struct Bit0 { unsigned int b : 1; };
void func_02017888(void *o) {
    char *w = GetSystemWork();
    if (((struct Bit0 *)(w + 0x8d8))->b == 0) return;
    switch (*(int *)(w + 0x920)) {
    case 1:
        if (func_020190c0() == 1 || func_020190c0() == 2 || func_020190c0() == 3) {
            if (func_020139c4() != 5) return;
            if ((unsigned int)func_02019034() >= (unsigned int)*(int *)(w + 0x8dc) + 1)
                *(int *)((char *)o + 8) = 0x00230100;
        }
        return;
    case 2:
        if (func_0201b7e0(o) != 4) return;
        *(int *)((char *)o + 8) = 0x00230200;
        func_0201b7b4();
        return;
    case 3:
        switch (*(int *)(w + 0x924)) {
        case 1:
            *(int *)(w + 0x924) = 5;
        case 5:
            if (func_020190ec() == 0) return;
            if ((unsigned int)func_02019034() < (unsigned int)*(int *)(w + 0x8dc) + 1) return;
            if (func_020139c4() != 5) return;
            *(int *)((char *)o + 8) = 0x00230300;
            *(int *)(w + 0x900) |= 0x1000000;
            func_0201aabc(0x7b);
            return;
        case 4:
            if (func_0201b7e0(o) != 3) return;
            if (func_02019664() != 0x7b) return;
            *(int *)((char *)o + 8) = 0x00230301;
            *(int *)(w + 0x8e0) = (*(int *)(w + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (func_ov000_021ae4ac() == 2) {
                *(int *)(w + 0x91c) = 0x23;
                *(int *)(w + 0x920) = 3;
                *(int *)(w + 0x924) = 4;
                *(int *)(w + 0x8e0) |= 4;
                func_02019640(0);
                return;
            }
            if (((struct Bit0 *)(w + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                *(int *)((char *)o + 8) = 0x00230302;
                return;
            }
            *(int *)((char *)o + 8) = 0x00230303;
            return;
        case 2:
            *(int *)((char *)o + 8) = 0x00230304;
            func_0201b7b4();
            func_0201aaf4(0x7b);
            func_0201ab5c(2);
            *(int *)(w + 0x900) &= ~0x1000000;
            return;
        }
    }
}


