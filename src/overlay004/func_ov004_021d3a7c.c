#include <nitro/types.h>
extern int func_ov004_021c9d60(int a, int b);
extern int func_0202c0c0(int id);
extern s32 OS_SNPrintf(s8 *buffer, s32 bufsz, const s8 *format, ...);
extern const s8 data_ov004_02209f74[];
extern const s8 data_ov004_02209f80[];

void func_ov004_021d3a7c(s8 *dst, int n, int value, int a, int b, int fallback)
{
    int text = func_ov004_021c9d60(a, b);
    if (value < 0) value = -value;
    if (text != 0) {
        if (value >= 10000) {
            dst[OS_SNPrintf(dst, n - 1, data_ov004_02209f74, text, value)] = 0;
            return;
        }
        dst[OS_SNPrintf(dst, n - 1, data_ov004_02209f80, text)] = 0;
        return;
    }
    if (fallback == 0) fallback = func_0202c0c0(0x64d);
    if (fallback == 0) return;
    if (value >= 10000) {
        dst[OS_SNPrintf(dst, n - 1, data_ov004_02209f74, fallback, value)] = 0;
        return;
    }
    dst[OS_SNPrintf(dst, n - 1, data_ov004_02209f80, fallback)] = 0;
}
