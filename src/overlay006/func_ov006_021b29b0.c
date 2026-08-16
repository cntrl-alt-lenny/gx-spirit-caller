/* func_ov006_021b29b0: init routine. Zero data_ov006_021cf158 (0x1c
 * bytes), fetch a slot pointer, and if the slot's first byte's
 * zero-ness matches data_02104f4c[1]'s low-3-bits zero-ness, notify
 * via func_020a978c. Then always kick off two sub-inits and set a
 * flag. */
extern void Fill32(unsigned int v, void *dst, unsigned int n);
extern void func_02001ba4(void);
extern int data_02104f4c[];
extern char data_ov006_021cf158[];
extern void func_020a978c(void *a, void *b);
extern char *func_ov006_021b6be0(void *a, int b, int c);
extern void func_ov005_021ad018(void *a, int b);
extern int data_ov006_021cf1b0[];
extern void func_ov005_021ad030(void *a, int b);
extern int data_ov006_021cf140[];
extern int data_ov006_0224f448[];

int func_ov006_021b29b0(void) {
    char *ptr;
    int cond1, cond2;

    func_02001ba4();
    Fill32(0, data_ov006_021cf158, 0x1c);
    ptr = func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
    cond1 = (*(unsigned char *)ptr == 0) ? 1 : 0;
    cond2 = ((int)((unsigned)(data_02104f4c[1] << 29) >> 29) == 0) ? 1 : 0;
    if ((cond1 ^ cond2) == 0) {
        func_020a978c(data_ov006_021cf158, ptr + 1);
    }
    func_ov005_021ad018(data_ov006_021cf158, 1);
    func_ov005_021ad030(data_ov006_021cf1b0, 0x80000);
    data_ov006_021cf140[0] = 0xa;
    return 1;
}
