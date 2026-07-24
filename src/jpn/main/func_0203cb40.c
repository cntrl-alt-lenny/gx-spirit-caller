extern int func_0203c838(void);
extern unsigned char *data_0219d8e8;

int func_0203cb40(void) {
    int result = 0xff;
    unsigned int r = func_0203c838();
    if (r >= 10 && r <= 16) {
        result = data_0219d8e8[0x17];
    }
    return result;
}
