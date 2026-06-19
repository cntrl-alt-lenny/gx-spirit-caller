/* func_ov006_021c6af4: zero-fill ov006 data + clear obj[0x38], return 1. */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov006_0225dd94[];

int func_ov006_021c6af4(void *obj) {
    Fill32(0, data_ov006_0225dd94, 0x78);
    *(int *)((char *)obj + 0x38) = 0;
    return 1;
}
