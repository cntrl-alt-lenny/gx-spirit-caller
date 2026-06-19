/* func_ov002_0223a78c: 3-guard chain; on full pass, arg-pack a kind-61 event with
 * two byte-packed payloads (always returns 0). */
#include "ov002_core.h"
extern int func_ov002_0223de48(void *a, int b, int c);
extern int func_ov002_02257564(void *a, int b, int c);
extern int func_ov002_021bc47c(int a, int b);
int func_ov002_0223a78c(struct Ov002Self *arg0) {
    int ret, b0, b1, c;
    if (func_ov002_0223de48(arg0, 0, 0) == 0) goto end;
    ret = func_ov002_0223dda4(arg0, 0);
    b0 = ret & 0xff;
    b1 = ((u16)ret >> 8) & 0xff;
    if (func_ov002_02257564(arg0, b0, b1) == 0) goto end;
    c = (*(u16 *)((char *)arg0 + 10) >> 8) & 0xff;
    if (func_ov002_021bc47c(arg0->b0, c) == 0) goto end;
    func_ov002_021d46ac((u16)((arg0->b0 ? 0x8000 : 0) | 61),
                        (u16)((u8)b0 | ((u8)b1 << 8)),
                        (u16)((u8)b0 | ((u8)c << 8)), 0);
end:
    return 0;
}
