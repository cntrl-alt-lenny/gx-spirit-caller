/* CAMPAIGN-PREP candidate for func_0203aeec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard table-search loop, pointer-walk + counter, store-order out
 *   risk:       Struct offsets/field widths guessed; ip-vs-lr split could reg-alloc differently
 *   confidence: med
 */
/* func_0203aeec: 16-entry table search.
 *  ldr r0,[r0,#0x78]      base = owner->table
 *  add lr, r0, #0x40      e = base + 0x40 (first entry)
 *  loop 16x stride 8:
 *    ldr [lr]            entry->key32   (cmp r2)
 *    ldreqb [lr,#0x7]    entry->key8    (cmp r3)
 *    on match: ldrsh [lr,#0x4]->*r1, ldrb [lr,#0x6]->r1[2], r3->r1[3], ret 1
 *  no match -> ret 0
 */
typedef struct {
    unsigned int   key32;   /* +0x00 */
    char           _pad04[2];
    short          val16;   /* +0x04 (ldrsh) */
    unsigned char  val8;    /* +0x06 (ldrb)  */
    unsigned char  key8;    /* +0x07 (ldreqb) */
} Entry;

typedef struct {
    char  _pad00[0x40];
    Entry entries[16];      /* +0x40 */
} Table;

typedef struct {
    char   _pad00[0x78];
    Table *table;           /* +0x78 */
} Owner;

typedef struct {
    short         out16;     /* +0x00 (strh) */
    unsigned char out8;      /* +0x02 (strb) */
    unsigned char outKey;    /* +0x03 (strb) */
} OutRec;

int func_0203aeec(Owner *owner, OutRec *out, unsigned int key32, unsigned char key8) {
    Entry *e = owner->table->entries;
    int i;
    for (i = 0; i < 16; i++) {
        if (e->key32 == key32 && e->key8 == key8) {
            out->out16 = e->val16;
            out->out8  = e->val8;
            out->outKey = key8;
            return 1;
        }
        e++;
    }
    return 0;
}
