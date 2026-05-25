/* func_02034a68: tail-call func_0203309c(&data_02105b70, 0x4159584a).
 *
 *     ldr ip, .L_02034a78    ; func_0203309c
 *     ldr r0, .L_02034a7c    ; data_02105b70
 *     ldr r1, .L_02034a80    ; 0x4159584a — 'JXYA' (game code, little-endian)
 *     bx  ip
 *
 * 0x4159584a is "AYXJ" / "JXYA" as packed ASCII — the JPN game code per
 * CLAUDE.md. (Decompiled in the EUR region; the constant flagging is
 * still 'AYXJ' here, suggesting a region-detection helper.)
 */

extern int func_0203309c(void *p, int gamecode);

extern char data_02105b70[];

int func_02034a68(void) {
    return func_0203309c(data_02105b70, 0x4159584a);
}
