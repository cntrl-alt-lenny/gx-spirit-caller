#include "ov008_core.h"

extern int func_020b3870(int a, int b);
extern void func_ov008_021ab484(int, int, int, int, int, int, int, int);

void func_ov008_021ac0b8(int a0, int a1, int a2) {
    int v = 0x2e;

    if (a2 != 0) {
        if (a0 != 0) {
            if (a0 == a1) {
                v = 0x6d;
            } else {
                int scaled = (a0 << 6) - a0;
                v = v + func_020b3870(scaled, a1);
                if (v < 0x2e) {
                    v = 0x2e;
                } else if (v > 0x6d) {
                    v = 0x6d;
                }
            }
        }

        func_ov008_021ab484(0xdc, v, 0, 0,
            (*(int *)(data_ov008_021b2780 + 0x634) & 0x100) ? 0x14 : 0x13,
            2, 0x400, 0);
    }

    func_ov008_021ab484(0xdc, 0x29, 0, 0, 0x16, 2, 0x400, 1);

    func_ov008_021ab484(0xdc, 0x19, 0, 0,
        (*(int *)(data_ov008_021b2780 + 0x634) & 0x40) ? 0xe : 0xd,
        2, 0x400, 1);

    func_ov008_021ab484(0xdc, 0x82, 0, 0,
        (*(int *)(data_ov008_021b2780 + 0x634) & 0x80) ? 0x10 : 0xf,
        2, 0x400, 1);
}
