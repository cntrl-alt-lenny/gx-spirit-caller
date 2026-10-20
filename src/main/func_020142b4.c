extern char *GetSystemWork(void);
/* The void forwarder preserves the result of its final call in r0. */
extern int func_020139b4(void);
extern unsigned int func_0201b7e0(void *obj);
extern unsigned short func_02019034(void);
extern unsigned int func_020195ec(void);
extern int func_02019664(void);
extern void func_02019640(unsigned int value);
extern void func_0201b7b4(void);
extern void func_0200a26c(int a0);
struct Bit0 { unsigned int b:1; };
struct Bit1 { unsigned int pad:1; unsigned int b:1; };
void func_020142b4(int *o) {
    char *sw = GetSystemWork();
    if (((struct Bit0 *)(sw + 0x8d8))->b == 0) return;
    switch (*(int *)(sw + 0x920)) {
    case 1:
        if (func_020139b4() != 2) return;
        if (func_0201b7e0(o) != 4) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(sw + 0x8dc) + 1)) return;
        *(unsigned int *)(sw + 0x900) |= 0x1000000;
        o[2] = 0x60100;
        if (((struct Bit1 *)(sw + 0x8e0))->b != 0) return;
        func_0200a26c(11);
        return;
    case 2:
        switch (*(int *)(sw + 0x924)) {
        case 0: break;
        case 1:
            *(int *)(sw + 0x924) = 4;
        case 4:
            if (func_02019664() != 0x6b) return;
            o[2] = 0x60200;
            *(unsigned int *)(sw + 0x8e0) = (*(unsigned int *)(sw + 0x8e0) & ~1) | 1;
            return;
        case 3:
            if (((struct Bit0 *)(sw + 0x8e0))->b != 0) return;
            if (func_020195ec() == 0) {
                o[2] = 0x60204;
                if (((struct Bit1 *)(sw + 0x8e0))->b == 0) --*(int *)(sw + 0x924);
                func_0201b7b4();
                *(unsigned int *)(sw + 0x900) &= ~0x1000000;
            } else {
                o[2] = 0x60202;
            }
            return;
        case 2:
            o[2] = 0x60203;
            if (((struct Bit1 *)(sw + 0x8e0))->b == 0) {
                *(int *)(sw + 0x920) = 2;
                *(int *)(sw + 0x924) = 5;
            }
            if (((struct Bit1 *)(sw + 0x8e0))->b != 0) return;
            func_02019640(0);
            return;
        }
        break;
    case 3:
        if (func_0201b7e0(o) == 4) o[2] = 0x60205;
        return;
    }
}

