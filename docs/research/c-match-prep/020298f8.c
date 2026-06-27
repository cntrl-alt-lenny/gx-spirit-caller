/* CAMPAIGN-PREP candidate for func_020298f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two counted loops over +0x98 array; guarded invokes; base recomputed post-bl
 *   risk:       reshape-able: orig recomputes add r0,r4,r7<<2 AFTER each bl (no CSE of slot ptr across call); if mwcc CSEs the slot address the str diverges — keep the post-call re-index as written.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020298f8 (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     two counted teardown loops over r5+0x98 array (stride 4); guarded invokes; index in r7, zero in r6 reused
 *   risk:       loop index/base reg-alloc; orig recomputes add r4,r7<<2 AFTER the call (no CSE across bl)
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;

extern void Task_InvokeLocked(void *task);
extern void func_02006e1c(void *p);
extern void func_02022580(void *p);

typedef struct Obj298f8 {
    char  _pad0[0x98];
    /* array base 0x98; element accessed at +0x8 (=>0xa0) and +0x68 (=>0x100) */
    void *arr[1];
    char  _pad1[0x100 - (0x98 + 4)];
    char  blk100[0x9c];   /* 0x100 sub-struct: +0x84 s16, +0x9a u16 */
    char  _pad2[0x188 - (0x100 + 0x9c)];
    void *f188;           /* 0x188 task ptr */
} Obj298f8;

int func_020298f8(Obj298f8 *p) {
    char *base = (char *)p + 0x98;
    int i;
    char *s87 = (char *)p + 0x87;

    for (i = 0; i < 0x18; i++) {
        void **slot = (void **)(base + i * 4);
        if (slot[0x8 / 4] != 0) {       /* ldr [r0,#0x8] */
            Task_InvokeLocked(slot[0x8 / 4]);
            ((void **)(base + i * 4))[0x8 / 4] = 0;   /* recompute base after bl */
        }
    }
    for (i = 0; i < 0x2; i++) {
        void **slot = (void **)(base + i * 4);
        if (slot[0x68 / 4] != 0) {      /* ldr [r0,#0x68] */
            func_02006e1c(slot[0x68 / 4]);
            ((void **)(base + i * 4))[0x68 / 4] = 0;
        }
    }
    if (*(s16 *)(p->blk100 + 0x84) >= 0) {
        func_02022580(*(s16 *)(p->blk100 + 0x84));   /* arg = the s16 (r0 preloaded) */
        *(s16 *)(p->blk100 + 0x84) = -1;
        s87[0x100] &= ~0x1;            /* ldrb [r4,#0x100] with r4=p+0x87 */
    }
    if (p->f188 != 0) {
        Task_InvokeLocked(p->f188);
        p->f188 = 0;
    }
    *(u16 *)(p->blk100 + 0x9a) &= ~0x1;
    return 1;
}
