extern void *func_020543b8(void *handle, int *outparam);

int func_0205d648(void **pp, int val, int *out) {
    void *p = *pp;
    int buf[8];
    buf[0] = val;
    void *handle = *(void **)((char *)p + 0x428);
    void *result = func_020543b8(handle, buf);
    if (out != 0) {
        *out = (int)result;
    }
    return result != 0;
}
