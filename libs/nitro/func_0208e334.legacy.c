/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/GX_g2.c
 *   function: G2x_SetBGyAffine_
 *   target:   func_0208e334 (0x0208e334, size 0xb4)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/fx_mtx.h>
#include <nitro/types.h>
void func_0208e334(u32 ptr, const struct Mtx22 *mtx, fx32 a, fx32 b, fx32 c, fx32 d){
    fx32 temp0, temp1, temp2, temp3;
    *((vu32 *)ptr + 0) = (u32)((u16)(fx16)(mtx->_[0] >> 4) | (u16)(fx16)(mtx->_[1] >> 4)<< 0x10);
    *((vu32 *)ptr + 1) = (u32)((u16)(fx16)(mtx->_[2] >> 4) | (u16)(fx16)(mtx->_[3] >> 4)<< 0x10);
    temp0 = c - a;
    temp1 = d - b;
    temp2 = mtx->_[0] * temp0 + mtx->_[1] * temp1 + (a << 0xC);
    temp3 = mtx->_[2] * temp0 + mtx->_[3] * temp1 + (b << 0xC);
    *((vu32 *)ptr + 2) = (u32)(temp2 >> 4);
    *((vu32 *)ptr + 3) = (u32)(temp3 >> 4);
}
