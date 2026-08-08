/* func_02061464: bounds-checked 2-byte big-endian append to a growable
 * buffer. Asserts if writing 2 more bytes would exceed capacity. */

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern char data_0210149c[];
extern char data_02101448[];

typedef struct {
    char *buf;   /* +0x0 */
    int   cap;   /* +0x4 */
    int   count; /* +0x8 */
} Obj02061464;

void func_02061464(Obj02061464 *self, int val) {
    if (self->count + 2 > self->cap) {
        func_020a6d54(data_0210149c, data_02101448, 0, 0x2e);
    }
    self->buf[self->count++] = (char)(val >> 8);
    self->buf[self->count++] = (char)val;
}
