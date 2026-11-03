#include <nitro/types.h>

typedef struct {
    char _pad_18[0x18];
    void *field_18;
} Obj02068ab4;
extern int func_02068578(void *p);
extern int func_02068ab4(Obj02068ab4 *self, int b, int c);
extern int func_020aaf40(const u8 *a, const u8 *b);
/* The original supplies only r0, fewer arguments than the four-argument thunk. */
extern int func_020ace00();
extern u8 data_02101d5c[];
extern const unsigned short data_020c3754[];

int func_02068a20(Obj02068ab4 *self, const u8 *name, int fallback)
{
    int result;
    int c;
    if (func_020aaf40(name, data_02101d5c + 4) == 0) {
        return func_02068578(self);
    }
    result = func_02068ab4(self, (int)name, 0);
    if (result == 0 || (c = *(const u8 *)result, !(c < 0 || c >= 0x80 ? 0 : data_020c3754[c] & 8))) {
        return fallback;
    }
    return func_020ace00(result);
}
