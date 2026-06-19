/* func_ov002_021e2728: when the cf17c slot is set, post a 0x58 event (high bit
 * = player), payload 0xD. */
#include "ov002_core.h"
void func_ov002_021e2728(int player) {
    if (*(int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868) == 0)
        return;
    func_ov002_021d46ac((u16)((player ? 0x8000 : 0) | 0x58), 0xD, 0, 0);
}
