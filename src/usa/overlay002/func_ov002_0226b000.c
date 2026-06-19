/* func_ov002_0226b000: pack (arg2, arg3) low bytes into one halfword and submit a
 * kind-14 request via func_0226acf8. */
#include "ov002_core.h"
extern void func_ov002_0226ac08(int a, int b, u16 c, u16 d);
void func_ov002_0226b000(int arg0, int arg1, int arg2, int arg3) {
    func_ov002_0226ac08(arg0, 14, arg1, (u8)arg2 | ((u8)arg3 << 8));
}
