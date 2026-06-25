/* CAMPAIGN-PREP candidate for func_02055298 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed-char guarded table-remap loop, pre-increment, return arg
 *   risk:       c<0x80 on signed char is always true; compiler may drop the bge guard — confirm both cmp #0 and cmp #0x80 survive
 *   confidence: med
 */
/* func_02055298: in-place signed-char string remap through a 128-entry table.
 *   for each c=*s (signed) until 0: if (c>=0 && c<0x80) c = table[c]; *s = c; advance.
 * Pre-increment walk (ldrsb [r0,#1]!). Returns original pointer.
 */

extern unsigned char data_020c3654[];

char *func_02055298(char *s) {
    char *p = s;
    signed char c = (signed char)*p;
    if (c != 0) {
        do {
            if (c >= 0 && c < (signed char)0x80)
                c = (signed char)data_020c3654[c];
            *p = c;
            c = (signed char)*++p;
        } while (c != 0);
    }
    return s;
}
