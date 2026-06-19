/* func_ov002_02259eb0: 0x100-band readiness predicate — require the cf016c
 * global's +0xCF0 flag, that none of four 021b3ecc(player, 11, code) queries
 * fire, and that neither player is 021bae7c-pending-without-021bd364. */

extern char data_ov002_022d008c[];
extern int func_ov002_021b3dec(int player, int kind, int code);
extern int func_ov002_021bad9c(int player, int code, int arg);
extern int func_ov002_021bd284(int player, int code);

int func_ov002_02259eb0(int player) {
    if (*(int *)(data_ov002_022d008c + 0xCF0) == 0)
        return 0;
    if (func_ov002_021b3dec(player, 0xB, 0x13EB) != 0)
        return 0;
    if (func_ov002_021b3dec(player, 0xB, 0x1475) != 0)
        return 0;
    if (func_ov002_021b3dec(player, 0xB, 0x15F0) != 0)
        return 0;
    if (func_ov002_021b3dec(player, 0xB, 0x173F) != 0)
        return 0;
    if (func_ov002_021bad9c(0, 0x16D4, -1) != 0 && func_ov002_021bd284(0, 0x16) == 0)
        return 0;
    if (func_ov002_021bad9c(1, 0x16D4, -1) != 0 && func_ov002_021bd284(1, 0x16) == 0)
        return 0;
    return 1;
}
