/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX_mtx43.c
 *   function: MTX_ScaleApply43
 *   target:   func_0208b8e0 (0x0208b8e0, size 0x40)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/fx_mtx.h>
#include <nitro/types.h>
extern int func_0208b1e0();  // MTX_ScaleApply33

void func_0208b8e0(struct Mtx43 *mtx, struct Mtx43 *dst, fx32 x, fx32 y, fx32 z){
    //this works because matrices are indexed columns first
    func_0208b1e0((struct Mtx33 *)mtx, (struct Mtx33 *)dst, x, y, z);
    dst->_[9] = mtx->_[9];
    dst->_[10] = mtx->_[10];
    dst->_[11] = mtx->_[11];
}
