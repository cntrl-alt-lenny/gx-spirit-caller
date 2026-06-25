/* CAMPAIGN-PREP candidate for func_02248b5c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     shared (a0&1)*0x868 CSE'd across two bases (standalone mul); guard + unsigned counted loop
 *   risk:       the scaled index must CSE to one mul (not two mla); guard emits beq vs orig bls; both strides exactly 0x868
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u8  _pad[0x18];
    u32 field_18;     /* offset 0x18 */
    u8  _tail[0x868 - 0x18 - 4];   /* stride 0x868 */
} Slot;

typedef struct {
    u32 field_0;      /* offset 0x0 */
    u8  _tail[0x868 - 4];          /* stride 0x868 */
} SlotB;

extern Slot  data_ov002_022cf16c[];
extern SlotB data_ov002_022cf184[];
extern void  func_ov002_02253458(int a0, int b, int i);

void func_ov002_02248b5c(int a0)
{
    int idx = a0 & 1;
    if (data_ov002_022cf184[idx].field_0 == 0)
        return;
    {
        Slot *sel = &data_ov002_022cf16c[idx];
        int i;
        for (i = 0; (u32)i < sel->field_18; i++)
            func_ov002_02253458(a0, 12, i);
    }
}
