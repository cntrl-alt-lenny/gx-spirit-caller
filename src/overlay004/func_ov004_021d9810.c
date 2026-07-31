#include <nitro/types.h>

extern char data_ov004_0220b500[];
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern void func_02006110(int *out_a, int *out_b);
extern void func_02034888(int a, void *buf, int size);
extern void func_ov004_021c9d8c(int x);
extern int func_02037208(int a0, int a1, int a2, int a3);

typedef struct {
    u8 _pad[0x54];
    u16 flags;
} State02104bac_t;
extern State02104bac_t data_02104bac;

int func_ov004_021d9810(void) {
    char *base = data_ov004_0220b500;
    int result = 0;
    int fire = 0;

    if (*(int *)(base + 0x5c) != 0) return 0;
    if (*(int *)(base + 0x54) != 5) return 0;
    if (*(int *)(base + 0x224) != 0) return 0;

    if (func_02006194() != 0 || func_0200617c() != 0) {
        int a, b;
        func_02006110(&a, &b);
        if (a >= 0xe4 && a < 0xfe && b >= 2 && b < 0x1e) {
            result = 1;
            if (func_0200617c() != 0) fire = result;
        }
    } else if (data_02104bac.flags & 0x2) {
        if (*(int *)(base + 0x224) == 0) {
            result = 1;
            fire = result;
        }
    }

    if (fire != 0 && *(int *)(base + 0x64) == 0) {
        unsigned short buf[2];
        int one = 1;

        *(int *)(base + 0x64) = one;
        buf[0] = 4;
        buf[1] = (unsigned short)(0x10000 - one);
        func_02034888(3, buf, 4);
        func_ov004_021c9d8c(one);
        func_02037208(0x42, -1, 0, one);
    }

    return result;
}
