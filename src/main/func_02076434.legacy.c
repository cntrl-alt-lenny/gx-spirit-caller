/* func_02076434: pick a 4-byte tag (data_02101f18 vs data_02101f20)
 * based on a[0x454]==c, splice it + a's own leading 0x30 bytes + a
 * zero-filled staging buffer into a+0x3a4, hand off to func_02077e58,
 * finalize via func_02077f8c, then repeat the splice with a different
 * fill byte plus b's own bytes before a second func_02077e58 call.
 */

extern void func_02077ecc(void *dst, const void *src, int len);
extern void func_020945f4(void *ptr, int val, int count);
extern void func_02077e58(char *a, char *b);
extern void func_02077f8c(unsigned int *self);
extern char data_02101f18[];
extern char data_02101f20[];

void func_02076434(char *a, char *b, int c) {
    char *sub = a + 0x3a4;
    char localBuf[0x30];

    if (((unsigned char)a[0x454] ^ c) != 0) {
        func_02077ecc(sub, data_02101f18, 4);
    } else {
        func_02077ecc(sub, data_02101f20, 4);
    }

    func_02077ecc(sub, a, 0x30);
    func_020945f4(localBuf, 0x36, 0x30);
    func_02077ecc(sub, localBuf, 0x30);
    func_02077e58(sub, b);
    func_02077f8c((unsigned int *)sub);

    func_02077ecc(sub, a, 0x30);
    func_020945f4(localBuf, 0x5c, 0x30);
    func_02077ecc(sub, localBuf, 0x30);
    func_02077ecc(sub, b, 0x10);
    func_02077e58(sub, b);
}
