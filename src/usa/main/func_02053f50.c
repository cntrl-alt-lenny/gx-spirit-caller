/* func_02053f50: insert val into arr at idx, shifting later elements up.
 * Asserts 0 <= idx <= arr->count. Grows the array if count==cap. Shifts
 * [idx, count) up by one slot via func_020a7294 (memmove-like) before
 * storing val at idx via func_02054218. */
extern char data_020ffa24[];
extern char data_020ffa5c[];
extern void  func_020a6c60(char *file, char *expr, int zero, int line);
extern void *func_0205405c(void *arr, int idx);
extern void  func_02054218(void *arr, void *val, int idx);
extern void  func_02054244(void *arr);                    /* grow */
extern void  func_020a7294(void *dst, void *src, int n);  /* memmove */

typedef struct {
    volatile int count;  /* +0x00 */
    int cap;             /* +0x04 */
    int elemsize;        /* +0x08 */
} Arr02053fc4;

void func_02053f50(Arr02053fc4 *arr, void *val, int idx)
{
    int last;
    void *dst;

    if (!(idx >= 0 && idx <= arr->count)) {
        func_020a6c60(data_020ffa5c, data_020ffa24, 0, 0xa7);
    }

    if (arr->count == arr->cap) {
        func_02054244(arr);
    }

    arr->count++;
    last = arr->count - 1;
    if (idx < last) {
        dst = func_0205405c(arr, idx + 1);
        func_020a7294(dst, func_0205405c(arr, idx),
                      arr->elemsize * (last - idx));
    }
    func_02054218(arr, val, idx);
}
