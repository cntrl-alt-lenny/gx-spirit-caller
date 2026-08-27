/* func_02061464: bounds-checked 1-byte append to a growable buffer.
 * Asserts if count has already reached capacity. */

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern char data_021013e0[];
extern char data_02101368[];

typedef struct {
    char *buf;   /* +0x0 */
    int   cap;   /* +0x4 */
    int   count; /* +0x8 */
} Obj020614d8;

void func_02061464(Obj020614d8 *self, int val) {
    if (self->count >= self->cap) {
        func_020a6c60(data_021013e0, data_02101368, 0, 0x23);
    }
    self->buf[self->count++] = (char)val;
}
