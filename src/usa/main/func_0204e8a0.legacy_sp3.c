/* func_0204e8a0: snprintf into a 0x200-byte stack buffer, append a
 * single byte + NUL, optionally append a caller string d, then hand
 * the buffer off to func_02055318.
 *
 *   n = OS_SNPrintf(buf, 0x200, data_020ff8f4, data_020ff8fc, 3, data_020ff904);
 *   buf[n] = (u8)b;  buf[n+1] = 0;
 *   if (d != 0) {
 *       len2 = strlen(d);
 *       func_02094688(d, buf+n+1, len2);   -- MI_CpuCopy8 order: (src, dst, n)
 *       buf[n+1+len2] = 0;
 *   }
 *   func_02055318(a, c, buf);
 */

extern int OS_SNPrintf(char *buffer, int bufsz, const char *format, ...);
extern int func_020aace8(const char *s);
extern void func_02094688(const void *src, void *dst, int n);
extern void func_02055318(void *a, void *c, char *buf);
extern char data_020ff8f4[];
extern char data_020ff8fc[];
extern char data_020ff904[];

void func_0204e8a0(void *a, int b, void *c, char *d) {
    char buf[0x200];
    char *buf1 = buf + 1;
    int n;
    char *appendPos;

    n = OS_SNPrintf(buf, 0x200, data_020ff8f4, data_020ff8fc, 3, data_020ff904);
    buf[n] = (unsigned char)b;
    buf1[n] = 0;
    appendPos = buf1 + n;

    if (d != 0) {
        int len2 = func_020aace8(d);
        func_02094688(d, appendPos, len2);
        appendPos[len2] = 0;
    }

    func_02055318(a, c, buf);
}
