/* CAMPAIGN-PREP candidate for func_020604b0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two NULL asserts + memcpy + strb NUL terminator
 *   risk:       assert helper func_020a6d54 4-arg shape and the data_ message/file order guessed; movs-guard may reorder
 *   confidence: med
 */
/* func_020604b0: copy n bytes src->dst then NUL the last byte (string copy
 * with forced terminator). Two leading NULL-assert guards on dst and src use
 * the SDK panic helper func_020a6d54(msg, file, 0, line).
 *
 *   movs r6,r0(dst); r5=r1(src); r4=r2(n)
 *   if (dst==0) func_020a6d54(data_02101338, data_02101244, 0, 0x2f);
 *   if (src==0) func_020a6d54(data_02101348, data_02101244, 0, 0x30);
 *   func_020aaec0(dst, src, n);            ; memcpy(dst, src, n)
 *   *(dst + n - 1) = 0;
 */
extern const char data_02101244[];   /* __FILE__ */
extern const char data_02101338[];   /* "dst" assert text */
extern const char data_02101348[];   /* "src" assert text */

extern void func_020a6d54(const char *msg, const char *file, int x, int line);
extern void func_020aaec0(void *dst, const void *src, int n);  /* memcpy */

void func_020604b0(char *dst, const char *src, int n) {
    if (dst == 0) func_020a6d54(data_02101338, data_02101244, 0, 0x2f);
    if (src == 0) func_020a6d54(data_02101348, data_02101244, 0, 0x30);
    func_020aaec0(dst, src, n);
    dst[n - 1] = 0;
}
