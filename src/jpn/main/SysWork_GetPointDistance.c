/* SysWork_GetPointDistance: 2D distance between two points in the system-work block —
 * FX_Sqrt(dx*dx + dy*dy) in NitroSDK Q12 fixed point.
 *
 * Cracked from .s (brief 457, peer-corpus idiom mining): the inline
 *   smull rL,rH,a,a; adds rL,#0x800; adc rH,#0; lsr rL,#0xc;
 *   orr rL,rL,rH,lsl#0x14
 * sequence IS the NitroSDK `FX_Mul` macro, confirmed verbatim from the
 * bit-identical compiler (RushRE/SonicRushAdventure-Decomp, mwccarm 2.0/sp1p5):
 *   FX_Mul(v1,v2) = (fx32)(((s64)(v1)*(v2) + 0x800LL) >> 12)   [FX32_SHIFT=12]
 * func_0208be54 is FX_Sqrt(fx32). Operand-identical to baserom.
 */

typedef signed int s32;
typedef signed long long s64;
typedef s32 fx32;

#define FX_Mul(v1, v2) (fx32)(((s64)(v1) * (v2) + 0x800LL) >> 12)

extern char *GetSystemWork(void);
extern fx32 func_0208be54(fx32 x);   /* FX_Sqrt */

fx32 SysWork_GetPointDistance(void) {
    char *p = GetSystemWork();
    fx32 dy = *(fx32 *)(p + 0x914) - *(fx32 *)(p + 0x90c);
    fx32 dx = *(fx32 *)(p + 0x910) - *(fx32 *)(p + 0x908);
    return func_0208be54(FX_Mul(dx, dx) + FX_Mul(dy, dy));
}
