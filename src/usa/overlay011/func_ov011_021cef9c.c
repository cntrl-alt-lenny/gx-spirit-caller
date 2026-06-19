/* func_ov011_021cef9c: true if the primary 2AC mode-field is 2, or the
 * secondary 270 flag is clear. */
#include "ov011_core.h"
int func_ov011_021cef9c(void) {
    char *b = data_ov011_021d3f5c;
    if (((unsigned int)(*(int *)(data_ov011_021d3f20 + 0x2AC) << 0xC) >> 0x1E) == 2 ||
        ((unsigned int)(*(int *)(b + 0x270) << 0xE) >> 0x1F) == 0)
        return 1;
    return 0;
}
