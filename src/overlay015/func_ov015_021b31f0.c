/* func_ov015_021b31f0: load a 4-short rect into the object's +0x54 window, clear
 * the +0x60 cursor, and seed +0x64 with the scaled height span minus 1. (ov015) */
extern int func_020b3870(int, int);
void func_ov015_021b31f0(void *o, const short *src) {
    *(short *)((char *)o + 0x54) = src[0];
    *(short *)((char *)o + 0x56) = src[1];
    *(short *)((char *)o + 0x58) = src[2];
    *(short *)((char *)o + 0x5a) = src[3];
    *(int *)((char *)o + 0x60) = 0;
    *(int *)((char *)o + 0x64) =
        func_020b3870(*(short *)((char *)o + 0x5a) - *(short *)((char *)o + 0x56),
                      *(short *)((char *)o + 0x6c)) - 1;
}
