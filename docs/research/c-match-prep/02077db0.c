/* CAMPAIGN-PREP candidate for func_02077db0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-bracket + guarded-scan + memcmp-guard + invariant hoist
 *   risk:       field offsets guessed; whether p+0x74/size 0x20 get hoisted into the extra callee regs may flip the frame
 *   confidence: med
 */
/* func_02077db0: IRQ-bracketed 4-slot scan looking for an active,
 * zero-keyed slot whose block matches p+0x74 (via func_020a7440==0);
 * on match copies p into slot+0x20 and flags p->_0x30.
 * p+0x74 and the size 0x20 are loop-invariant -> hoisted to callee
 * regs (r9/r8), which is why the frame pushes r9 + a 4-byte slot.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02094688(void *dst, const void *src, int n);          /* memcpy */
extern int  func_020a7440(const void *a, const void *b, int n);       /* memcmp */

typedef struct {
    unsigned char  block_a[0x20];   /* +0x00 */
    unsigned char  block_b[0x30];   /* +0x20 */
    unsigned int   packed;          /* +0x50 */
    unsigned int   key_w;           /* +0x54 */
    unsigned short key_h;           /* +0x58 */
    unsigned char  active;          /* +0x5a */
    unsigned char  _pad_5b[1];      /* +0x5b */
} slot_t;

typedef struct {
    unsigned char _pad_00[0x30];
    unsigned char ok;               /* +0x30 */
    unsigned char _pad_31[0x43];
    unsigned char blk[0x20];        /* +0x74 */
} req_t;

extern slot_t data_021a071c[4];

void func_02077db0(req_t *p) {
    slot_t *s = data_021a071c;
    int saved = OS_DisableIrq();
    int i;

    p->ok = 0;
    for (i = 0; i < 4; i++, s++) {
        if (s->active != 0 && s->key_w == 0 && s->key_h == 0 &&
            func_020a7440(s, p->blk, 0x20) == 0) {
            func_02094688(s->block_b, p, 0x30);
            p->ok = 1;
            break;
        }
    }
    OS_RestoreIrq(saved);
}
