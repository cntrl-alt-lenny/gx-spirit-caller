/* func_ov016_021b4204: if the record holds a live handle (unk38), release it and
 * clear the handle/flag pair; return 1. */
#include "ov016_core.h"
extern void func_0201ef3c(int a, void *b, void *c);
int func_ov016_021b4204(void *arg0) {
    char *p = arg0;
    if (*(int *)(p + 56) != 0) {
        func_0201ef3c(*(int *)(p + 36), p + 44, p + 56);
        *(int *)(p + 60) = 0;
        *(int *)(p + 56) = 0;
    }
    return 1;
}
