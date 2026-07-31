/* func_020315e8: returns 1 iff arg0 is one of 8 specific constants
 * (0x10a8, 0x1013, 0x10b3, 0x1228, 0x1870, 0x1871, 0x1872, 0x179c),
 * else 0. Structure mirrors the original's exact decision tree.
 */
int func_020315e8(int arg0)
{
    if (arg0 > 0x10b3) {
        goto block_1014;
    }
    if (arg0 >= 0x10b3) {
        goto match;
    }
    if (arg0 > 0x1013) {
        goto block_1004;
    }
    if (arg0 != 0x1013) {
        goto nomatch;
    }
    goto match;

block_1004:
    if (arg0 != 0x10a8) {
        goto nomatch;
    }
    goto match;

block_1014:
    if (arg0 > 0x179c) {
        goto block_1034;
    }
    if (arg0 >= 0x179c) {
        goto match;
    }
    if (arg0 != 0x1228) {
        goto nomatch;
    }
    goto match;

block_1034:
    if (arg0 > 0x1872) {
        goto nomatch;
    }
    if (arg0 < 0x1870) {
        goto nomatch;
    }
    if (arg0 != 0x1870 && arg0 != 0x1871 && arg0 != 0x1872) {
        goto nomatch;
    }

match:
    return 1;

nomatch:
    return 0;
}
