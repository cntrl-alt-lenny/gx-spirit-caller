/* func_ov002_022717f8: gate on arg1+arg2<=4, forward to
 * func_ov002_021bc8c8, then either a per-player slot check (0x868
 * stride) or a byte-packed table scan over data_ov002_022cd300's
 * u16 array at +0x10, gated by its +8 count byte. */
#include "ov002_core.h"

struct Cd300 {
    unsigned int b0 : 1;
    unsigned int _rest : 31;
    char pad0[4];
    unsigned char count;
    char pad1[7];
    unsigned short arr[1];
};

extern struct Cd300 data_ov002_022cd300;
extern int func_ov002_021bc8c8(int bit0, int player, int sum);
extern int func_ov002_021b9ecc(int player, int sum);
extern int func_0202ed90(void);

int func_ov002_022717f8(int player, int arg1, int arg2) {
    int sum = arg1 + arg2;

    if (sum > 4)
        return 0;

    if (func_ov002_021bc8c8(data_ov002_022cd300.b0, player, sum) == 0)
        return 0;

    if (data_ov002_022cd300.count == 0) {
        if (player != data_ov002_022cd300.b0) {
            char *row = data_ov002_022cf1a4 + (player & 1) * 0x868;
            if (*(unsigned short *)(row + sum * 20) == 0)
                return 0;
        }

        func_ov002_021b9ecc(player, sum);
        if (func_0202ed90() == 0)
            return 0;
    } else {
        unsigned short packed;
        int j;

        for (j = 0; j < data_ov002_022cd300.count; j++) {
            packed = (unsigned char)player | ((unsigned char)sum << 8);
            if (packed == data_ov002_022cd300.arr[j])
                return 0;
        }
    }

    return 0x800;
}
