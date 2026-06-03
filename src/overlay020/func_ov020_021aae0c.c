/* func_ov020_021aae0c: clear three 0x38-byte rows (stride 0x40) starting at
 * buffer+0x44.
 *
 *     bl    func_0208e200
 *     mov   r7, #0x0
 *     add   r6, r0, #0x44
 *     mov   r5, r7 ; mov r4, #0x38
 *  .loop: mov r0,r5; mov r1,r6; mov r2,r4; bl func_0209448c
 *     add r7,#1; cmp r7,#3; add r6,#0x40; blt .loop
 */

extern void *func_0208e200(void);
extern void func_0209448c(int val, void *dest, unsigned int size);

void func_ov020_021aae0c(void) {
    char *p = (char *)func_0208e200() + 0x44;
    int i;
    for (i = 0; i < 3; i++) {
        func_0209448c(0, p, 0x38);
        p += 0x40;
    }
}
