/* func_ov002_021c9dac: bail if 021bb068(0x135D) fires, else report
 * 021b3ecc(player, 11, 0x1A1B) clear. */
extern int func_ov002_021bb068(int code);
extern int func_ov002_021b3ecc(int player, int kind, int code);

int func_ov002_021c9dac(int player) {
    if (func_ov002_021bb068(0x135D) != 0)
        return 0;
    return func_ov002_021b3ecc(player, 0xB, 0x1A1B) == 0;
}
