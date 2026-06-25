/* CAMPAIGN-PREP candidate for func_0206ddc0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-load + OR-guard flag, call block, IRQ-bracket, bic/orr bit ops
 *   risk:       struct offsets (0x4,0x73,0x70,0x68,0x64) guessed; flag if-chain order may flip movne
 *   confidence: med
 */
/* func_0206ddc0: setup/teardown around a sub-struct.
 *   r4 = p->_0x4 (sub-struct ptr)
 *   d  = (s8)r4->_0x73
 *   flag = (d==0 || d==4)        ; mov r1,#1; cmp d,0; beq keep;
 *                                  cmp d,4; movne r1,#0
 *   if (flag) { func_02091af4(r4->_0x68 + 0x20);
 *               func_02070c40(); func_02070bac(); func_02070f24(); }
 *   func_02071010();
 *   r4->_0x70 &= ~0x6;                       ; ldrsh/bic/strh
 *   func_0206bef4( d==2 ? r4->_0x68 : r4->_0x64 );
 *   saved = OS_DisableIrq();
 *   func_0206e550(r4); func_0206e568(r4);
 *   OS_RestoreIrq(saved);
 *   r4->_0x70 |= 0x20;                       ; ldrsh/orr/strh
 *   return 0;
 */

typedef struct {
    char           _pad_00[0x64];
    void          *m64;     /* +0x64 */
    void          *m68;     /* +0x68 */
    short          m70;     /* +0x70 — ldrsh/strh */
    char           _pad_72[1];
    signed char    m73;     /* +0x73 */
} sub_t;

typedef struct {
    char   _pad_00[0x4];
    sub_t *m4;              /* +0x4 */
} obj_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0206bef4(void *p);
extern void func_0206e550(sub_t *s);
extern void func_0206e568(sub_t *s);
extern void func_02070bac(void);
extern void func_02070c40(void);
extern void func_02070f24(void);
extern void func_02071010(void);
extern void func_02091af4(int addr);

int func_0206ddc0(obj_t *p) {
    sub_t *s = p->m4;
    signed char d = s->m73;
    int flag = 1;
    int saved;

    if (d != 0) {
        if (d != 4) flag = 0;
    }

    if (flag) {
        func_02091af4((int)s->m68 + 0x20);
        func_02070c40();
        func_02070bac();
        func_02070f24();
    }

    func_02071010();
    s->m70 &= ~0x6;

    func_0206bef4((d == 2) ? s->m68 : s->m64);

    saved = OS_DisableIrq();
    func_0206e550(s);
    func_0206e568(s);
    OS_RestoreIrq(saved);

    s->m70 |= 0x20;
    return 0;
}
