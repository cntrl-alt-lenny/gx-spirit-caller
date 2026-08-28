/* func_02053e40: remove element b from an array-backed struct a,
 * range-check-asserting first, sliding the tail down via func_020a7294
 * when b isn't the last element, then decrementing the count.
 */

struct S02053eb4 {
    int count;    /* 0x0 */
    unsigned char pad_04[0x8 - 0x4];
    int elemSize;  /* 0x8 */
};

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern void *func_0205405c(struct S02053eb4 *s, int index);
extern void func_020a7294(void *dst, void *src, int n);
extern char data_020ffa24[];
extern char data_020ffa30[];

void func_02053e40(struct S02053eb4 *a, int b) {
    int countMinus1;
    void *p1;
    void *p2;

    if (b < 0 || b >= a->count) {
        func_020a6c60(data_020ffa30, data_020ffa24, 0, 0xc0);
    }

    countMinus1 = a->count - 1;
    if (b < countMinus1) {
        p1 = func_0205405c(a, b);
        p2 = func_0205405c(a, b + 1);
        func_020a7294(p1, p2, a->elemSize * (countMinus1 - b));
    }

    a->count = a->count - 1;
}
