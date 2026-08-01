#include <nitro/types.h>

extern char data_ov004_0220b2a0[];
extern unsigned int func_02006178(void);
extern unsigned int func_02006160(void);
extern void func_020060f4(int *out_a, int *out_b);
extern void func_02034838(int a, void *buf, int size);
extern void func_ov004_021c9cac(int x);
extern int func_020371b8(int a0, int a1, int a2, int a3);

typedef struct {
    u8 _pad[0x54];
    u16 flags;
} State02104bac_t;
extern State02104bac_t data_02104acc;

int func_ov004_021d95fc(void) {
    char *base = data_ov004_0220b2a0;
    int result = 0;
    int fire = 0;

    if (*(int *)(base + 0x5c) != 0) return 0;
    if (*(int *)(base + 0x54) != 5) return 0;
    if (*(int *)(base + 0x224) != 0) return 0;

    if (func_02006178() != 0 || func_02006160() != 0) {
        int a, b;
        func_020060f4(&a, &b);
        if (a >= 0xe4 && a < 0xfe && b >= 2 && b < 0x1e) {
            result = 1;
            if (func_02006160() != 0) fire = result;
        }
    } else if (data_02104acc.flags & 0x2) {
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
        func_02034838(3, buf, 4);
        func_ov004_021c9cac(one);
        func_020371b8(0x42, -1, 0, one);
    }

    return result;
}
