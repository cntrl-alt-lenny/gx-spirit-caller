/* CAMPAIGN-PREP candidate for func_0208a6b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ bracket + list-walk loop (do-while shape) + guarded unlink
 *   risk:       Loop is entered via beq then bottom-tested bne — mwcc may emit do/while vs while; node treated as int, [+0x8] deref ptr-cast. Reg r4/r5 alloc on node/next may flip.
 *   confidence: med
 */
/* func_0208a6b8: IRQ-bracketed singly-linked list walk; removes nodes
 * whose [+0x8] field equals p1.
 *
 *   r8=p0(list/ctx), r7=p1(key)
 *   saved = OS_DisableIrq()
 *   node = func_0207cfdc(p0, 0)             ; first
 *   while (node != 0) {
 *       next = func_0207cfdc(p0, node)      ; advance
 *       if (node[0x8] == p1) {
 *           func_0207cff4(p0, node)         ; unlink
 *           func_0208a684(node)             ; free/dispose
 *       }
 *       node = next
 *   }
 *   OS_RestoreIrq(saved)
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_0207cfdc(int ctx, int node);
extern void func_0207cff4(int ctx, int node);
extern void func_0208a684(int node);

void func_0208a6b8(int ctx, int key) {
    int saved;
    int node;
    int next;

    saved = OS_DisableIrq();
    node = func_0207cfdc(ctx, 0);
    while (node != 0) {
        next = func_0207cfdc(ctx, node);
        if (*(int *)(node + 0x8) == key) {
            func_0207cff4(ctx, node);
            func_0208a684(node);
        }
        node = next;
    }
    OS_RestoreIrq(saved);
}
