/* func_ov004_021da848: latch a non-zero current-id into b500.84 and fire the
 * id-change handler (id + 219); no-op if unchanged. Sibling of 021cbf38. */
#include "ov004_core.h"
extern void func_ov004_021c9ef0(int id);
void func_ov004_021da848(int id) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x84) != id) {
        *(int *)(b + 0x84) = id;
        if (id != 0) func_ov004_021c9ef0(id + 219);
    }
}
