/* CAMPAIGN-PREP candidate for func_02006b10 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Stack-struct init + call + movs-guard (saved-result return)
 *   risk:       0x48 buffer treated as opaque; if it is a typed struct, frame size matches but field-driven scheduling unaffected here.
 *   confidence: high
 */
/* func_02006b10: init a 0x48 stack record, run it against arg, return the
 * result and (if nonzero) finalize.
 *   func_02098388(&buf)
 *   r = func_02098038(&buf, arg)
 *   if (r) func_02097ff0(&buf)
 *   return r
 */

extern void func_02098388(void *p);
extern int  func_02098038(void *p, void *arg);
extern void func_02097ff0(void *p);

int func_02006b10(void *arg) {
    char buf[0x48];
    int r;
    func_02098388(buf);
    r = func_02098038(buf, arg);
    if (r != 0) {
        func_02097ff0(buf);
    }
    return r;
}
