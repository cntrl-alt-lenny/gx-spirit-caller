/* func_ov020_021aaf8c: clear eighteen 0x36-byte rows (stride 0x40) starting at
 * buffer+0x106 (sibling of 021aae0c).
 *
 *     bl    func_0208e118
 *     add   r0, r0, #0x6
 *     mov   r7, #0x0
 *     add   r6, r0, #0x100
 *     mov   r5, r7 ; mov r4, #0x36
 *  .loop: mov r0,r5; mov r1,r6; mov r2,r4; bl func_02094398
 *     add r7,#1; cmp r7,#0x12; add r6,#0x40; blt .loop
 */

extern void *func_0208e118(void);
extern void func_02094398(int val, void *dest, unsigned int size);

void func_ov020_021aaf8c(void) {
    char *p = (char *)func_0208e118() + 6 + 0x100;
    int i;
    for (i = 0; i < 0x12; i++) {
        func_02094398(0, p, 0x36);
        p += 0x40;
    }
}
