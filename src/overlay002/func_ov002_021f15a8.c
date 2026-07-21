/* func_ov002_021f15a8: Guard chain over table/bitfield checks; final result is func_ov002_021c1ef0(...) != 0.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_021c1ef0(void);
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];

asm void func_ov002_021f15a8(void) {
    nofralloc
    stmdb sp!, {r3, lr}
    ldr r3, =0x00000868
    and lr, r1, #1
    mov ip, #20
    mul r3, lr, r3
    ldr lr, =data_ov002_022cf16c
    mul ip, r2, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #48]
    mov lr, lr, lsl #19
    movs lr, lr, lsr #19
    moveq   r0, #0
    ldmeqia sp!, {r3, pc}
    ldrh    lr, [r0, #2]
    mov lr, lr, lsl #31
    cmp r1, lr, lsr #31
    moveq   r0, #0
    ldmeqia sp!, {r3, pc}
    ldr lr, =data_ov002_022cf1a4
    add r3, lr, r3
    ldrh    r3, [ip, r3]
    cmp r3, #0
    movne   r0, #0
    ldmneia sp!, {r3, pc}
    bl  func_ov002_021c1ef0
    cmp r0, #0
    movne   r0, #1
    moveq   r0, #0
    ldmia sp!, {r3, pc}
}
