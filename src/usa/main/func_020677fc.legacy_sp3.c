extern unsigned char func_02067844(void *obj, unsigned char val);

void func_020677fc(void *obj, unsigned char *buf, int count) {
    int i;
    for (i = 0; i < count; i++) {
        buf[i] = func_02067844(obj, buf[i]);
    }
}
