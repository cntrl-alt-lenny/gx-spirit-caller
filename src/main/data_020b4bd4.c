/* Cluster C Pattern 1 — data_020b4bd4 (396 bytes, 4-aligned).
 *
 * Retyped from opaque `const unsigned char[396]` to a 99-record,
 * 4-byte-stride struct (cm-data-inference-2 batch 2): two
 * `unsigned short` fields per record.
 *
 * Evidence (established by the prior investigation phase, not
 * re-derived here):
 *   - field0 (offset 0) is read by src/main/func_020117ac.c (matched
 *     C), originally `*(unsigned short *)((char *)data_020b4bd4 +
 *     (i - 1) * 4)` — pointer-cast arithmetic.
 *   - field1 (offset 2) is read by src/main/func_02011780.c (matched
 *     C), originally `data_020b4bd4[(i - 1) * 2 + 1]` — short-array
 *     indexing.
 *   - field0 is a monotonic u16 curve 372->45288 (likely an EXP/level
 *     table); field1 is a monotonic u16 curve 70->365.
 *   - The 99-record cap (0x63) is independently reconfirmed by a
 *     third, unrelated call site (src/overlay017/func_ov017_021b34c4.s,
 *     two places) checking the identical bound before calling.
 *
 * Field names are placeholders — no consumer names them semantically.
 * Byte content is an exact reinterpretation of the same bytes
 * previously shipped as `const unsigned char data_020b4bd4[396]` —
 * this retype changes only the C-level type, not any byte value.
 */

typedef struct {
    unsigned short field0;   /* offset 0 */
    unsigned short field1;   /* offset 2 */
} Record020b4bd4;

const Record020b4bd4 data_020b4bd4[99] = {
    { 372, 70 },
    { 492, 74 },
    { 624, 78 },
    { 756, 82 },
    { 900, 86 },
    { 1056, 90 },
    { 1224, 94 },
    { 1404, 98 },
    { 1584, 102 },
    { 1776, 106 },
    { 1980, 110 },
    { 2196, 114 },
    { 2424, 118 },
    { 2652, 122 },
    { 2892, 126 },
    { 3144, 130 },
    { 3408, 134 },
    { 3684, 138 },
    { 3960, 142 },
    { 4248, 146 },
    { 4548, 150 },
    { 4860, 154 },
    { 5184, 158 },
    { 5508, 162 },
    { 5844, 166 },
    { 6156, 170 },
    { 6480, 174 },
    { 6804, 177 },
    { 7140, 180 },
    { 7488, 183 },
    { 7836, 186 },
    { 8196, 189 },
    { 8556, 192 },
    { 8928, 195 },
    { 9300, 198 },
    { 9684, 201 },
    { 10080, 204 },
    { 10476, 207 },
    { 10884, 210 },
    { 11304, 213 },
    { 11724, 216 },
    { 12156, 219 },
    { 12588, 222 },
    { 13032, 225 },
    { 13476, 228 },
    { 13932, 231 },
    { 14400, 234 },
    { 14844, 237 },
    { 15288, 240 },
    { 15744, 243 },
    { 16200, 245 },
    { 16668, 248 },
    { 17136, 250 },
    { 17616, 253 },
    { 18096, 255 },
    { 18588, 258 },
    { 19080, 260 },
    { 19584, 263 },
    { 20088, 265 },
    { 20604, 268 },
    { 21120, 270 },
    { 21648, 273 },
    { 22176, 275 },
    { 22716, 278 },
    { 23256, 280 },
    { 23808, 283 },
    { 24360, 285 },
    { 24924, 288 },
    { 25488, 290 },
    { 26064, 293 },
    { 26640, 295 },
    { 27228, 298 },
    { 27816, 300 },
    { 28416, 303 },
    { 29016, 305 },
    { 29628, 308 },
    { 30240, 310 },
    { 30864, 313 },
    { 31488, 315 },
    { 32124, 318 },
    { 32760, 320 },
    { 33408, 323 },
    { 34056, 325 },
    { 34716, 328 },
    { 35376, 330 },
    { 36048, 333 },
    { 36720, 335 },
    { 37404, 338 },
    { 38088, 340 },
    { 38784, 343 },
    { 39480, 345 },
    { 40188, 348 },
    { 40896, 350 },
    { 41616, 353 },
    { 42336, 355 },
    { 43068, 358 },
    { 43800, 360 },
    { 44544, 363 },
    { 45288, 365 },
};
