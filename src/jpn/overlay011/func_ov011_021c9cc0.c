/* func_ov011_021c9cc0: mirror SystemWork bit12 of word 0x900 into bit16 of the
 * ov000 021c75c4.unk278 flag, then run 021ad3e8. */
#include "ov011_core.h"
extern char data_ov000_021c74e4[];
extern unsigned int *GetSystemWork(void);
extern void func_ov000_021ad308(void);
void func_ov011_021c9cc0(void) {
    *(int *)(data_ov000_021c74e4 + 0x278) =
        (*(int *)(data_ov000_021c74e4 + 0x278) & ~0x10000)
        | ((unsigned int)(((unsigned int)(*(int *)((char *)GetSystemWork() + 0x900) << 0x13) >> 0x1F) << 0x1F) >> 0xF);
    func_ov000_021ad308();
}
