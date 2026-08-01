extern int func_020ab054(void *self, void *key, int len);
extern int func_02060ad4(void *self, int offset);
extern int func_02060a3c(void *self, int offset);
extern int func_02060958(void *self, int offset);
extern int func_020608b4(void *self, int offset);

extern char data_0210137c[];
extern char data_02101388[];
extern char data_02101394[];
extern char data_021013a0[];

int func_020607b0(char *self, int offset) {
    self[offset] = 0;

    if (func_020ab054(self, data_0210137c, 8) == 0) {
        return func_02060ad4(self, offset);
    }
    if (func_020ab054(self, data_02101388, 9) == 0) {
        return func_02060a3c(self, offset);
    }
    if (func_020ab054(self, data_02101388, 9) == 0) {
        return func_02060a3c(self, offset);
    }
    if (func_020ab054(self, data_02101394, 8) == 0) {
        return func_02060958(self, offset);
    }
    {
        int r = func_020ab054(self, data_021013a0, 8);
        if (r != 0) {
            return r;
        }
    }
    return func_020608b4(self, offset);
}
