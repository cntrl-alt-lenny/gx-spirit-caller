/* ov004_core.h — STARTER SKETCH of the ov004 per-overlay vocabulary
 * (brief 316 wave 1, the clean-C pivot off the tapped ov011 drain). ov004 is a
 * large mixed ARM/THUMB overlay: the 0x021c9xxx-0x021cexxx range is ARM game
 * logic over a dominant BSS state struct; the 0x021dbxxx-0x021dexxx range is
 * THUMB utility code (string/crypto helpers) that hits the Thumb
 * section-alignment wall -> .s escape, NOT clean-C (see thumb-align-wall.md).
 *
 * The §VERIFIED block at the bottom is byte-proven; entries above are SKETCH.
 * STYLE like ov011: most files just `extern` the sink + data base locally and
 * write the body; this header documents the shared bases so the wave doesn't
 * re-derive offsets. GATE = 3-region ninja sha1 (NOT ninja check — ov004 has a
 * benign dsd data-label drift, brief 818).
 */
#ifndef OV004_CORE_H
#define OV004_CORE_H

/* --- dominant data bases (extern char foo[]; base+off is the address) ----- */
extern char data_ov004_0220b500[];   /* primary BSS state struct             */
extern char data_ov004_0220b568[];   /* parallel table, indexed [idx << 2]   */
extern char data_ov004_02211490[];   /* record A (init/reset target)         */
extern char data_ov004_02211538[];   /* record B (init target)               */
extern char data_ov004_022915e8[];   /* global lock flag (timer gate)         */
extern char data_ov004_0220e500[];   /* secondary state struct               */
extern char data_ov004_0220f228[];   /* f228 record array (stride 84)        */

/* --- data_ov004_0220b500 field map (byte offsets; § = byte-verified) ------
 *   +0x84    current-id latch (set-if-changed, then func_021c9ef0(id+219))  §
 *   +0x228   active flag (!=0 gate)                                          §
 *   +0x230   mode word (== 3 check)                                         §
 *   +0x68    per-index signed field at [base + idx*4 + 0x68]                §
 */

/* --- shared sinks (extern from existing decls) ----------------------------
 *   func_0202c0c0(id) -> int            sound/se trigger (also ov011)
 *   func_ov004_021c9ef0(id)             id-change handler
 */

/* =======================================================================
 * §VERIFIED — brief 316 wave 1 (17 picks, EUR ninja sha1 OK). Per-pick table in
 * docs/research/brief-316-ov004-clean-c-wave1.md.
 *
 * Families (clone targets for wave 2):
 *  - b500 global predicate/accessor: 021cbf38, 021ce9b8, 021d7c54, 021d9948,
 *    021ce1bc  (ALL need cached `char *b = data_ov004_0220b500;` — bare access
 *    reg-numbers the base r1 vs orig r2).
 *  - self-ptr record op: 021c9f94 (handle-free x2), 021d56fc (timer advance).
 *  - timer-setter (double-ternary): 021d4004, 021d4238, 021d4914 [sib].
 *  - forwarder/sequence: 021d2520, 021c9d60, 021c9d9c, 021cf600, 021d8608,
 *    021d5b9c.  MMIO: 021d5d84 (0x0500045e backdrop grayscale).
 *
 * GOTCHAS (ov004-specific):
 *  - cached-base mandatory for global accessors (021c9d60, no global, matched raw).
 *  - guard-flip block layout: `if(active) return cmp; return 0;` (021d9948).
 *  - m2c_feed MISLABELS main-arm9 data syms with the ov004 prefix: a 0x0210xxxx
 *    sym shows as data_ov004_02104f4c but the real name is data_02104f4c (no
 *    prefix) -> else mwldarm Undefined. Use the bare data_0210xxxx name.
 *  - objdump offsets are DECIMAL (132=0x84, 136=0x88, 84=0x54).
 *  - THUMB cohort (021dbxxx generic utils) = Thumb-align wall -> .s escape, NOT
 *    clean-C. This header/track is the ARM cohort only.
 *
 * WALL: 021d8d1c (MMIO BLDCNT bitfield RMW — orig uses ip scratch for field>>8,
 * mwcc reuses r2; 1 reg off).
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 318 wave 2 (15 picks, EUR ninja sha1 OK). Per-pick table in
 * docs/research/brief-318-ov004-clean-c-wave2.md.
 *
 * Families added:
 *  - id-latch sib 021da848; handle-free sib 021cfba0 (x3).
 *  - status-message: 021ceb24, 021d97c8, 021d9778, 021ce9e4, 021d9724
 *    (buf = 2-u16 local {tag, b500.field}; 02034888(3,buf,4); then
 *     func_02037208(ID, -1, 0, 1) -> mwcc emits `mov rX,#ID; sub rY,rX,#(ID+1)`,
 *     does NOT fold the -1. ids 66/58/56 confirmed.)
 *  - timer-setter 021d47bc/021d4958; struct-copy dispatch 021cc74c
 *    (Copy32(dst,src,n)/Fill32(val,dst,n) + guard-flip); state-machine 021d7c00;
 *    cell-config 021da898 (021ca0a4 6-arg).
 *
 * WALLS (defer; reg-alloc/permuter tail):
 *  - changed-bool family (~8: 021d48bc 021d52a0 021d4044 021d427c 021d43a0
 *    021d4d8c 021d4804 021d5a10): `int c=0; if(rec.unk38){rec.unk38=0;c=1;}
 *    if(c)...` — orig reuses the dead unk38 reg (r0) for c; mwcc picks fresh r1.
 *    1 reg off on every member; unsteerable (store-c, !!, temp all fail).
 *  - two-const message (021d1264/021d12b0/021d1308): buf-const + b500-field-const
 *    swap ip<->lr.
 *  - materialized-bool-global `if(g!=0)return` (021d4870/021d57ec): orig
 *    materialises movne#1;moveq#0, mwcc branches direct.
 *  - fn-ptr B6C dispatch (021cb518/021d6ed0): data_021040ac.B6C++ field-pool
 *    (== ov011 021d0afc wall). field-pool RMW 021cc2a4; base+212 pool 021d641c.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 320 wave 3 (6 picks, EUR ninja sha1 OK). EASY CLEAN TIER
 * THINNING (17->15->6). Per-pick table in brief-320-ov004-clean-c-wave3.md.
 *  - 021d3818 (MMIO/sound teardown), 021da91c (toggle + tail-call), 021cbf84
 *    (cell-config sib), 021d3d2c (sound+flag dispatch), 021d13dc/021cea48 (msg).
 *
 * Recipes: tail-call (void fn, last stmt func_X(), no frame -> `bx ip`; dcheck
 * normalises bx<reg>); a `mov r0,#0` before a dispatch branch is the callee ARG
 * (021d1118(0)); `-N` literal quirk works for any sink (0208e2f4(reg,28,-16) ->
 * mov;sub); re-read a field when orig reloads it (021cea48); cell-config base is
 * NOT cached when calls separate the accesses (021cbf84 vs 021da898 which is).
 *
 * NEW WALLS: loop strength-reduction (021d7854/021dab1c — mwcc keeps a separate
 * i*N counter vs orig inline `add base,i,lsl#k`); fn-ptr-by-field reg (021d5b14);
 * magic-/1000 division (021d3de4); stack-heavy sinks (021ca0a4/cb778/cb568).
 *
 * THINNING FLAG: the changed-bool family (~19) is the dominant remainder ->
 * PERMUTER PASS is the biggest unlock. Else clean-C ~6/wave, or pivot overlay.
 * The 0x100-0x200 ov004 tier is untouched.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 393 (16 picks, 3-region ninja sha1 EUR/USA/JPN OK). The
 * real-C the Windows .s-pivot skipped (brief 364 surfaced both veins). Per-pick
 * table in docs/research/brief-393-ov004-realc.md.
 *
 * VEIN B — the cursor-validation + status-message FAMILY (8 ARM .c):
 *  021cc3c0 021daa48 021d2550 021cc2f0 021da978 021cec8c 021ceb6c 021d02f4.
 *  One template, parameterised. Shape:
 *    int r=0; int z,y,x;   // DECLARE z,y,x (last-declared = lowest sp offset:
 *                          //   x@sp0, y@sp4, z@sp8 to match the out-call &args)
 *    if (func_02006194()!=0 || func_0200617c()!=0) {     // short-circuit ||
 *        func_0200612c(&z,&x); func_02006110(&z,&y);      // out-param fills
 *        if (x<32 && y<30 && z>=LO && z<HI) {  // mwcc: ldrlt-predicated &&
 *            r=1; if (func_0200617c()!=0) { *(int*)(b+OFF)=K; msg(); } }
 *    } else if (*(u16*)(data_02104bac+84) & 2) { r=1; ...msg... }
 *    return r;
 *  msg() = `func_02037208(ID,-1,0,r)` — the `-1` is `mov rX,#ID;sub rY,rX,#ID+1`
 *  (mwcc does NOT fold; ID 58/66). PASS the return var `r` as arg4 (mov r3,r5),
 *  NOT a literal 1. Pass var `r` to stores too so mwcc shares the reg. Idioms:
 *  early-out `if(*(int*)(b+92)!=0) return r;` -> predicated `popne`; the `r-2`
 *  trick (`*(int*)(b+144)=r-2` => `sub rX,r5,#2` for the constant -1); cache the
 *  data_02104bac flags word in a local before two `tst`. SWITCH dispatch needs a
 *  real `switch` (cmp/beq-chain) NOT if-else-if (which inlines bodies).
 *  func_02006194 takes NO arg here (decl `(void)`; the other-TU `(int)` decl is
 *  per-TU). DEFER: 021d9d58 (body matches, prologue SCHEDULE near-miss — mwcc
 *  hoists the b500[92] branch-load before the e500 store; permuter target).
 *
 * VEIN A — the THUMB cohort, via the NEW *.thumb.c HARNESS (8 Thumb .c):
 *  021dbea0 021dbfa8 021dc0e8 021dc128 021dc19c 021dbf6c 021dbecc 021dc154.
 *  THE UNLOCK: call-having Thumb needs the ARMv4T interworking frame
 *  `push{lr};sub sp,#4` … `add sp,#4;pop{r3};bx r3`, which is emitted by mwcc
 *  *1.2/sp2p3* (the existing legacy compiler) — NOT 2.0/sp1p5 (`pop{r3,pc}`). It
 *  is a COMPILER-VERSION difference, not a -proc one (1.2/sp2p3 emits `bx r3`
 *  under the standard -proc arm946e). configure.py routes `*.thumb.c` ->
 *  mwcc_thumb (= 1.2/sp2p3); source carries `#pragma thumb on`. patch_objects_
 *  legacy.py extended to rewrite func_X.thumb.o (same dsd-lcf objects.txt bug).
 *  4-ALIGNED STARTS ONLY (mwcc emits Thumb sh_addralign=4); 2-aligned still .s.
 *  The cohort is a crypto/util library: XOR (021dbfa8), table CRC-32
 *  (021dc0e8 byte loop / 021dc128 finalize `^0xFFFFFFFF`), RC4 PRGA (021dc154),
 *  keystream-XOR (021dc19c), interleave (021dbf6c), init-seq (021dbecc).
 *  Recipes: divmod helpers func_020b3870 (q=`extern int`->r0) / func_020b3a7c
 *  (rem=`extern long long`->`(int)(x>>32)`=r1); keystream XOR needs a TEMP
 *  (`uchar k=f(); dst[i]=k^src[i]`) to put k in r1 not r0 (reg-alloc); CRC
 *  finalize `(uchar)(crc ^ 0xFFFFFFFF)`. dcheck: drop trailing literal-pool
 *  `.word` (m2c_feed folds pools into `ldr =sym`; objdump shows the word).
 *  ~37 more 4-aligned call-having Thumb funcs remain = a DRAIN VEIN for future
 *  waves. WALL: frameless reg-mirror (021dc0ac CRC-table-gen — instructions
 *  identical, register NUMBERS shifted; -> permuter/.s, like 021dcbcc).
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 395 (14 Thumb .c, 3-region ninja sha1 OK). Thumb-cohort
 * DRAIN wave 1 (no harness change — plain *.thumb.c, #pragma thumb on). Per-pick
 * table in docs/research/brief-395-ov004-thumb-drain-wave1.md.
 *  021dbddc 021dbe40 021dbf48 021dbe78 021dd20c 021dd5f0 021dd244 021dbd34
 *  021dbd84 021dc954 021dbfd4 021dd27c 021dccc8 021dd59c.
 * NEW recipes:
 *  - STACK-ARG PASS-THROUGH FORWARDER: 6-param func (p1-4 in r0-3, p5/p6 at
 *    caller sp[16]/sp[20]), byte-write then forward p1-4 UNCHANGED to a 5-arg
 *    sink (p5 on stack). `void f(int a,b,c,d,uchar*e,int g){*e=g;sink(a,b,c,d,e);}`
 *    keeps a-d in r0-3 (no movs), spills e to sp[0]. (Was the un-decodable
 *    "stack-arg" class.)
 *  - COMBINED long-long DIVMOD decl: a TU needing BOTH q and rem of the same
 *    helper declares it ONCE `extern long long func_020b3870(int,int)`; q=`(int)x`
 *    (r0), rem=`(int)(x>>32)` (r1). (021dbfd4.)
 *  - dispatch-order INVERSION (021dd20c/021dbf48): orig branches the equal/<=0
 *    case FORWARD to a shared `return 0` -> write `if(NOT-that){body}return 0;`.
 *  - POST-INCREMENT placement (021dbfd4): `buf[i]^=key[ki++]` emits ki++ right
 *    after the key load (not after the store).
 *  - `~0`/`~1` ERROR CODES (021dccc8): `r=~0` reuses the result reg (=0) for mvns.
 *  - memcmp loop (021dbe78): fold the byte-compare INTO the while condition
 *    `while(count-->0 && (d=*p0-*p1)==0){p0++;p1++;}` for the rotated layout.
 *  - bswap (021dbd34/84): objdump halfword display is per-hw LE — read the 4 raw
 *    BYTES. OR-tree matches right-associated `a|(b|(c|d))`.
 *  - struct-init const 0xC0A80B01 = 192.168.11.1 (021dd59c network config).
 * DEFERRED -> permuter/.s/wave-2: 021dc1cc (RC4 KSA — spill-choice reg-alloc,
 * orig spills N keeps S[i]; 53v50), 021dbdf4 (fixed-pt 64-bit, pool straddles fn
 * boundary), 021dcd1c (scan+dispatch, r0-vs-const param ambiguous cold).
 * REMAINING: ~21 call-having Thumb (>=0x5c: multi-stack-arg builders 021dc350/
 * c418/c500, larger crypto 021dc020/c238/ca68/dd374, the 0xaec 021dd648).
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 397 (8 Thumb .c, 3-region ninja sha1 OK). Thumb-cohort DRAIN
 * wave 2 (the harder >=0x5c tier). Per-pick table in
 * docs/research/brief-397-ov004-thumb-drain-wave2.md.
 *  021dbdf4 021dc418 021dc3b8 021dc350 021dc500 021dc2cc 021dc020 021dc238.
 * The harder tier yielded because it COMPOSES the wave-1 primitives (builders +
 * RC4 orchestrators chaining 021dbddc/dbfd4/dbfa8/dbf6c/dc128/dc19c).
 * NEW recipes:
 *  - 64-bit ACCUMULATE: `long long s=0; s+=(long long)q1; s+=(long long)q2;` keeps
 *    {hi:lo} across the 2nd call (a one-shot `s=(ll)a+(ll)b` defers sign-ext +
 *    diverges). STRUCT COPY `Pair l=*(Pair*)p;` batches load-load-store-store (vs
 *    int[] a[0]=b[0] which mwcc does conservatively). Shared pool const: 2 `x*K`
 *    mults CSE to one pool word but two ldr — write K twice. (021dbdf4.)
 *  - MULTI-STACK-ARG PASS-THROUGH BUILDER (021dc418/c350/c500): 5th-7th params at
 *    caller sp[N]; sink's outgoing stack args go to sp[0/4/8], r0-3 unmoved. A
 *    struct field read with PER-USE signedness is real: a3[0] ldrsh for two calls
 *    + ldrh for one -> `(unsigned short)a3[0]` on just that one. ldrsb stack param
 *    = `signed char` param.
 *  - S-BOX-IN-state[2] (021dc2cc/c238): RC4 orchestrators store the alloc straight
 *    into the state struct: `state[2]=(int)alloc;` so that slot IS the S-box; free
 *    `(void*)state[2]`. The state lives on the stack (sp+0 or sp+4), the alloc at
 *    state[2].
 *  - cmp-ORDER via TEMP (021dc238): `int crc=f(); if(crc!=x)` -> `cmp r0,rX`
 *    (result first); inline `if(f()!=x)` -> `cmp rX,r0`.
 * DEFERRED -> permuter/.s (reg/slot-alloc near-misses, do NOT grind): 021dcd1c
 * (found/i reg swap 31/31; param ambiguity RESOLVED = f(a0,a1), not-found cmp
 * a0==0x1000), 021dd2c8 (count/rec8 + 2-slot swap 63/63), 021dc1cc (RC4 KSA
 * spill-choice). GOTCHA: `asm_escape --whole-function` can't parse a THUMB gap obj
 * ("no disassembly in _dsd_gap@…" — resolves ARM per-fn syms, not Thumb) -> the .s
 * route for Thumb reg-walls needs an asm_escape Thumb fix or the scaffolder lane.
 * WALLS: 021dca68 (PC-rel JUMP TABLE `add rN,pc;ldrh;bx rN`), 021dd374/021dd648
 * (RE-tier). REMAINING ~16 (incl untried mediums 021dbc8c/c474/c570/c664/c7bc/
 * c830/c998/cbf0/cd64/ce74/cf38/dd040/dd150) = a wave-3, lower yield.
 * ======================================================================= */

#endif /* OV004_CORE_H */
