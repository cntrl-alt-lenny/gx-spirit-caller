/* func_02053fc4: insert val into arr at idx, shifting later elements up.
 * Asserts 0 <= idx <= arr->count. Grows the array if count==cap. Shifts
 * [idx, count) up by one slot via func_020a7388 (memmove-like) before
 * storing val at idx via func_0205428c. */
extern char data_020ffb04[];
extern char data_020ffb3c[];
extern void  func_020a6d54(char *file, char *expr, int zero, int line);
extern void *func_020540d0(void *arr, int idx);
extern void  func_0205428c(void *arr, void *val, int idx);
extern void  func_020542b8(void *arr);                    /* grow */
extern void  func_020a7388(void *dst, void *src, int n);  /* memmove */

typedef struct {
    volatile int count;  /* +0x00 */
    int cap;             /* +0x04 */
    int elemsize;        /* +0x08 */
} Arr02053fc4;

void func_02053fc4(Arr02053fc4 *arr, void *val, int idx)
{
    int last;
    void *dst;

    if (!(idx >= 0 && idx <= arr->count)) {
        func_020a6d54(data_020ffb3c, data_020ffb04, 0, 0xa7);
    }

    if (arr->count == arr->cap) {
        func_020542b8(arr);
    }

    arr->count++;
    last = arr->count - 1;
    if (idx < last) {
        dst = func_020540d0(arr, idx + 1);
        func_020a7388(dst, func_020540d0(arr, idx),
                      arr->elemsize * (last - idx));
    }
    func_0205428c(arr, val, idx);
}
