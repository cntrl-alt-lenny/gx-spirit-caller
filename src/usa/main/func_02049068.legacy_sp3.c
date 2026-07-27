/* func_02049068: IRQ-safe 64-bit tick-counter snapshot. Zeroes the
 * "in-progress" flag, reads the tick counter, and stores its two
 * halves back into the record -- guarded on the record pointer being
 * non-null.
 *
 * The post-call re-fetch of the global pointer must be named ONCE
 * and reused for both halfword stores (matching the original disasm's
 * single `ldr r2,_LIT0; ldr r2,[r2]`) -- re-dereferencing the global
 * separately for each store adds an extra load and diverges.
 */
typedef struct S020490dc {
    char _pad[0x8];
    unsigned int field_8;
    unsigned int field_c;
    unsigned int field_10;
} S020490dc;

extern S020490dc *data_0219dba0;
extern long long func_02092fc8(void);

void func_02049068(void) {
    long long t;
    S020490dc *g = data_0219dba0;
    S020490dc *g2;
    if (g == 0) return;
    g->field_8 = 0;
    t = func_02092fc8();
    g2 = data_0219dba0;
    g2->field_c = (unsigned int)t;
    g2->field_10 = (unsigned int)(t >> 32);
}
