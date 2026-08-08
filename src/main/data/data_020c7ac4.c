/* data_020c7ac4 (124 bytes, 4-aligned): sorted {key,idx} binary-search
 * table, 31 x 4-byte entries. Consumer: src/overlay002/
 * func_ov002_022bdf30.s (still .s; docs/research/dossiers-high/
 * 022bdf30.md + docs/research/c-match-prep/022bdf30.c) -- the same
 * generic binary-search helper as data_020c9694's giant table,
 * func_020059b0(key, table, count, stride=4), count =
 * data_020c7ac0[0] (already carved, src/main/data/data_020c7ac0.c,
 * = 0x1d = 29). relocs.txt: zero relocations in this range (pure value
 * data, no pointers). 29 real entries (idx runs 0..28 in lockstep with
 * position, key ascending, sorted for binary search) + 1 sentinel
 * {0xffff,0} (same -1 idiom as data_020c9694) + 1 trailing zero pad =
 * 31 x 4B = 124B exact, no leftover bytes.
 * Not const: original section is .data (delinks.txt line 4), not .rodata.
 */
extern int data_020c7ac0;   /* already carved: src/main/data/data_020c7ac0.c, = 0x1d = 29 */

typedef struct {
    unsigned short key;  /* +0x00 sorted search key */
    unsigned short idx;  /* +0x02 self-index 0..28 */
} data_020c7ac4_rec;

data_020c7ac4_rec data_020c7ac4[31] = {
    { 0x0000, 0 },  { 0x10f0, 1 },  { 0x10f1, 2 },  { 0x10f2, 3 },
    { 0x10f3, 4 },  { 0x10f4, 5 },  { 0x10f5, 6 },  { 0x1323, 7 },
    { 0x1344, 8 },  { 0x1345, 9 },  { 0x1346, 10 }, { 0x1347, 11 },
    { 0x1348, 12 }, { 0x1349, 13 }, { 0x149c, 14 }, { 0x14d1, 15 },
    { 0x150b, 16 }, { 0x159d, 17 }, { 0x169f, 18 }, { 0x175e, 19 },
    { 0x183f, 20 }, { 0x187f, 21 }, { 0x18ff, 22 }, { 0x19f2, 23 },
    { 0x1a0c, 24 }, { 0x1a66, 25 }, { 0x1a67, 26 }, { 0x1a77, 27 },
    { 0x1aa7, 28 },
    { 0xffff, 0 },   /* sentinel */
    { 0x0000, 0 },   /* trailing pad */
};
