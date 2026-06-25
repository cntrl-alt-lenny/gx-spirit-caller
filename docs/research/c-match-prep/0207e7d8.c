/* CAMPAIGN-PREP candidate for func_0207e7d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SCAN loop: BIND count once, reload elem stride, u16 i, ptr return
 *   risk:       needs legacy_sp3 compiler routing for stmfd{lr}+sub sp,#4 frame; binding/i-truncation may differ on mwcc 2.0
 *   confidence: med
 */
/* func_0207e7d8: linear scan over an offset-linked element list.
 *
 *   stmfd sp!, {lr}
 *   sub   sp, sp, #0x4
 *   ldrh  r2, [r0, #0xc]   ; off   = p->off  (once)
 *   ldrh  ip, [r0, #0xe]   ; n     = p->count (BOUND in ip, not reloaded)
 *   mov   lr, #0x0         ; i = 0
 *   add   r0, r0, r2       ; e = (char*)p + off
 *   cmp   ip, #0x0
 *   bls   .L_dc            ; n==0 -> return 0
 * .L_b0:
 *   ldr   r2, [r0]                ; e->key
 *   cmp   r2, r1
 *   ...eq -> return e
 *   ldr   r3, [r0, #0x4]          ; stride = e->stride (reloaded from elem)
 *   ... i = (u16)(i+1); add r0,r0,r3 ; e += stride; cmp i,n; bcc .L_b0
 * .L_dc: mov r0,#0 ; return 0
 *
 * Count is bound to a local (held in a reg); element pointer advances
 * by each element's own stride.  stmfd{lr}+sub sp,#4 => legacy_sp3
 * routing (file should be *.legacy_sp3.c).
 */

typedef struct {
    int key;     /* +0x0 */
    int stride;  /* +0x4 byte advance to next element */
} Elem0207e7d8;

typedef struct {
    char           _pad00[0xc];
    unsigned short off;    /* +0xc first-element byte offset */
    unsigned short count;  /* +0xe element count */
} Cont0207e7d8;

void *func_0207e7d8(Cont0207e7d8 *p, int key) {
    char *e = (char *)p + p->off;
    unsigned short i, n;
    n = p->count;
    for (i = 0; i < n; i++) {
        if (((Elem0207e7d8 *)e)->key == key) return e;
        e += ((Elem0207e7d8 *)e)->stride;
    }
    return 0;
}
