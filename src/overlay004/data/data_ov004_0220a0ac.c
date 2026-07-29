/* data_ov004_0220a0ac (16 bytes, 4-aligned): wave 14 function-pointer
 * table retype. relocs.txt proves the shape directly: 3 outgoing
 * pointer relocs at offsets 0/4/8 to real (unmatched) ARM functions
 * func_ov004_021d5dc8/_021d6a10/_021d6b88, offset 0xc has no reloc
 * (plain NULL terminator). Real consumer func_ov004_021d6ed0.s indexes
 * this array via data_021040ac+0xb6c (the same cross-overlay
 * state-machine dispatch idiom documented in
 * docs/research/data/FunctionPointerTables.md section 10, and already
 * shipped identically for ov006 in cm-data-inference-8's
 * data_ov006_021cbb50.c): loads index, `this[index]`, calls if
 * non-NULL, advances counter on nonzero return, NULL slot ends the
 * sequence. extern char + cast (D-1 recipe, src/main/data_0210210c.c /
 * data_ov011_021d38bc.c / data_ov006_021cbb50.c precedent) for the 3
 * not-yet-matched targets. Non-const (.data ground truth).
 */

typedef int (*Ov004StateCb)(void);

extern char func_ov004_021d5dc8;
extern char func_ov004_021d6a10;
extern char func_ov004_021d6b88;

Ov004StateCb data_ov004_0220a0ac[4] = {
    (Ov004StateCb)&func_ov004_021d5dc8,
    (Ov004StateCb)&func_ov004_021d6a10,
    (Ov004StateCb)&func_ov004_021d6b88,
    0,
};
