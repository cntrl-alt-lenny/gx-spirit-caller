/* CAMPAIGN-PREP candidate for func_021aeb00 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Bounded line-copy loop; signed-char loads; do-while with post-inc src
 *   risk:       Loop rotation / overflow-branch ordering may differ; the entry *src!=0 guard vs do-while interplay could reshape blocks.
 *   confidence: med
 */
/* func_ov002_021aeb00: bounded copy of a line from *psrc into dst, stopping
 * after a '\n' or at '\0'. Returns chars written, or 0 on overflow (>= max-1).
 * Advances *psrc past the consumed bytes; NUL-terminates dst. Signed chars.
 *
 *     ldr ip,[r2]; ldrsb r3,[ip]; cmp r3,#0; beq end
 *     sub r3,r1,#1                ; limit = max-1
 *   loop:
 *     ldrsb r1,[ip],#1; strb r1,[r0,lr]; add lr,lr,#1
 *     cmp lr,r3; movge r0,#0; ldmgeia ...   ; overflow -> return 0
 *     ldrsb r1,[ip,#-1]; cmp r1,#0xa; ldrnesb r1,[ip]; cmpne r1,#0; bne loop
 *   end:
 *     strb #0,[r0,lr]; mov r0,lr; str ip,[r2]
 */

int func_ov002_021aeb00(char *dst, int max, char **psrc) {
    signed char *src = (signed char *)*psrc;
    int i = 0;
    if (*src != 0) {
        int limit = max - 1;
        do {
            signed char c = *src++;
            dst[i] = c;
            i++;
            if (i >= limit) return 0;
        } while (src[-1] != '\n' && *src != 0);
    }
    dst[i] = 0;
    *psrc = (char *)src;
    return i;
}
