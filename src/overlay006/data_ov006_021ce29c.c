/* data_ov006_021ce29c (16 bytes, 4-aligned): retyped from opaque bytes to
 * a kv_t[4] key/value lookup table as part of cm-data-inference-11.
 * Same evidence class as sibling data_ov006_021ce2ac (this wave) and
 * the wave-7-shipped data_ov006_021ce56c/data_ov006_021ce5c4 -- twin
 * consumers func_ov006_021c7f5c.s/func_ov006_021c8068.s, hardcoded
 * loop bound `mov ip,#0x4`. Ends with a {-1,0} sentinel, matching the
 * termination convention already established in both wave-7 siblings.
 * Triple-region confirmed. Kept non-const, matching the symbol's own
 * prior non-const declaration (.data ground truth).
 */

typedef struct {
    short key;
    short val;
} kv_t;

kv_t data_ov006_021ce29c[4] = {
    { 0, 1 },
    { 1, 2 },
    { 2, 3 },
    { -1, 0 },
};
