#include <nitro/fx_mtx.h>
#include <nitro/types.h>

typedef struct {
    u8 _pad[0xec];
    fx32 x;
    fx32 y;
    fx32 z;
} Scale_021a18b8;

extern Scale_021a18b8 data_021a18b8;
extern MtxFx33 data_021a1974;
extern MtxFx43 data_021a19e8;
extern int data_021a1904;
extern int data_021a1a18;

extern void func_0208b32c(MtxFx33 *a, int *b, MtxFx43 *c);
extern void MTX_ScaleApply43(MtxFx43 *src, MtxFx43 *dst, fx32 x, fx32 y, fx32 z);
extern void func_0208b54c(MtxFx43 *a, int *b);

void func_02082138(void)
{
    func_0208b32c(&data_021a1974, &data_021a1904, &data_021a19e8);
    MTX_ScaleApply43(&data_021a19e8, &data_021a19e8, data_021a18b8.x, data_021a18b8.y, data_021a18b8.z);
    func_0208b54c(&data_021a19e8, &data_021a1a18);
}
