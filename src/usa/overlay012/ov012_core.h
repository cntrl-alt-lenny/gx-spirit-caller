/* ov012_core.h — shared notes for the overlay-012 clean-C co-drain.
 *
 * ov012 is a map/board overlay (tile lookups, panel transitions, a task spawner).
 * Partially pre-existing (data_ov012_*, two .s funcs, ov012_021ca340) — this is
 * the first reshape-driven wave over the small-function tail.
 *
 * Key globals:
 *   data_ov012_021cc5fc — the main controller block. Referenced MANY times
 *     across calls, so the orig binds it ONCE into a callee-saved reg → bind
 *     `char *d = data_ov012_021cc5fc;` at the top of such funcs. Fields: [0x15c]
 *     mode, [0x160] saved-slot (low nibble), [0x17c] map ptr, [0x180] task,
 *     [0x174..] per-corner offsets.
 *   data_ov012_021cc5c0 — mode/config block ([0x198] map mode, [0x1bc] task-armed,
 *     [0xe8..0xf0]/[0xbc] cell handles). The orig RELOADS it per reference
 *     (`ldr` each time) — do NOT bind it.
 *   data_021040ac — shared global ([0x3c]/[0x40] pending transition, [0xb6c]
 *     step cursor). Also reloaded per reference.
 *
 * NOTE: like ov009, ov012 has NO real clone families — the one size-histogram
 * pair (0x98: 021caea8 builder vs 021cbeb4 init) was coincidental. Read seeds
 * before trusting a "clone". And take delink sizes from symbols.txt
 * (`size=0x…`), NOT a disasm line-count (it under/over-counts pool words).
 */
#ifndef OV012_CORE_H
#define OV012_CORE_H

extern char data_ov012_021cc5fc[];
extern char data_ov012_021cc5c0[];

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 345). 6 .c, all EUR objdiff 100% +   *
 *  ninja rom OK. Recipe library → 6th overlay; 6 of 9 attempts matched.    *
 * ====================================================================== */
/* Picks (by recipe):
 *  - 021cbeb4 graphics-up INIT — a clean call sequence; the orig RELOADS
 *    data_cc6a0 for each func_0201ef3c, so reference it directly (no base-bind).
 *  - 021ca2a0 task SPAWNER — struct-copy `struct{int w[6];} s = *(...)data_cc0d8`
 *    (ldmia/stmia) + bind data_cc6dc + a switch whose DEFAULT leaves `sel`
 *    deliberately uninitialised (matches the orig's untouched r5). NEW finding.
 *  - 021cbf74 opening-transition chooser — control flow + the :4 nibble + bind
 *    data_cc6dc (reload data_021040ac).
 *  - 021ca3fc panel open/close — branch-tail-dup; bind the base ONCE above the
 *    branch (hoisted r4), :4 nibble in each arm.
 *  - 021c9d60 suppress-guard + call (system-work bit 11 via the shift pair).
 *  - 021caf44 single-slot table scan (func_ov000_021ac7a8 over data_cc80c).
 *
 * Levers (re-proven / new):
 *  - :4 BITFIELD STRUCT → the shift pair `lsl#1c; lsr#1c`, NOT `and`. The
 *    low-nibble extract `((struct{unsigned f:4;}*)(p+off))->f` reproduces the
 *    orig where `(x<<28)>>28` FOLDS to `and` and `x&0xf` emits `and`. Used in
 *    021ca3fc / 021cbf74 / 021ca2a0. (Cross-overlay recipe.)
 *  - BIND-vs-RELOAD is per-global: bind data_cc6dc (multi-ref across calls →
 *    one callee-saved load), but leave data_cc6a0 / data_021040ac as direct
 *    references (the orig reloads them). Match the orig, don't over-bind.
 *  - CSE HOIST: 021ca36c-style funcs compute x&7 / y>>3 / y&7 above the switch;
 *    hoist shared subexpressions to locals before the dispatch (helped 17→32 but
 *    that one still missed on deeper grounds — see below).
 *  - UNINITIALISED switch var matches when the orig leaves the reg untouched in
 *    the unhandled path (021ca2a0 — don't add a spurious `default: sel = 0;`).
 *
 * DEFERRED (attempted → Mac/permuter lane):
 *  - 021cc01c (80%) blx dispatch: clean-tail idiom is right but the post-blx
 *    increment block rotates registers (orig reuses the dead r0 = cb() result for
 *    the ptr). Same class as ov009 021ad7d4. (The ((int*)base)[off/4]++ form did
 *    fix the offset-fold, 76→80, but not the r0/r1 rotation.)
 *  - 021ca36c (32%) 2-mode tile lookup: register permutation of the 5 hoisted
 *    values + nested-multiply (`block*32`) address lowering — mwcc materialises
 *    the *32 as a separate lsl vs the orig folding it into the address add.
 *  - 021cb400 (26%) 4-corner loop: heavy register-allocation divergence (mine
 *    spills to r11). 021caea8 / 021caf80 are the func_0201e964 builder family
 *    (stack-layout, = ov003 021cedf8); 021ca18c / 021cb320 / 021c9e1c / 021c9da0
 *    are byte-marshalling / jump-table-loop / big bodies. */

#endif /* OV012_CORE_H */
