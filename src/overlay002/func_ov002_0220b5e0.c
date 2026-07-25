/* func_ov002_0220b5e0: t = func_ov002_021bd030(bit0 of *(u16*)(arg0+2));
 * if t<0 return 0. u = func_ov002_0223f6c4(arg0). v =
 * func_ov002_022536e8(bit0, *(u16*)arg0, u). Return (v!=0)?2:0.
 * Retry 2: use Ov002Self's b0 bitfield for bit0 (both call sites) instead
 * of manual `h&1` -- the orig already re-derives bit0 fresh after the
 * intervening call (can't survive a caller-saved register across it).
 */
#include "ov002_core.h"

extern int func_ov002_021bd030(int bit0);
extern int func_ov002_0223f6c4(void *self);
extern int func_ov002_022536e8(int bit0, int w, int u);

int func_ov002_0220b5e0(void *arg0) {
    struct Ov002Self *self = (struct Ov002Self *)arg0;
    int t;
    int u;
    unsigned short w;
    int v;

    t = func_ov002_021bd030(self->b0);
    if (t < 0) return 0;
    u = func_ov002_0223f6c4(arg0);
    w = *(unsigned short *)arg0;
    v = func_ov002_022536e8(self->b0, w, u);
    return (v != 0) ? 2 : 0;
}
