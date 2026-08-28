extern int func_020aaf60(void *self, void *key, int len);
extern int func_02060a60(void *self, int offset);
extern int func_020609c8(void *self, int offset);
extern int func_020608e4(void *self, int offset);
extern int func_02060840(void *self, int offset);

extern char data_0210129c[];
extern char data_021012a8[];
extern char data_021012b4[];
extern char data_021012c0[];

int func_0206073c(char *self, int offset) {
    self[offset] = 0;

    if (func_020aaf60(self, data_0210129c, 8) == 0) {
        return func_02060a60(self, offset);
    }
    if (func_020aaf60(self, data_021012a8, 9) == 0) {
        return func_020609c8(self, offset);
    }
    if (func_020aaf60(self, data_021012a8, 9) == 0) {
        return func_020609c8(self, offset);
    }
    if (func_020aaf60(self, data_021012b4, 8) == 0) {
        return func_020608e4(self, offset);
    }
    {
        int r = func_020aaf60(self, data_021012c0, 8);
        if (r != 0) {
            return r;
        }
    }
    return func_02060840(self, offset);
}
