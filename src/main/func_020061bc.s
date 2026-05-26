; func_020061bc — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_020061bc
        .arm
func_020061bc:
    ldr r1, .L_02006218
    mov r2, #0x10000
    and r3, r0, r1
    and r1, r0, r1, lsr #0x1
    ldr r0, .L_0200621c
    add r1, r1, r3, lsr #0x1
    and r3, r1, r0
    and r1, r1, r0, lsr #0x2
    ldr r0, .L_02006220
    add r1, r1, r3, lsr #0x2
    and r3, r1, r0
    and r1, r1, r0, lsr #0x4
    ldr r0, .L_02006224
    add r3, r1, r3, lsr #0x4
    and r1, r3, r0
    and r0, r3, r0, lsr #0x8
    add r1, r0, r1, lsr #0x8
    rsb r2, r2, #0x0
    mov r0, r1, lsl #0x10
    and r1, r1, r2
    mov r0, r0, lsr #0x10
    add r0, r0, r1, lsr #0x10
    bx lr
.L_02006218:
        .word   0xaaaaaaaa
.L_0200621c:
        .word   0xcccccccc
.L_02006220:
        .word   0xf0f0f0f0
.L_02006224:
        .word   0xff00ff00
