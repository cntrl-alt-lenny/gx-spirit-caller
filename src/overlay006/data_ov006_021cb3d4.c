/* data_ov006_021cb3d4 (112 bytes, 4-aligned): retyped from opaque bytes
 * to a { s16 lo, hi } range-bracket bsearch table (28 records) as part
 * of cm-data-inference-6.
 *
 * Sole consumer func_ov006_021b9d58.c:8 -- `func_020059b0(&local,
 * data_ov006_021cb3d4, 0x1c, 4, func_ov006_021b9d98)` -- passes an
 * explicit record count (0x1c = 28, matching 112/4 exactly) and element
 * width (4 bytes) to a generic bsearch helper, which is loop-bound-proof
 * of both the element count and the 4-byte stride, not merely inferred
 * from total byte size.
 */

typedef struct {
    short lo;
    short hi;
} RangeBracket021cb3d4;

const RangeBracket021cb3d4 data_ov006_021cb3d4[28] = {
    { -1, -1 }, { 0, 0 }, { 1, 500 }, { 501, 1000 },
    { 1001, 1100 }, { 1101, 1200 }, { 1201, 1300 }, { 1301, 1400 },
    { 1401, 1500 }, { 1501, 1600 }, { 1601, 1700 }, { 1701, 1800 },
    { 1801, 1900 }, { 1901, 2000 }, { 2001, 2100 }, { 2101, 2200 },
    { 2201, 2300 }, { 2301, 2400 }, { 2401, 2500 }, { 2501, 2600 },
    { 2601, 2700 }, { 2701, 2800 }, { 2801, 2900 }, { 2901, 3000 },
    { 3001, 3500 }, { 3501, 4000 }, { 4001, 4500 }, { 4501, 5000 },
};
