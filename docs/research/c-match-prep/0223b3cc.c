/* CAMPAIGN-PREP candidate for func_0223b3cc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     table-scan leaf; stride-8 struct array; early-return pointer
 *   risk:       loop compare may emit blt vs orig bcc (unsigned); index *8 lowering should match struct stride
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u16 id;        /* offset 0x0 */
    u8  _pad[6];   /* stride 8 */
} ScanEntry;

extern ScanEntry data_ov002_022ca9bc[];

ScanEntry *func_ov002_0223b3cc(int key)
{
    int i;
    for (i = 0; i < 0x60; i++) {
        if (key == data_ov002_022ca9bc[i].id)
            return &data_ov002_022ca9bc[i];
    }
    return 0;
}
