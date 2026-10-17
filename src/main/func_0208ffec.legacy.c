extern int data_0210249c;
extern void func_02093fb8(int ch, void *src, int dst, unsigned int n);
extern void func_020944a4(void *src, int dst, unsigned int n);

void func_0208ffec(void *src, int off, unsigned int n)
{
    if (data_0210249c != -1 && n > 0x1c) {
        func_02093fb8(data_0210249c, src, off + 0x05000000, n);
        return;
    }
    func_020944a4(src, off + 0x05000000, n);
}
