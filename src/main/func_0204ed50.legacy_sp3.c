typedef unsigned short u16;
typedef struct H { unsigned char pad[0xc]; u16 f; } H;
typedef struct { char _pad[0x15]; unsigned char b_15; } state_b15_t;
extern void *func_020498f0(void);
extern unsigned int func_020459f0(unsigned int);
extern void func_02049990(int, int, void *, void *);
extern int func_0204ead0(unsigned char, void *, int, int, const int *, int);
extern int func_0204ec90(void *);
extern int func_02062510(void *);
extern unsigned short func_02062528(void *);
extern u16 func_0206896c(H *);
extern int func_02068990(void *);
extern int func_02068998(state_b15_t *);
extern unsigned short func_020689b8(unsigned short *);
extern int func_020689dc(void *);
extern int func_02068ca0(void *);
extern unsigned int func_0206eb08(void);

int func_0204ed50(int mode, unsigned int value, void *item) {
    int index = *((unsigned char *)func_020498f0() + 0x14);
    int flag;
    int result = 0;
    if (mode == 0) {
        char *g = func_020498f0();
        value = (*(unsigned int *)(g + 0x200) & 0xffff) |
            (*(u16 *)((char *)func_020498f0() + 0x17e) << 16);
        if (func_02068998(item) != 0) {
            int id = func_020689dc(item);
            if (id != func_02068ca0(*(void **)((char *)func_020498f0() + 0xe4))) {
                flag = 1;
            } else {
                *(int *)((char *)func_020498f0() + index * 4 + 0x210) = func_02068990(item);
                *(u16 *)((char *)func_020498f0() + index * 2 + 0x290) = func_0206896c(item);
                flag = 0;
            }
        } else {
            unsigned int code = (u16)func_0206eb08();
            if ((code & 0xffff) == 0xa8c0 ||
                ((code & 0xff) == 0xac && (code & 0xff00) >= 0x1000 && (code & 0xff00) <= 0x1f00) ||
                (code & 0xff) == 0x10) {
                flag = 1;
            } else {
                *(int *)((char *)func_020498f0() + index * 4 + 0x210) = func_020689dc(item);
                *(u16 *)((char *)func_020498f0() + index * 2 + 0x290) = func_020689b8(item);
                flag = 0;
            }
        }
        if (flag != 0) {
            *(u16 *)((char *)func_020498f0() + 0x17e) = func_020459f0(0x10000);
            *(unsigned int *)((char *)func_020498f0() + 0x19c) = value;
        } else {
            int args[2];
            int r;
            args[0] = func_0206eb08();
            args[1] = func_02062528(**(void ***)((char *)func_020498f0() + 4));
            r = func_0204ead0(6, *(void **)((char *)func_020498f0() + index * 4 + 0xf4),
                func_020689dc(item), func_020689b8(item), args, 2);
            *((unsigned char *)func_020498f0() + 0x3cd) = 0;
            if (r != 0) return 2;
            *(int *)((char *)func_020498f0() + 0x19c) = 0;
        }
        *((unsigned char *)func_020498f0() + 0x194) = 0;
        *((unsigned char *)func_020498f0() + 0x195) = 0;
        *(u16 *)((char *)func_020498f0() + 0x196) = func_020689b8(item);
        *(int *)((char *)func_020498f0() + 0x198) = func_020689dc(item);
    } else {
        *((unsigned char *)func_020498f0() + 0x194) = 1;
        *((unsigned char *)func_020498f0() + 0x195) = 0;
        *(u16 *)((char *)func_020498f0() + 0x196) = 0;
        *(int *)((char *)func_020498f0() + 0x198) = 0;
        *(unsigned int *)((char *)func_020498f0() + 0x19c) = value;
        flag = 1;
    }
    if (flag != 0) {
        result = func_0204ec90((char *)func_020498f0() + 0x194);
    } else {
        int v = func_02062510(**(void ***)((char *)func_020498f0() + 4));
        func_02049990(0, v, 0, (char *)func_020498f0() + 0x194);
        {
            char *g = func_020498f0();
            *(int *)(g + 0x18c) = 0;
            *(int *)(g + 0x190) = 0;
        }
    }
    return result;
}


