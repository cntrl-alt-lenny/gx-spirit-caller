/* func_02034a18: tail-call func_02033048(&data_02105a90, 0x4159584a).
 *
 *     ldr ip, .L_02034a78    ; func_02033048
 *     ldr r0, .L_02034a7c    ; data_02105a90
 *     ldr r1, .L_02034a80    ; 0x4159584a — 'JXYA' (game code, little-endian)
 *     bx  ip
 *
 * 0x4159584a is "AYXJ" / "JXYA" as packed ASCII — the JPN game code per
 * CLAUDE.md. (Decompiled in the EUR region; the constant flagging is
 * still 'AYXJ' here, suggesting a region-detection helper.)
 */

extern int func_02033048(void *p, int gamecode);

extern char data_02105a90[];

int func_02034a18(void) {
    return func_02033048(data_02105a90, 0x4159584a);
}
