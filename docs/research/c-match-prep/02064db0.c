/* CAMPAIGN-PREP candidate for func_02064db0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     lazy-init guard + strlen+1 tail; mvn(-1) compare
 *   risk:       r4 holds out-ptr across call (callee-saved) — bind matches; arg order of p/out could swap
 *   confidence: high
 */
/* func_02064db0: lazy-init a cached string pointer at *p; on first call
 * set *p = data_02101554 and *out = 0 and return. Otherwise, only if
 * *out == -1, store strlen(*p)+1 into *out.
 *
 *   ldr r2,[r0]; if(r2==0){ *p=data_02101554; *out=0; return; }
 *   if(*out != -1) return;
 *   *out = strlen(r2) + 1;
 */

extern char data_02101554[];
extern int func_020aaddc(const char *s);   /* strlen */

void func_02064db0(char **p, int *out) {
    char *s = *p;

    if (s == 0) {
        *p = data_02101554;
        *out = 0;
        return;
    }
    if (*out != -1) return;
    *out = func_020aaddc(s) + 1;
}
