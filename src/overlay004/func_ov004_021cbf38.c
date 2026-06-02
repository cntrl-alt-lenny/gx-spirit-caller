/* func_ov004_021cbf38: latch a new current-id into b500.84 and fire the
 * id-change handler (id + 219); no-op if unchanged. */
#include "ov004_core.h"
extern void func_ov004_021c9ef0(int id);
void func_ov004_021cbf38(int id) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x84) == id) return;
    *(int *)(b + 0x84) = id;
    func_ov004_021c9ef0(id + 219);
}
