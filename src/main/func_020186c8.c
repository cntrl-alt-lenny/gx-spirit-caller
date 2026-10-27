extern char *GetSystemWork(void);
extern void func_02013aa0(int *dst);
extern void func_02013b4c(int *dst);
extern void func_02013c64(int *dst);
extern void func_02013e4c(int *o);
extern void func_0201406c(int *o);
extern void func_020142b4(int *o);
extern void func_02014478(int *o);
extern void func_02014630(int *o);
extern void func_02014814(int *o);
extern void func_02014920(int *o);
extern void func_02014b28(int *o);
extern void func_02014bf4(char *o);
extern void func_02014c3c(int *o);
extern void func_02014e6c(int *o);
extern void func_02015190(int *o);
extern void func_020152ec(int *o);
extern void func_02015494(int *o);
extern void func_02015638(int *o);
extern void func_020157d4(int *o);
extern void func_02015974(int *o);
extern void func_02015b10(int *o);
extern void func_02015e00(int *o);
extern void func_02015f7c(int *o);
extern void func_020161ac(void *o);
extern void func_020162d0(void *o);
extern void func_02016400(void *o);
extern void func_0201660c(void *o);
extern void func_020167c0(void *o);
extern void func_020169d0(void *o);
extern void func_02016b60(void *o);
extern void func_02016cd8(void *o);
extern void func_02017018(void *o);
extern void func_020172a0(void *o);
extern void func_0201762c(void *o);
extern void func_02017888(void *o);
extern void func_02017a98(int *dst);
extern void func_02017afc(void *o);
extern void func_02017be0(void *o);
extern void func_02017d18(int *o);
extern void func_02017df0(void *self);
extern void func_02017ea8(void *o);
extern void func_0201816c(int *dst);
extern void func_020181d0(int *o);
extern void func_02018358(void *o);
/* The existing assembly wrapper declares void; this caller passes its object in r0. */
extern void func_020186b0(int *o);
struct Flags { unsigned int low : 2; unsigned int again : 1; };
void func_020186c8(int *o) {
    char *sw = GetSystemWork();
    int saved = *(int *)(sw + 0x918);
    *(unsigned int *)(sw + 0x8e0) |= 4;
    *(int *)(sw + 0x918) = 10;
    while (((struct Flags *)(sw + 0x8e0))->again) {
        *(unsigned int *)(sw + 0x8e0) &= ~4;
        switch (*(unsigned int *)(sw + 0x91c)) {
        case 1: func_02013aa0(o); break;
        case 2: func_02013b4c(o); break;
        case 3: func_02013c64(o); break;
        case 4: func_02013e4c(o); break;
        case 5: func_0201406c(o); break;
        case 6: func_020142b4(o); break;
        case 7: func_02014478(o); break;
        case 8: func_02014630(o); break;
        case 9: func_02014814(o); break;
        case 10: func_02014920(o); break;
        case 11: func_02014b28(o); break;
        case 12: func_02014bf4((char *)o); break;
        case 13: func_02014c3c(o); break;
        case 14: func_02014e6c(o); break;
        case 15: func_02015190(o); break;
        case 16: func_020152ec(o); break;
        case 17: func_02015494(o); break;
        case 18: func_02015638(o); break;
        case 19: func_020157d4(o); break;
        case 20: func_02015974(o); break;
        case 21: func_02015b10(o); break;
        case 22: func_02015e00(o); break;
        case 23: func_02015f7c(o); break;
        case 24: func_020161ac(o); break;
        case 25: func_020162d0(o); break;
        case 26: func_02016400(o); break;
        case 27: func_0201660c(o); break;
        case 28: func_020167c0(o); break;
        case 29: func_020169d0(o); break;
        case 30: func_02016b60(o); break;
        case 31: func_02016cd8(o); break;
        case 32: func_02017018(o); break;
        case 33: func_020172a0(o); break;
        case 34: func_0201762c(o); break;
        case 35: func_02017888(o); break;
        case 36: func_02017a98(o); break;
        case 37: func_02017afc(o); break;
        case 38: func_02017be0(o); break;
        case 39: func_02017d18(o); break;
        case 40: func_02017df0(o); break;
        case 41: func_02017ea8(o); break;
        case 42: func_0201816c(o); break;
        case 43: func_020181d0(o); break;
        case 44: func_02018358(o); break;
        case 45: func_020186b0(o); break;
        }
    }
    if (*(int *)(sw + 0x918) == 0) {
        if (*(int *)(sw + 0x818) != 0) {
            *(unsigned int *)(sw + 0x900) |= 0x10000000;
        }
    }
    if (*(int *)(sw + 0x918) == 10) {
        *(int *)(sw + 0x918) = saved;
    }
}


