/* ov010_core.h — STARTER SKETCH of the ov010 per-overlay vocabulary
 * (brief 322 wave 1, the clean-C pivot off the thinned ov004 drain). ov010 is
 * an ARM overlay over a handful of BSS state structs (021b8xxx-021b9xxx) with
 * per-object record structs passed by pointer.
 *
 * STYLE like ov004/ov011: most files `extern` the sink + data base locally and
 * write the body. cached-base is MANDATORY for every global (load the base once
 * into a local, index off it). Offsets are DECIMAL. m2c_feed mislabels
 * main-image 0x0210xxxx syms with the ov010 prefix — use the bare name.
 * GATE = 3-region ninja sha1 (NOT ninja check — benign label drift).
 */
#ifndef OV010_CORE_H
#define OV010_CORE_H

/* --- dominant data bases (extern char foo[]; base+off is the address) ----- */
extern char data_ov010_021b8c08[];   /* view/mode state struct               */
extern char data_ov010_021b8c44[];   /* message-window fade state (+100/+104) */
extern char data_ov010_021b9784[];   /* object-manager A (handle at +144)    */
extern char data_ov010_021b90b4[];   /* object-manager B (handles +296/+300) */
extern char data_ov010_021b9260[];   /* panel/cursor state A (sel +0, flags +544) */
extern char data_ov010_021b9890[];   /* panel/cursor state B (sib of 9260)   */
extern char data_ov010_021b98f0[];   /* config record                       */
extern char data_ov010_021b98a8[];   /* config record                       */
extern char data_ov010_021b9160[];
extern char data_ov010_021b9790[];

/* --- shared sinks (extern from existing decls) ----------------------------
 *   func_020b3870(a, b)                 signed divmod helper (see DIVMOD below)
 *   func_ov005_021ac9c8 / 021ab108      ov005 metric accessors
 *   func_ov005_021ab318/3a0/3b4(h, x)   ov005 handle ops
 *
 * DIVMOD — func_020b3870 is the runtime signed divmod (q in r0, rem in r1).
 *   *** Do NOT use the C `/` or `%` operators *** — mwcc emits `bl _s32_div_f`,
 *   which is UNDEFINED in this link (mwldarm: Undefined "_s32_div_f"). It passes
 *   dcheck (the bl target is masked) but FAILS `ninja sha1` at link. Always call
 *   the helper explicitly:
 *     QUOTIENT:  extern int       func_020b3870(int a, int b);  ->  r0
 *     REMAINDER: extern long long func_020b3870(int a, int b);
 *                rem = (int)(func_020b3870(a, b) >> 32);          ->  r1 (high word)
 *   (s64 `>>32` reproduces the orig's direct-r1 use, no extra mov — 403c/6814.)
 */

/* =======================================================================
 * §VERIFIED — brief 322 wave 1 (15 picks, EUR/USA/JPN ninja sha1 OK). Per-pick
 * table in docs/research/brief-322-ov010-clean-c-wave1.md.
 *
 * Families:
 *  - struct-compute scroll math (divmod quotient, explicit func_020b3870):
 *    021b36e4, 021b39c0, 021b23f4 (clamp+lerp), 021b238c (dirty-bit lerp).
 *  - row-round height (divmod REMAINDER, s64 >>32): 021b403c (mgr-B, *4),
 *    021b6814 (mgr-A, *2) — n += r - n%r rounds up to a whole row.
 *  - panel state-updater PAIR: 021b4090 (021b9260), 021b6868 (021b9890) —
 *    remap-if-neg -> bind/release dispatch -> flag (x&~1)|1 -> toast 86 -> refresh.
 *  - message-window open/config + per-mode dispatch + MMIO: 021b3c58, 021b3ce4.
 *  - handle-count loop: 021b691c (while-loop recipe, below).
 *  - sequence/bind/init: 021b69b4 (INLINE reload x3, NOT cached), 021b4144
 *    (table-bind), 021b2df8 (task-init), 021b3664 (sprite-cell init).
 *
 * RECIPES banked (wave 1):
 *  1. DIVMOD via explicit func_020b3870 (see header block above) — the wave's
 *     single biggest gotcha; the `/`,`%` operators link-fail.
 *  2. LOOP: a `while (h != stop) { h = next(...); ... }` reproduces orig's
 *     guard+do-while. An out-param the callee fills 12 bytes wide must be a
 *     12-byte local (`int slot[3]`) to force `sub sp,#12` (a bare int makes mwcc
 *     push a dummy r3 instead). Assign the accumulator (`cnt=0`) at FIRST USE,
 *     not at declaration, or mwcc hoists the `mov` too early (021b691c).
 *  3. MMIO halfword RMW: cast `*(unsigned short *)` (ldrh, not ldrsh) for
 *     BGnCNT-style `(x & ~3) | n`; the 32-bit DISPCNT stays `*(int *)`.
 *  4. switch with an explicit empty trailing `case N: break;` reproduces the
 *     dead `cmp #N; b tail` (021b3c58/3ce4, N=3).
 *  5. Declare the cached base pointer BEFORE the ret/zero local so mwcc numbers
 *     the base reg below the constant (021b3ce4: d->r4, ret->r5).
 *  6. `(x & ~1) | 1` writes both `bic;orr` (one store) vs `|=1`'s single orr.
 *  7. status-message recipe holds: func_02037208(ID, -1, 0, 1) -> mov rX,#ID;
 *     sub rY,rX,#(ID+1) (ids 86, 56 this wave). INLINE-reload a base the orig
 *     reloads per call across calls (021b69b4), do not cache.
 *
 * WALLS (deferred; permuter/.s tail):
 *  - materialized-divisor reg (021b2490): arg1 stuck in r1, needs `mov r1,r2`
 *    before the divmod (orig parks arg1 in r2 via `movs`). 1 instr over.
 *  - reg-alloc r0<->r1 swap on a held temp (021b46a8: `hit` in r0 vs orig r1).
 *  - frameless+bx-tail vs framed dispatch + load scheduling (021b2514).
 *  - movne/moveq emission order (021b28a8); tail-call bx vs push;bl;`add r0,r0,#0`
 *    ;pop no-op forwarder (021b7104) — both unsteerable mwcc emission quirks.
 *  - nested tilemap-fill loop strength-reduction (021b35e4): mwcc i*N counter +
 *    `strh [p],#2` post-inc vs orig inline index.
 * ======================================================================= */

#endif /* OV010_CORE_H */
