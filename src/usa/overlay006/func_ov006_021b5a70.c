/* func_ov006_021b5a70: copy an 8-byte default-config pair from
 * data_ov006_0224f278 into locals, clear data_ov006_0224f26c's f0xc/
 * f0x10, then dispatch on the first word: 1 => configure+init a
 * resource; 2 => configure two params then init with the second word. */
extern void Copy32(void *a, void *b, int n);
extern int data_ov006_0224f278[2];
extern char data_ov006_0225df48[];
extern int data_ov006_0224f26c[];
extern void func_ov006_021ca158(void *a, int b, int c);
extern int func_0200886c(void);
extern void func_ov006_021ca2d4(void *a, int b, int c);
extern void func_ov006_021ca2e4(void *a, int b, int c);

int func_ov006_021b5a70(void) {
    int local_buf[2];
    char *slot = data_ov006_0225df48;
    int *buf = local_buf;
    Copy32(data_ov006_0224f278, buf, 8);
    data_ov006_0224f26c[3] = 0;
    data_ov006_0224f26c[4] = 0;
    switch (buf[0]) {
    case 0:
        break;
    case 1:
        func_ov006_021ca158(slot, 0x19, 0);
        data_ov006_0224f26c[5] = func_0200886c();
        break;
    case 2:
        func_ov006_021ca2d4(slot, 2, 1);
        func_ov006_021ca2e4(slot, 0xb, 2);
        func_ov006_021ca158(slot, buf[1], 0);
        break;
    }
    return 1;
}
