/* CAMPAIGN-PREP candidate for func_020b18f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed-char guarded table-remap dual-pointer compare loop
 *   risk:       compiler may drop the redundant cmp#0x80/bge guard on the unsigned-loaded byte, or reorder the two -1/+1 conditional exits; confirm both guards + mvncc/movhi survive
 *   confidence: med
 */
/* func_020b18f0 (main, A) — case-insensitive string compare via 128-entry xlat
 * table data_020c3654 (same table as func_02055298). For each pair of bytes:
 * load unsigned (ldrb post-inc), if signed value in [0,0x80) remap through table,
 * zero-extend both remapped bytes to 0xff and compare unsigned: <0 -> return -1,
 * >0 -> return 1; if equal and the byte is non-zero keep looping; else return 0.
 * The cmp#0/blt + cmp#0x80/bge guard pair is the signed-char ctype guard. */
extern unsigned char data_020c3654[];

int func_020b18f0(const char *a, const char *b)
{
    for (;;) {
        int ca = (unsigned char)*a++;
        int cb;
        if ((signed char)ca >= 0 && ca < 0x80)
            ca = data_020c3654[ca];
        ca &= 0xff;
        cb = (unsigned char)*b++;
        if ((signed char)cb >= 0 && cb < 0x80)
            cb = data_020c3654[cb];
        cb &= 0xff;
        if (ca < cb)
            return -1;
        if (ca > cb)
            return 1;
        if (ca == 0)
            return 0;
    }
}
