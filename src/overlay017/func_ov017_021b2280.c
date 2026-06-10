/* SWAR popcount (no calls, no data refs — pure leaf).
 * Operand order matters: the HIGH-mask term comes first in each `+` so
 * mwcc pool-loads the high mask and derives the low one via `lsr` in the
 * AND's operand-2 (the orig materialisation direction). */
unsigned int func_ov017_021b2280(unsigned int x) {
    x = ((x & 0xaaaaaaaa) >> 1) + (x & 0x55555555);
    x = ((x & 0xcccccccc) >> 2) + (x & 0x33333333);
    x = ((x & 0xf0f0f0f0) >> 4) + (x & 0x0f0f0f0f);
    x = ((x & 0xff00ff00) >> 8) + (x & 0x00ff00ff);
    x = ((x & 0xffff0000) >> 16) + ((x << 16) >> 16);
    return x;
}
