/* func_ov011_021cd048: rebuild the arg0 status panel — refresh the live cell
 * (if 4000.198 set) then push the 3138[arg0-1] layout config via 0201ef90. */
#include "ov011_core.h"
extern void func_0201ef3c(int a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f,
                          void *g, int h, int i, void *j);
extern char data_ov011_021d3138[];
void func_ov011_021cd048(int arg0) {
    char *s = data_ov011_021d403c;
    if (*(int *)(data_ov011_021d4000 + 0x198) != 0)
        func_0201ef3c(*(int *)(s + 0xBC), s + 0x118, s + 0x15C);
    func_0201e7e0();
    func_0201ef90(s + 0xBC, s + 0xD0, s + 0x118, 26624,
                  224, 1, data_ov011_021d3138 + (arg0 - 1) * 16, 0, 128, s + 0x15C);
}
