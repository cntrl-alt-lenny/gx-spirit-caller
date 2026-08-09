extern unsigned char func_020678b8(void *obj, unsigned char val);

void func_02067870(void *obj, unsigned char *buf, int count) {
    int i;
    for (i = 0; i < count; i++) {
        buf[i] = func_020678b8(obj, buf[i]);
    }
}
