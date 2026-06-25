/* CAMPAIGN-PREP candidate for func_02087ee4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop over struct array (stride 0x44), guarded call
 *   risk:       strength-reduction must produce ptr-walk r4+=0x44 with separate i counter; element layout guessed
 *   confidence: med
 */
/* func_02087ee4: iterate 16 entries of a global array (stride 0x44),
 * call worker for each whose byte_2c flag is set.
 * -O4 strength-reduces arr[i] to a pointer walk with a separate i.
 */

typedef struct SlotEe4 {
    char _pad_00[0x2c];
    unsigned char byte_2c;   /* +0x2c flag */
    char _pad_2d[0x44 - 0x2d];
} SlotEe4;                    /* sizeof == 0x44 */

extern SlotEe4 data_021a4874[16];
extern void func_02087954(SlotEe4 *slot, void *ctx);

void func_02087ee4(void *ctx) {
    int i;

    for (i = 0; i < 16; i++) {
        if (data_021a4874[i].byte_2c != 0) {
            func_02087954(&data_021a4874[i], ctx);
        }
    }
}
