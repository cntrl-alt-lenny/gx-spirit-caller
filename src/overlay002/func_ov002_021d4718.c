#include "ov002_core.h"
extern char data_ov002_022cd490[];
extern int func_ov002_0229ade0(int a, int b, int c, int d);

void func_ov002_021d4718(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) != 0;
    int i;
    char *p = data_ov002_022cd3f4;
    for (i = 0; i < 2; i++, p += 0x14) {
        if (flag == *(int *)(p + 0xa8)) {
            *(int *)(data_ov002_022cd490 + i * 20) = 0;
            goto done;
        }
    }
done:
    func_ov002_0229ade0(15, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
