/* func_ov015_021b3718: copy src to dst (dst may be NULL for a
 * length-only pass) with two escapes: a high-bit (0x80) 2-byte glyph
 * pass-through when data_02104f4c.chan==0, and "^p" which expands to
 * data_02105989 via func_020a6afc; any other "^X" or plain byte copies
 * 1:1. Returns the total output length. */
struct Data104f4cChan {
    int w0;
    unsigned int chan : 3;
    unsigned int : 29;
};
extern struct Data104f4cChan data_02104f4c;
extern char data_02105989[];
extern int Strlen(const char *s);
extern void func_020a6afc(char *dst, const char *src);

int func_ov015_021b3718(char *dst, char *src) {
    int count = 0;
    signed char c = *src;

    while (c != 0) {
        if (data_02104f4c.chan == 0 && (c & 0x80)) {
            if (dst != 0) {
                dst[0] = c;
                dst[1] = src[1];
                dst += 2;
            }
            src += 2;
            count += 2;
        } else if (c == 0x5e) {
            if (src[1] == 0x70) {
                int len = Strlen(data_02105989);
                if (dst != 0) {
                    func_020a6afc(dst, data_02105989);
                    dst += len;
                }
                count += len;
                src += 2;
            } else {
                if (dst != 0)
                    *dst++ = c;
                src += 1;
                count += 1;
            }
        } else {
            if (dst != 0)
                *dst++ = c;
            src += 1;
            count += 1;
        }
        c = *src;
    }
    return count;
}
