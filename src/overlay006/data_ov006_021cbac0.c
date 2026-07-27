/* data_ov006_021cbac0 (72 bytes, 4-aligned): retyped from opaque bytes
 * to a NULL-terminated function-pointer array[18] (17 real callbacks +
 * 1 NULL sentinel) as part of cm-data-inference-7. Was mistagged "D-2
 * scalar array" by an early mechanical sweep -- matches this project's
 * own D-1 (dispatch table) signature instead (docs/research/
 * cluster-d-recipe.md), same misclassification class already found and
 * fixed for sibling data_ov011_021d38bc (cm-data-inference-6).
 *
 * STRONG: 2 already-matched C consumers (func_ov006_021b2280.c:5,7 and
 * func_ov006_021b22c8.c:6,11), both `extern int (*data_ov006_021cbac0[])
 * (void); ... data_ov006_021cbac0[data_ov006_021cf140[0]]` -- computed-
 * stride, runtime-variable index (a mutable state word, not a
 * constant). relocs.txt independently proves the exact shape: a
 * relocation at EVERY 4-byte-aligned word from 0x021cbac0 through
 * 0x021cbb00 (17 consecutive words, each resolving to a distinct
 * function symbol), and no relocation at the 18th (raw zero bytes,
 * matching the NULL terminator) -- linker ground truth, not inferred
 * from the consumers' code.
 *
 * Ground-truth section is `.data` (config/eur/arm9/overlays/ov006/
 * delinks.txt), so this stays deliberately non-`const` -- unlike the
 * `.rodata`-sited pointer tables elsewhere in this wave (see
 * data_ov011_021d30f8.c for why const-placement controls section
 * choice on this toolchain), a `const`/`static` qualifier here would
 * relocate this array into `.rodata` and break the link against
 * ground truth. Raw address-literal casts are still used (not `extern
 * int func_X(void); ...`) purely for source brevity; none of these 17
 * targets are named/carved as their own functions yet.
 */

typedef int (*Ov006CbFn)(void);

Ov006CbFn data_ov006_021cbac0[18] = {
    (Ov006CbFn)0x021b2324, (Ov006CbFn)0x021b23c8, (Ov006CbFn)0x021b26e0, (Ov006CbFn)0x021b2760,
    (Ov006CbFn)0x021b2804, (Ov006CbFn)0x021b287c, (Ov006CbFn)0x021b28c0, (Ov006CbFn)0x021b2970,
    (Ov006CbFn)0x021b29b0, (Ov006CbFn)0x021b2a58, (Ov006CbFn)0x021b2b08, (Ov006CbFn)0x021b2b28,
    (Ov006CbFn)0x021b2bd4, (Ov006CbFn)0x021b2c9c, (Ov006CbFn)0x021b2cbc, (Ov006CbFn)0x021b2d5c,
    (Ov006CbFn)0x021b2de0, 0,
};
