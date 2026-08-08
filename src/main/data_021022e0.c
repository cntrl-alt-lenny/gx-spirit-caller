/* data_021022e0 (128 bytes = 32x 4-byte slots, 4-aligned):
 * function-pointer dispatch table for func_02084dc0's object handler
 * loop (src/main/func_02084dc0.s; GROUND TRUTH section of
 * docs/research/dossiers/02084dc0.md already names this table and its
 * `Handler_02084dc0` signature -- independently re-confirmed here
 * against real relocs.txt/symbols.txt, not taken on the dossier's
 * word). func_02084dc0 reads a tag byte, indexes
 * `data_021022e0[tag & 0x1f]` (32 slots) and calls it as
 * `(obj, tag & 0xe0)`. Real bytes: 14 populated pointer slots followed
 * by 18 all-zero slots. Consumer: src/main/func_02084dc0.s:12
 * (`ldr r6, _LIT0`, _LIT0 = data_021022e0); relocs.txt
 * `from:0x02084e08 kind:load to:0x021022e0 module:main`.
 *
 * Populated slots (relocs.txt from:0x021022e0+4*n kind:load to:<target>):
 *   0  func_02084ac4   1  func_02084a9c   2  func_02084914
 *   3  func_02084840   4  func_02084360   5  func_02084218
 *   6  func_02083dd8   7  func_02083aa8   8  func_02083718
 *   9  func_020830ac  10  func_02082fcc  11  func_02082f64
 *  12  func_02082c44  13  func_020828b4
 * Slots 14-31 (offsets +0x38-+0x7c): real ROM bytes are all-zero.
 *
 * Slots 7 (func_02083aa8) and 8 (func_02083718) are the two twin
 * GX-transform handlers analyzed in data_02102254.c / data_0210229c.c /
 * data_02102280.c / data_0210228c.c / data_021022c8.c / data_021022d4.c
 * this same wave.
 *
 * MODE-C REMINDER (per the dossier and confirmed against
 * config/eur/arm9/delinks.txt line 4, `.data` spans
 * 0x020c3bc0-0x02102c60, so this whole symbol is inside .data): this
 * MUST ship as a plain, non-const, non-static array. A `static const`
 * (or any `const`) array of function pointers here would place it in
 * .rodata and silently break the link against the real (non-const)
 * .data placement -- there is no `static`/`const` anywhere below.
 * Target functions are extern-declared with a generic `(void)`
 * signature (matching the existing src/main/data_021021d0.c jump-table
 * precedent) rather than each target's real, differently-shaped
 * prototype -- cast to Handler_02084dc0 at the point of use, same as
 * that precedent's `(void *)func_X` casts.
 *
 * CROSS-REGION: USA/JPN symbols.txt both list a `data_021022e0` at
 * this SAME absolute address, but with genuinely different raw content
 * -- leading word 0xffffffff then zero words, not a pointer table (see
 * data_02102280.c's cross-region note for the paired USA/JPN
 * data_02102280 divergence at this same neighborhood). Moot for build
 * safety: this unprefixed src/main/ TU is EUR-only by
 * tools/configure.py's region-scoping rule.
 */

typedef void (*Handler_02084dc0)(void *obj, int hi);

extern void func_02084ac4(void);
extern void func_02084a9c(void);
extern void func_02084914(void);
extern void func_02084840(void);
extern void func_02084360(void);
extern void func_02084218(void);
extern void func_02083dd8(void);
extern void func_02083aa8(void);
extern void func_02083718(void);
extern void func_020830ac(void);
extern void func_02082fcc(void);
extern void func_02082f64(void);
extern void func_02082c44(void);
extern void func_020828b4(void);

Handler_02084dc0 data_021022e0[32] = {
    (Handler_02084dc0)func_02084ac4,
    (Handler_02084dc0)func_02084a9c,
    (Handler_02084dc0)func_02084914,
    (Handler_02084dc0)func_02084840,
    (Handler_02084dc0)func_02084360,
    (Handler_02084dc0)func_02084218,
    (Handler_02084dc0)func_02083dd8,
    (Handler_02084dc0)func_02083aa8,
    (Handler_02084dc0)func_02083718,
    (Handler_02084dc0)func_020830ac,
    (Handler_02084dc0)func_02082fcc,
    (Handler_02084dc0)func_02082f64,
    (Handler_02084dc0)func_02082c44,
    (Handler_02084dc0)func_020828b4,
    /* slots 14-31 (indices 14..31, offsets +0x38-+0x7c): real ROM
     * bytes are all-zero here. C zero-fills the remaining 18 elements
     * of this 32-element array automatically from a 14-entry
     * initializer list -- left implicit rather than hand-typed to
     * guarantee the byte pattern matches. */
};
