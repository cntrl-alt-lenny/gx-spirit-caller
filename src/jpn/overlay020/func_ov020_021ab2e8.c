/* func_ov020_021ab2e8: clear four 0x32-byte rows (stride 0x40) at the per-idx
 * tile slot base + ((idx*5+4)*32+5)*2.
 *
 *     mov   r4, r1
 *     bl    func_0208e0e4
 *     add r1,r4,r4,lsl#2; add r1,#4; lsl#5; add r1,#5; add r6,r0,r1,lsl#1
 *     mov r7,#0; mov r5,r7; mov r4,#0x32
 *  .loop: mov r0,r5; mov r1,r6; mov r2,r4; bl func_02094398
 *     add r7,#1; cmp r7,#4; add r6,#0x40; blt .loop
 */

extern int func_0208e0e4(void);
extern void func_02094398(int val, void *dest, unsigned int size);

void func_ov020_021ab2e8(int page, int idx) {
    char *p = (char *)(func_0208e0e4() + ((idx * 5 + 4) * 32 + 5) * 2);
    int i;
    for (i = 0; i < 4; i++) {
        func_02094398(0, p, 0x32);
        p += 0x40;
    }
}
