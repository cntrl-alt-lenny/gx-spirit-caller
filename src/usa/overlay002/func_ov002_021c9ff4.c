/* func_ov002_021c9ff4: gate check — arg0 is a player index, arg1 an
 * "in-progress" card/state ID. Bails to 0 as soon as any of the guard
 * checks fails; the final check's polarity flips (return 1 on success).
 * Several checks are skipped when arg1 already equals the literal ID
 * being tested (the leftover register from the comparison becomes the
 * 3rd call argument, so the "skip" path and the "call" path share one
 * literal-pool load).
 */

extern char data_ov002_022ce1a8[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_021bad9c(int arg0, int arg1, int arg2);
extern int func_ov002_021b3dec(int arg0, int arg1, int arg2);
extern int func_ov002_021baf88(int arg0);
extern int func_ov002_021b3fb8(int arg0, int arg1, int arg2);
extern int func_ov002_021b3ef8(int arg0, int arg1, int arg2, int arg3);

int func_ov002_021c9ff4(int arg0, int arg1) {
    if (*(int *)(data_ov002_022ce1a8 + 0x5c8) != 0) {
        return 0;
    }
    if ((*(unsigned int *)(data_ov002_022cf1a8 + (arg0 & 1) * 0x868) >> 22) & 1) {
        return 0;
    }

    if (arg1 != 0x13ff) {
        if (func_ov002_021bad9c(arg0, 0x13ff, -1) != 0) {
            return 0;
        }
    }
    if (arg1 != 0x12d2) {
        if (func_ov002_021b3dec(arg0, 0xb, 0x12d2) != 0) {
            return 0;
        }
    }
    if (arg1 != 0x12de) {
        if (func_ov002_021b3dec(arg0, 0xb, 0x12de) != 0) {
            return 0;
        }
    }
    if (arg1 != 0x1710) {
        if (func_ov002_021b3dec(arg0, 0xb, 0x1710) != 0) {
            return 0;
        }
    }
    if (arg1 != 0x1973) {
        if (func_ov002_021b3dec(arg0, 0xb, 0x1973) != 0) {
            return 0;
        }
    }

    if (func_ov002_021baf88(0x147f) != 0) {
        return 0;
    }
    if (func_ov002_021baf88(0x12b1) != 0) {
        return 0;
    }
    if (func_ov002_021baf88(0x1ae1) != 0) {
        return 0;
    }
    if (func_ov002_021bad9c(1 - arg0, 0x1ae8, -1) != 0) {
        return 0;
    }
    if (func_ov002_021b3fb8(arg0, 0xb, 0x15ad) != 0) {
        return 0;
    }
    if (func_ov002_021b3ef8(arg0, 0xb, 0x1679, 1) != 0) {
        return 0;
    }

    return func_ov002_021b3dec(arg0, 0xb, 0x1a29) == 0;
}
