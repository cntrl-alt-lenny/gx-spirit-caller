/* func_ov002_02258384: hand d016c.D70 + (D74+D78) to 0227ab9c and clear D50. */
#include "ov002_core.h"
extern void func_ov002_0227ab9c(int a, int b);

void func_ov002_02258384(void) {
    func_ov002_0227ab9c(*(int *)(data_ov002_022d016c + 0xD70),
        *(int *)(data_ov002_022d016c + 0xD74) + *(int *)(data_ov002_022d016c + 0xD78));
    *(int *)(data_ov002_022d016c + 0xD50) = 0;
}
