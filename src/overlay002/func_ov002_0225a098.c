/* func_ov002_0225a098: accept on either 021b3ecc or 021b4098 pending query. */
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021b4098(int player, int kind, int code);

int func_ov002_0225a098(int player) {
    if (func_ov002_021b3ecc(player, 0xB, 0x16A1) != 0)
        return 1;
    if (func_ov002_021b4098(player, 0xB, 0x1502) != 0)
        return 1;
    return 0;
}
