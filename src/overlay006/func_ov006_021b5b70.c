/* func_ov006_021b5b70: copy an 8-byte default-config pair from
 * data_ov006_0224f398 into locals, clear data_ov006_0224f38c's f0xc/
 * f0x10, then dispatch on the first word: 1 => configure+init a
 * resource; 2 => configure two params then init with the second word. */
extern void Copy32(void *a, void *b, int n);
extern int data_ov006_0224f398[2];
extern char data_ov006_0225e068[];
extern int data_ov006_0224f38c[];
extern void func_ov006_021ca264(void *a, int b, int c);
extern int func_02008888(void);
extern void func_ov006_021ca3e0(void *a, int b, int c);
extern void func_ov006_021ca3f0(void *a, int b, int c);

int func_ov006_021b5b70(void) {
    int local_buf[2];
    char *slot = data_ov006_0225e068;
    int *buf = local_buf;
    Copy32(data_ov006_0224f398, buf, 8);
    data_ov006_0224f38c[3] = 0;
    data_ov006_0224f38c[4] = 0;
    switch (buf[0]) {
    case 0:
        break;
    case 1:
        func_ov006_021ca264(slot, 0x19, 0);
        data_ov006_0224f38c[5] = func_02008888();
        break;
    case 2:
        func_ov006_021ca3e0(slot, 2, 1);
        func_ov006_021ca3f0(slot, 0xb, 2);
        func_ov006_021ca264(slot, buf[1], 0);
        break;
    }
    return 1;
}
