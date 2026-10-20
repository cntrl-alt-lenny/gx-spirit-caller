extern char *GetSystemWork(void);
extern void func_0200a26c(int a0);
/* The original consumes r0 although the existing forwarder is typed void. */
extern int func_020139c4(void);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern int func_0201969c(void);
extern void func_0201abb0(int n);
extern void func_0201abd4(int n);
extern void func_0201b7b4(void);
struct Bits { unsigned int b0:1; unsigned int b1:1; };
void func_02015e00(int *o) {
    char *sw = GetSystemWork();
    int state;
    int x;
    if (((struct Bits *)(sw + 0x8d8))->b0 == 0) return;
    state = *(int *)(sw + 0x920);
    if (state != 1) {
        if (state == 2) o[2] = 0x00160200;
        return;
    }
    switch (*(int *)(sw + 0x924)) {
    case 0: break;
    case 1:
        *(int *)(sw + 0x924) = 4;
    case 4:
        if ((unsigned int)func_02019034() >= (unsigned int)(*(int *)(sw + 0x8dc) + 2)) {
            if (func_020139c4() >= 5) func_0201abb0(5);
            else func_0201abd4(5);
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) func_0200a26c(9);
        }
        if (func_02019664() != 0x65) return;
        if (func_0201969c() != 5) return;
        o[2] = 0x00160100;
        x = *(int *)(sw + 0x8e0);
        x = (x & ~1) | 1;
        *(int *)(sw + 0x8e0) = x;
        break;
    case 3:
        if (((struct Bits *)(sw + 0x8e0))->b0 != 0) return;
        if (func_020195ec() == 0) {
            o[2] = 0x00160104;
            if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
                *(int *)(sw + 0x924) = *(int *)(sw + 0x924) - 1;
            }
            func_0201b7b4();
            func_0201abd4(5);
        } else {
            o[2] = 0x00160102;
        }
        break;
    case 2:
        o[2] = 0x00160103;
        if (((struct Bits *)(sw + 0x8e0))->b1 == 0) {
            *(int *)(sw + 0x920) = 1;
            *(int *)(sw + 0x924) = 5;
        }
        break;
    }
}
