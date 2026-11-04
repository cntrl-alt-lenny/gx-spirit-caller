#include <nitro/types.h>

typedef struct {
    const char *cursor;
    int ungetFlag;
} CharSrc_t;

typedef s32 (*GetcFn)(void *a0, s32 a1, s32 a2);
extern u32 func_020ac46c(int base, int limit, GetcFn fn, CharSrc_t *src,
                                int *consumed, int *negFlag, int *overflowFlag);
extern s32 func_020aabac(void *a0, s32 a1, s32 a2);
extern int data_021aa460;

u32 func_020acca0(const char *str, char **endptr, int base) {
    int consumed;
    int negFlag;
    int overflowFlag;
    CharSrc_t src;
    u32 value;

    src.cursor = str;
    src.ungetFlag = 0;
    value = func_020ac46c(base, 0x7fffffff, func_020aabac, &src,
                         &consumed, &negFlag, &overflowFlag);
    if (endptr != 0) {
        *endptr = (char *)str + consumed;
    }
    if (overflowFlag != 0) {
        value = 0xffffffffUL;
        data_021aa460 = 0x22;
    } else if (negFlag != 0) {
        value = -value;
    }
    return value;
}




