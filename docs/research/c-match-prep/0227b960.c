/* CAMPAIGN-PREP candidate for func_0227b960 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return (!=-1) + arg-marshal calls + cond-move (==-1 -> d)
 *   risk:       call-result eval order (f1 before f2) and t1/t2 reg pinning (r4) must hold; c arg is unused
 *   confidence: med
 */
/* func_ov002_0227b960: if probe(a)!=-1 return early; else translate b via two
 * calls, query, and on -1 return d (else fall through to query's result).
 *
 *   r7=a r6=b r5=d; bl 0227b9b8; cmp r0,~0; popne          ; if(!=-1) return r0
 *   mov r0,r6; bl 0202b8f0; mov r4,r0                       ; t1=f1(b)
 *   mov r0,r6; bl 0202b920; mov r2,r0                       ; t2=f2(b)
 *   mov r0,r7; mov r1,r4; bl 0227b174                       ; r=f3(a,t1,t2)
 *   cmp r0,~0; moveq r0,r5; pop                             ; if(r==-1) r=d
 */
extern int func_ov002_0227b9b8(int a);
extern int func_0202b8f0(int b);
extern int func_0202b920(int b);
extern int func_ov002_0227b174(int a, int t1, int t2);

int func_ov002_0227b960(int a, int b, int c, int d) {
    int r;
    r = func_ov002_0227b9b8(a);
    if (r != -1)
        return r;
    r = func_ov002_0227b174(a, func_0202b8f0(b), func_0202b920(b));
    if (r == -1)
        r = d;
    return r;
}
