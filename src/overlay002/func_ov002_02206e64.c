/* func_ov002_02206e64: t = self->b0 (player); a = cf16c row[t]; b = cf16c
 * row[1-t]; return (a + 0x7d0 <= b). */
#include "ov002_core.h"

int func_ov002_02206e64(struct Ov002Self *self)
{
    int t = self->b0;
    int a = *(int *)(data_ov002_022cf16c + (t & 1) * 0x868);
    int b = *(int *)(data_ov002_022cf16c + ((1 - t) & 1) * 0x868);
    return (a + 0x7d0) <= b;
}
