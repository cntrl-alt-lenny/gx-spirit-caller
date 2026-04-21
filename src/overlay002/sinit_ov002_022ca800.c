/* __sinit_ov002_022ca800: empty per-TU sinit (0x4 bytes — `bx lr`).
 *
 * CodeWarrior emits a sinit stub for every TU that's compiled with C++
 * (or any language that might produce static initializers), even if
 * the TU has no actual global constructors. When there's nothing to
 * initialize, the body collapses to a lone `bx lr`. Paired with a
 * `.p__sinit_*` pointer in `.ctor` so the runtime's init loop still
 * walks it.
 */

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov002_022ca800(void) {
}

#pragma section INIT end
