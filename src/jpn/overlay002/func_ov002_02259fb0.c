/* func_ov002_02259fb0: accept on either 021b3ecc or 021b4098 pending query. */
extern int func_ov002_021b3dec(int player, int kind, int code);
extern int func_ov002_021b3fb8(int player, int kind, int code);

int func_ov002_02259fb0(int player) {
    if (func_ov002_021b3dec(player, 0xB, 0x16A1) != 0)
        return 1;
    if (func_ov002_021b3fb8(player, 0xB, 0x1502) != 0)
        return 1;
    return 0;
}
