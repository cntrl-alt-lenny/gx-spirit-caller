/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FS_file.c
 *   function: FS_Init
 *   target:   FS_Init (0x020983b8, size 0x3c)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/types.h>
extern int func_02098478();  // FSi_InitRom

extern int data_021a8318;  // is_init

void FS_Init(u32 default_dma_no)
{
    if (!data_021a8318)
    {
        data_021a8318 = TRUE;
        func_02098478(default_dma_no);
    }
}
