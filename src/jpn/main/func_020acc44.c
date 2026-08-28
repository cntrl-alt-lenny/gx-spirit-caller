typedef struct {
    const char *cursor;
    int ungetFlag;
} CharSrc_t;

typedef int (*GetcFn)(void *a0, int a1, int a2);

extern int func_020ac378(int base, int limit, GetcFn fn, CharSrc_t *src,
                          int *consumed, int *negFlag, int *overflowFlag);
extern int func_020aaab8(void *a0, int a1, int a2);
extern int data_021aa380;

int func_020acc44(const char *str, char **endptr, int base) {
    int consumed;
    int negFlag;
    int overflowFlag;
    CharSrc_t src;
    int value;

    src.cursor = str;
    src.ungetFlag = 0;

    value = func_020ac378(base, 0x7fffffff, func_020aaab8, &src,
                           &consumed, &negFlag, &overflowFlag);

    if (endptr != 0) {
        *endptr = (char *)str + consumed;
    }

    if (overflowFlag != 0
        || (negFlag == 0 && (unsigned int)value > 0x7fffffff)
        || (negFlag != 0 && (unsigned int)value > 0x80000000)) {
        int result = negFlag != 0 ? (int)0x80000000 : 0x7fffffff;
        data_021aa380 = 0x22;
        return result;
    }

    return negFlag != 0 ? -value : value;
}
