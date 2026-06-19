/* func_ov002_0225829c: hand d016c.D70 + (D74+D78) to 0227ab9c and clear D50. */
#include "ov002_core.h"
extern void func_ov002_0227aaac(int a, int b);

void func_ov002_0225829c(void) {
    func_ov002_0227aaac(*(int *)(data_ov002_022d008c + 0xD70),
        *(int *)(data_ov002_022d008c + 0xD74) + *(int *)(data_ov002_022d008c + 0xD78));
    *(int *)(data_ov002_022d008c + 0xD50) = 0;
}
