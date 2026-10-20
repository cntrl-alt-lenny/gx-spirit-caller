#include <nitro/types.h>
typedef struct { u8 pad[0x18]; int history[2]; } State;
void func_0208ac90(s16 *a, s16 *b, u32 size, State *state)
{
    s16 saved[2];
    int count = size >> 1;
    int i;
    s16 *p, *q;

    for (i = 0; i < 2; i++) {
        s16 *pa = a + count + i;
        s16 *pb = b + count + i;
        int v = pa[-2] - pb[-2];
        if (v < -32768) v = -32768;
        else if (v > 32767) v = 32767;
        saved[i] = v;
    }
    p = a + (count - 1);
    q = b + (count - 1);
    while (p >= a + 2) {
        int d = p[-2] - q[-2];
        int x = *p + d;
        int y = *q - d;
        if (d >= 0) {
            if (x < 32767) *p = x; else *p = 32767;
            if (y > -32768) *q = y; else *q = -32768;
        } else {
            if (x > -32768) *p = x; else *p = -32768;
            if (y < 32767) *q = y; else *q = 32767;
        }
        p--;
        q--;
    }
    for (i = 1; i >= 0; i--) {
        int v = a[i] + state->history[i];
        if (v < -32768) v = -32768;
        else if (v > 32767) v = 32767;
        a[i] = v;
        v = b[i] - state->history[i];
        if (v < -32768) v = -32768;
        else if (v > 32767) v = 32767;
        b[i] = v;
    }
    for (i = 0; i < 2; i++) state->history[i] = saved[i];
}



