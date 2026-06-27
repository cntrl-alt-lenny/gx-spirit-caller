/* CAMPAIGN-PREP candidate for func_02090a60 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early if-return -2; u16 field forces ldrh+cmp; dual useThread branch; blx via fn-ptr arg
 *   risk:       reshape-able: orig PREDICATES the mismatch return (addne/mvnne/ldmneia/bxne); if mwcc branches instead it diverges (try moving the return or a flag). Obj offsets (_0@0, id@4) are struct-guessed.
 *   confidence: med
 */
/* func_02090a60 (main, cls C): keyed guard + locked callback.
 * If key != p->id(u16@+4) return -2 (~1). Else take a lock (thread path
 * func_020937d0 when useThread, else OS_DisableIrq), clear p->id, fire the
 * optional callback, clear p->_0, release the matching lock, return 0.
 * The sub sp,#4 frame is mwcc's automatic 8-byte stack alignment. */
typedef unsigned short u16;
extern int  func_020937d0(void);
extern void func_020937e4(int saved);
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

typedef struct {
    int _0;   /* +0x0 */
    u16 id;   /* +0x4 */
} Obj;

int func_02090a60(int key, Obj *p, void (*cb)(void), int useThread)
{
    int saved;
    if (key != p->id) return -2;
    if (useThread) saved = func_020937d0();
    else           saved = OS_DisableIrq();
    p->id = 0;
    if (cb) cb();
    p->_0 = 0;
    if (useThread) func_020937e4(saved);
    else           OS_RestoreIrq(saved);
    return 0;
}
