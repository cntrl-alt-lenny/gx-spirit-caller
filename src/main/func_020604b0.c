extern char data_02101244;
extern char data_02101338;
extern char data_02101348;
extern void func_020a6d54(void *file, void *msg, int zero, int line);
extern void func_020aaec0(void *dst, void *src, int n);

void func_020604b0(char *dst, char *src, int n) {
    if (dst == 0) {
        func_020a6d54(&data_02101338, &data_02101244, 0, 0x2f);
    }
    if (src == 0) {
        func_020a6d54(&data_02101348, &data_02101244, 0, 0x30);
    }
    func_020aaec0(dst, src, n);
    {
        char *end = dst + n;
        end[-1] = 0;
    }
}
