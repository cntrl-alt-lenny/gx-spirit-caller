/* func_ov004_021cc66c: snapshot the active record (0201d0b0) into src+? — copy
 * its 32-byte payload into r+80 and demote a type-6 entry to 2 when r's flag is
 * clear; if no active record, zero src. Returns whether a record was live. */
#include "ov004_core.h"
extern char *func_0201d05c(int a);
extern void Copy32(void *dst, void *src, int n);
extern void Fill32(unsigned int value, void *dest, int size_bytes);
int func_ov004_021cc66c(int arg0, void *src) {
    char *r = func_0201d05c(arg0);
    if (r != 0) {
        if (src != 0) {
            Copy32(r + 80, src, 32);
            if (*(int *)src == 6 && (*(unsigned char *)(r + 75) & 1) == 0)
                *(int *)src = 2;
        }
        return 1;
    }
    if (src != 0) Fill32(0, src, 32);
    return 0;
}
