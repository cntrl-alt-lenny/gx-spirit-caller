/* func_ov011_021ccf84: rebuild the arg0 status panel — refresh the live cell
 * (if 4000.198 set) then push the 3138[arg0-1] layout config via 0201ef90. */
#include "ov011_core.h"
extern void func_0201eee8(int a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f,
                          void *g, int h, int i, void *j);
extern char data_ov011_021d3048[];
void func_ov011_021ccf84(int arg0) {
    char *s = data_ov011_021d3f5c;
    if (*(int *)(data_ov011_021d3f20 + 0x198) != 0)
        func_0201eee8(*(int *)(s + 0xBC), s + 0x118, s + 0x15C);
    func_0201e78c();
    func_0201ef3c(s + 0xBC, s + 0xD0, s + 0x118, 26624,
                  224, 1, data_ov011_021d3048 + (arg0 - 1) * 16, 0, 128, s + 0x15C);
}
