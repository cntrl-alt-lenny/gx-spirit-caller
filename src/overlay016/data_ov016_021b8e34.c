/* data_ov016_021b8e34 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a struct{short a,b,c,d}[5] record table as part of cm-data-inference-8.
 * Byte-identical to sibling data_ov019_021b5a28 (same 4-field/8-byte-stride
 * record shape, same computed-stride evidence class already shipped for
 * ov006/ov017/ov019 in this campaign) -- likely a shared duel-field-layout
 * table reused verbatim across overlays.
 */

typedef struct {
    short a;
    short b;
    short c;
    short d;
} Row021b8e34;

const Row021b8e34 data_ov016_021b8e34[5] = {
    { 232, 28,  256, 136 },
    { 232, 8,   256, 28 },
    { 232, 131, 256, 151 },
    { 232, 29,  256, 48 },
    { 232, 111, 256, 131 },
};
