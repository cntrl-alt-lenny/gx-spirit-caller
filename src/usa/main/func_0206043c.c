extern char data_02101164;
extern char data_02101258;
extern char data_02101268;
extern void func_020a6c60(void *file, void *msg, int zero, int line);
extern void func_020aadcc(void *dst, void *src, int n);

void func_0206043c(char *dst, char *src, int n) {
    if (dst == 0) {
        func_020a6c60(&data_02101258, &data_02101164, 0, 0x2f);
    }
    if (src == 0) {
        func_020a6c60(&data_02101268, &data_02101164, 0, 0x30);
    }
    func_020aadcc(dst, src, n);
    {
        char *end = dst + n;
        end[-1] = 0;
    }
}
