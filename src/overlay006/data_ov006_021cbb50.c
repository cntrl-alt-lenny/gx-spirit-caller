/* data_ov006_021cbb50 (36 bytes, 4-aligned): retyped from opaque bytes to
 * a function-pointer dispatch table (9 slots, NULL-terminated) as part of
 * cm-data-inference-8. This is the already-documented Ov006StateCb table
 * for the 021b3f88-variant dispatch-family member (ov006_core.h line 79:
 * "extern Ov006StateCb data_ov006_021cbb50[]; /@ table -- 021b3f88 @/"),
 * one of a 5-member sibling family (data_ov006_021cbbb0/_021cbb74/
 * _021cbb8c/_021cbb38 are the other 4, still opaque). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth). extern char (not a function/fn-ptr type) + &target, matching
 * this project's own D-1 recipe precedent (src/main/data_0210210c.c and
 * wave-6's data_ov011_021d38bc.c) for referencing not-yet-matched target
 * symbols by address only.
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b40ac;
extern char func_ov006_021b43a0;
extern char func_ov006_021b46b8;
extern char func_ov006_021b46fc;
extern char func_ov006_021b47d8;
extern char func_ov006_021b4818;
extern char func_ov006_021b48b8;
extern char func_ov006_021b493c;

Ov006StateCb data_ov006_021cbb50[9] = {
    (Ov006StateCb)&func_ov006_021b40ac,
    (Ov006StateCb)&func_ov006_021b43a0,
    (Ov006StateCb)&func_ov006_021b46b8,
    (Ov006StateCb)&func_ov006_021b46fc,
    (Ov006StateCb)&func_ov006_021b47d8,
    (Ov006StateCb)&func_ov006_021b4818,
    (Ov006StateCb)&func_ov006_021b48b8,
    (Ov006StateCb)&func_ov006_021b493c,
    0,
};
