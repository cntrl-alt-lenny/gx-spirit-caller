/* func_ov002_022578c0: resolve self's record via func_ov002_0225737c; zero
 * CE288->f_5c0 unconditionally; bail (return 0) if the record is null or
 * its +8 handler is null. Else for player=0..1, idx=0..4 over the player's
 * cf16c row sub-array (stride 0x14), skip any sub-row whose +0x40 bit 2 is
 * set, else call the record's +8 handler(self, player, idx) and count the
 * nonzero results. Returns the count. */
#include "ov002_core.h"

extern char *func_ov002_0225737c(void *self);

int func_ov002_022578c0(void *self) {
    int count = 0;
    char *rec = func_ov002_0225737c(self);
    CE288->f_5c0 = 0;
    if (rec == 0 || *(int *)(rec + 8) == 0) goto ret;
    {
        int player;
        for (player = 0; player < 2; player++) {
            int idx = 0;
            char *row = data_ov002_022cf08c + (player & 1) * 0x868;
            for (; idx <= 4; idx++, row += 0x14) {
                unsigned int field = *(unsigned int *)(row + 0x40);
                if (((field >> 2) & 1) == 0) {
                    int (*fn)(void *, int, int) = *(int (**)(void *, int, int))(rec + 8);
                    if (fn(self, player, idx) != 0) count++;
                }
            }
        }
    }
ret:
    return count;
}
