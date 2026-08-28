/* func_0207634c: pick a 4-byte tag (data_02101e38 vs data_02101e40)
 * based on a[0x454]==c, splice it + a's own leading 0x30 bytes + a
 * zero-filled staging buffer into a+0x3a4, hand off to func_02077d70,
 * finalize via func_02077ea4, then repeat the splice with a different
 * fill byte plus b's own bytes before a second func_02077d70 call.
 */

extern void func_02077de4(void *dst, const void *src, int len);
extern void func_02094500(void *ptr, int val, int count);
extern void func_02077d70(char *a, char *b);
extern void func_02077ea4(unsigned int *self);
extern char data_02101e38[];
extern char data_02101e40[];

void func_0207634c(char *a, char *b, int c) {
    char *sub = a + 0x3a4;
    char localBuf[0x30];

    if (((unsigned char)a[0x454] ^ c) != 0) {
        func_02077de4(sub, data_02101e38, 4);
    } else {
        func_02077de4(sub, data_02101e40, 4);
    }

    func_02077de4(sub, a, 0x30);
    func_02094500(localBuf, 0x36, 0x30);
    func_02077de4(sub, localBuf, 0x30);
    func_02077d70(sub, b);
    func_02077ea4((unsigned int *)sub);

    func_02077de4(sub, a, 0x30);
    func_02094500(localBuf, 0x5c, 0x30);
    func_02077de4(sub, localBuf, 0x30);
    func_02077de4(sub, b, 0x10);
    func_02077d70(sub, b);
}
