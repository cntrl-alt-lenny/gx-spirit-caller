/* data_ov002_022ca544 (88 bytes, 4-aligned): retyped from opaque bytes
 * to an unsigned short[44] array as part of cm-data-inference-7.
 *
 * STRONG: sole consumer func_ov002_022b0484.s:1101-1111 (label
 * `.L_ef4`) computes `base + idx*2` with `idx = caseId - 0x3a`, guarded
 * by two bounds checks (`caseId < 0x3a` / `caseId > 0x65`) that
 * independently prove exactly 44 valid indices -- matching 88/2 with
 * zero slack. relocs.txt confirms zero embedded pointers in the range.
 */

const unsigned short data_ov002_022ca544[44] = {
    4073, 4375, 4380, 4386, 4398, 4748, 4998, 4999, 5000, 5002, 5230,
    5556, 5701, 6126, 6205, 6024, 6082, 6397, 6405, 6481, 6487, 6540,
    6563, 6564, 6565, 6569, 6639, 6739, 6833, 5677, 5754, 5795, 5839,
    5852, 6056, 6090, 6222, 6285, 6675, 6899, 6905, 6911, 6916, 6917,
};
