/* func_02092a34: write to NDS IPC region — `*(0x27ffda0 + idx*4) = v`.
 *
 *     mov r0, r0, lsl #2
 *     add r0, r0, #0x2700000
 *     add r0, r0, #0xff000     ; total: 0x27ff000 + idx*4
 *     str r1, [r0, #0xda0]
 */

void func_02092a34(unsigned int idx, unsigned int v) {
    *(volatile unsigned int *)(0x027ffda0 + idx * 4) = v;
}
