/* CAMPAIGN-PREP candidate for func_021cbdf4 (ov003, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard call, stack-rec builder, fixed call chain, mode==2 tail
 *   risk:       stack-rec layout (word@0,half@4,len6) + orr#0x800 order + func_02034784 reload; scheduling of the two stores may reorder
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov003_021cbdf4 (ov003, class A).
 *   recipe:  guard call -> build 6-byte stack rec {word=0x40f02000, half=(x<<1)|0x800},
 *            emit via func_02005dac/func_020944a4; then fixed call chain; mode==2 tail
 *   risk:    func_02034784 RELOADED (called twice); stack rec layout (word@+0,
 *            half@+4, len 6) and orr#0x800 flag order; the two func_ov003_021cd420
 *            calls must stay unrolled; return 1
 *   confidence: med
 */

extern int  func_02034784(void);
extern int  func_02034810(void);
extern int  func_02005dac(int a, int b);
extern void func_020944a4(void *rec, int handle, int len);
extern void func_ov003_021cd420(void *ctx, int which);
extern void func_ov003_021cd7dc(void *ctx);
extern void func_ov003_021ce4e4(void *ctx);
extern void func_ov003_021cec24(void *ctx);

typedef struct {
    int            word0;   /* +0x0 */
    unsigned short half4;   /* +0x4 */
} Rec021cbdf4;

int func_ov003_021cbdf4(void *ctx)
{
    Rec021cbdf4 rec;
    if (func_02034784() != 0) {
        rec.word0 = 0x40f02000;
        rec.half4 = (unsigned short)((func_02034810() << 1) | 0x800);
        func_020944a4(&rec, func_02005dac(1, 0), 6);
    }
    func_ov003_021cd420(ctx, 0);
    func_ov003_021cd420(ctx, 1);
    func_ov003_021cd7dc(ctx);
    func_ov003_021ce4e4(ctx);
    if (func_02034784() == 2)
        func_ov003_021cec24(ctx);
    return 1;
}
