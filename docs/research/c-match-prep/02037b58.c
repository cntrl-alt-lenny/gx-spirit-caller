/* CAMPAIGN-PREP candidate for func_02037b58 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ptr-range fast-path; counted scan; OR key match; u16 truncation
 *   risk:       key held as id<<16 then lsr#16 each use vs masked local may differ; f34/f74/f6a offsets guessed; range-compare signedness
 *   confidence: low
 */
/* func_02037b58: resolve an id to an Entry pointer, or pass through a
 * value that is already a pointer into the table.
 *
 * Pre-check (id not a small int and not flag-bit-27, treated as ptr):
 *   if (id <= 0xffff || (id & 0x8000000)) goto scan;
 *   if (id < &data_0219b760) return 0;
 *   if (id <= &data_0219c408) return id;   else return 0;
 *
 * Scan 28 stride-0x78 entries, key = (u16)id:
 *   if (e->f6a < 0) continue;
 *   if ((u16)e->f34 == (u16)id || e->f74 == (u16)id) return e;
 */

typedef struct Entry58 {
    char           _pad_00[0x34];
    unsigned int   f34;   /* +0x34, compared as u16 */
    char           _pad_38[0x6a - 0x38];
    signed char    f6a;   /* +0x6a */
    char           _pad_6b[0x74 - 0x6b];
    unsigned short f74;   /* +0x74 */
    char           _pad_76[0x78 - 0x76];
} Entry58;

extern Entry58 data_0219b760[28];
extern Entry58 data_0219c408;   /* upper bound sentinel address */

Entry58 *func_02037b58(unsigned int id) {
    Entry58 *e;
    unsigned short key;
    int i;

    if (id > 0xffff && !(id & 0x8000000)) {
        if (id < (unsigned int)data_0219b760) return 0;
        if (id <= (unsigned int)&data_0219c408) return (Entry58 *)id;
        return 0;
    }

    key = (unsigned short)id;
    e = data_0219b760;
    for (i = 0; i < 28; i++, e++) {
        if (e->f6a < 0) continue;
        if ((unsigned short)e->f34 == key || e->f74 == key) {
            return e;
        }
    }
    return 0;
}
