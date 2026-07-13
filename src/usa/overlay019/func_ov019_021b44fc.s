; func_ov019_021b44fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov019_021b44fc
        .arm
func_ov019_021b44fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, #0x0
    cmp r3, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r6, [sp, #0x18]
    mov r5, r7
.L_18:
    mov r8, r5
    cmp r2, #0x0
    ble .L_48
.L_24:
    add ip, r1, #0x1
    mov lr, r8, lsl #0x1
    orr r4, r1, r6, lsl #0xc
    mov r1, ip, lsl #0x10
    add r8, r8, #0x1
    strh r4, [r0, lr]
    cmp r8, r2
    mov r1, r1, lsr #0x10
    blt .L_24
.L_48:
    add r7, r7, #0x1
    cmp r7, r3
    add r0, r0, #0x40
    blt .L_18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
