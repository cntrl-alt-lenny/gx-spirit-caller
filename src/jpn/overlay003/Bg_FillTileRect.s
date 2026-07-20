; Bg_FillTileRect — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global Bg_FillTileRect
        .arm
Bg_FillTileRect:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r7, [sp, #0x18]
    mov r5, #0x0
    cmp r7, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, [sp, #0x1c]
    mov lr, r5
.L_2a2c:
    mov r6, lr
    cmp r3, #0x0
    ble .L_2a5c
.L_2a38:
    add r0, r2, #0x1
    mov ip, r6, lsl #0x1
    orr r2, r2, r4, lsl #0xc
    mov r0, r0, lsl #0x10
    add r6, r6, #0x1
    strh r2, [r1, ip]
    cmp r6, r3
    mov r2, r0, lsr #0x10
    blt .L_2a38
.L_2a5c:
    add r5, r5, #0x1
    cmp r5, r7
    add r1, r1, #0x40
    blt .L_2a2c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
