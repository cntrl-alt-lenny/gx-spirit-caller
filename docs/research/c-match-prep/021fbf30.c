/* CAMPAIGN-PREP candidate for func_021fbf30 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted search loop over 0x18-stride entries, asymmetric-shift field, bx lr
 *   risk:       loop induction/reg-alloc may differ; asymmetric (x<<17)>>23 must stay unfolded; count@0x490 read once; entry stride 0x18 / field@+4 layout
 *   confidence: med
 */
/* func_ov002_021fbf30: linear search a count-prefixed table for an entry
 * whose 9-bit field equals arg0; return 1 on hit, else 0.
 *   count = *(u32*)(ce288 + 0x490);   // read once before the loop
 *   for (i = 0; i < count; i++) entry += 0x18:
 *       if (arg0 == ((u32)(entry->f4 << 17) >> 23)) return 1;
 *   return 0;
 * Asymmetric shift extract -> raw C `(unsigned)(x<<17)>>23` (mwcc does NOT
 * fold unequal shifts; only symmetric (x<<N)>>N folds to a mask).
 */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022ce288[];

int func_ov002_021fbf30(int arg0) {
    u32 count = *(u32 *)(data_ov002_022ce288 + 0x490);
    char *p = data_ov002_022ce288;
    u32 i;
    for (i = 0; i < count; i++) {
        if ((u32)arg0 == ((u32)(*(u16 *)(p + 4) << 17) >> 23)) return 1;
        p += 0x18;
    }
    return 0;
}
