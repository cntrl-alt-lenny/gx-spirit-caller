/* func_ov010_021b4144: bind arg0 to the 8bb4[arg1] template (020a6afc) and the
 * 8c14 layout (020a6a28), then stamp its glyph byte from 8900[profile-nibble]. */
#include "ov010_core.h"
extern char data_ov010_021b8bb4[];
extern char data_ov010_021b8c14[];
extern char data_ov010_021b8900[];
extern char data_02104f4c[];
extern void func_020a6afc(void *a, int b);
extern char *func_020a6a28(void *a, void *b);
void func_ov010_021b4144(void *arg0, int arg1) {
    char *p;
    func_020a6afc(arg0, *(int *)(data_ov010_021b8bb4 + arg1 * 4));
    p = func_020a6a28(arg0, data_ov010_021b8c14);
    *p = *(signed char *)(data_ov010_021b8900 + ((unsigned int)(*(int *)(data_02104f4c + 4) << 29) >> 29));
}
