/* CAMPAIGN-PREP candidate for func_02006af4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Stack-struct init + call + movs-guard (saved-result return)
 *   risk:       0x48 buffer treated as opaque; if it is a typed struct, frame size matches but field-driven scheduling unaffected here.
 *   confidence: high
 */
/* func_02006af4: init a 0x48 stack record, run it against arg, return the
 * result and (if nonzero) finalize.
 *   func_02098294(&buf)
 *   r = func_02097f44(&buf, arg)
 *   if (r) func_02097efc(&buf)
 *   return r
 */

extern void func_02098294(void *p);
extern int  func_02097f44(void *p, void *arg);
extern void func_02097efc(void *p);

int func_02006af4(void *arg) {
    char buf[0x48];
    int r;
    func_02098294(buf);
    r = func_02097f44(buf, arg);
    if (r != 0) {
        func_02097efc(buf);
    }
    return r;
}
