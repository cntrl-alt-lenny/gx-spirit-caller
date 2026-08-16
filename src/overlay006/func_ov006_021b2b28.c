/* func_ov006_021b2b28: zero a state buffer, pick a sub-buffer pointer,
 * conditionally log, then push two settings updates and mark a status
 * field.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02001ba4
 *     ldr   r1, .L_LIT0            ; data_ov006_021cf158
 *     mov   r0, #0x0
 *     mov   r2, #0x1c
 *     bl    Fill32
 *     ...
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    int field_0;
    unsigned int bits : 3;
} S_02104f4c_t;

typedef struct {
    int field_0;
    char _pad_4[0x14 - 4];
    int field_14;
} S_021cf140_t;

extern void func_02001ba4(void);
extern void Fill32(int v, void *dst, int size);
extern S_021cf140_t data_ov006_021cf140;
extern char data_ov006_021cf158[0x1c];
extern char data_ov006_0224f448[];
extern char *func_ov006_021b6be0(char *base, int sel, int idx);
extern S_02104f4c_t data_02104f4c;
extern void func_020a978c(void *a, void *b);
extern int func_ov005_021ad018(int a, int b);
extern char data_ov006_021cf1b0[];
extern int func_ov005_021ad030(int a, int b);

int func_ov006_021b2b28(void) {
    char *ptr;

    func_02001ba4();
    Fill32(0, data_ov006_021cf158, 0x1c);

    ptr = func_ov006_021b6be0(data_ov006_0224f448, 0, data_ov006_021cf140.field_14);

    if (((*(unsigned char *)ptr == 0) ^ (data_02104f4c.bits == 0)) == 0) {
        func_020a978c(data_ov006_021cf158, ptr + 1);
    }

    func_ov005_021ad018((int)data_ov006_021cf158, 2);
    func_ov005_021ad030((int)data_ov006_021cf1b0, 0x80000);
    data_ov006_021cf140.field_0 = 0xd;

    return 1;
}
