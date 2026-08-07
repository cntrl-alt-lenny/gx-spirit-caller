/* data_ov006_021cbb20 (24 bytes, 4-aligned): Ov006StateCb dispatch table
 * (5 slots, NULL-terminated), cm-restock-carve-1. NOT previously declared
 * as an extern anywhere -- only named in an ov006_core.h comment (line
 * 220): "021b343c: state 0224f1fc / table 021cbb20 / data 021cb518 --
 * tail returns 0." (the 2nd of a 2-member "dispatch variants (extend
 * family A, 0x5c)" pair; the 1st member's table is data_ov006_021cbac0,
 * not part of this wave's candidate pool). Real bytes confirmed via
 * extract/eur/arm9_overlays/ov006.bin: 5 words in ov006's own .text
 * range + one trailing zero word, no more. Kept non-const to match this
 * family's sibling convention (.data ground truth -- see
 * data_ov006_021cbb50.c from cm-data-inference-8). extern char + cast,
 * this project's D-1 recipe precedent for not-yet-matched targets.
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b3498;
extern char func_ov006_021b355c;
extern char func_ov006_021b387c;
extern char func_ov006_021b38fc;
extern char func_ov006_021b39a4;

Ov006StateCb data_ov006_021cbb20[6] = {
    (Ov006StateCb)&func_ov006_021b3498,
    (Ov006StateCb)&func_ov006_021b355c,
    (Ov006StateCb)&func_ov006_021b387c,
    (Ov006StateCb)&func_ov006_021b38fc,
    (Ov006StateCb)&func_ov006_021b39a4,
    0,
};
