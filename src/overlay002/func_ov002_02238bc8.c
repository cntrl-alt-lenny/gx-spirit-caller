/* func_ov002_02238bc8: require 021bb91c(0x1A77), then forward to 02211b64. */
extern int func_ov002_021bb91c(int code);
extern int func_ov002_02211b64(void *arg0, int arg1);

int func_ov002_02238bc8(void *arg0, int arg1) {
    if (func_ov002_021bb91c(0x1A77) == 0)
        return 0;
    return func_ov002_02211b64(arg0, arg1);
}
