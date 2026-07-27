/* data_ov006_021ce2ac (16 bytes, 4-aligned): retyped from opaque bytes to
 * a kv_t[4] key/value lookup table as part of cm-data-inference-11.
 * Third instance of the same evidence class already shipped for
 * data_ov006_021ce56c[22]/data_ov006_021ce5c4[35] (wave 7): the twin
 * consumer functions func_ov006_021c7f5c.s/func_ov006_021c8068.s share
 * a 9-case switch, and this table's case hardcodes the loop bound
 * `mov ip,#0x4` -- 4 elements, loop-bound-proven not size-guessed.
 * Triple-region confirmed (EUR/USA/JPN all agree on stride, count, and
 * field layout). Kept non-const, matching the symbol's own prior
 * non-const declaration (.data ground truth).
 */

typedef struct {
    short key;
    short val;
} kv_t;

kv_t data_ov006_021ce2ac[4] = {
    { 0, 0 },
    { 1, 1 },
    { 2, 2 },
    { 3, 3 },
};
