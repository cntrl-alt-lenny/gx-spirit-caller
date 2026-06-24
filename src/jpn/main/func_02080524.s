; func_02080524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02080524
        .arm
func_02080524:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr ip, [sp, #0x1c]
    ldr r8, [sp, #0x18]
    mov ip, ip, lsl #0x1c
    mov r4, ip, lsr #0x10
    mov r6, #0x0
    cmp r2, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    mov lr, r3, lsl #0x1
    mov ip, r6
.L_28:
    mov r5, r0
    mov r7, ip
    cmp r1, #0x0
    ble .L_50
.L_38:
    orr r3, r4, r8
    add r7, r7, #0x1
    cmp r7, r1
    add r8, r8, #0x1
    strh r3, [r5], #0x2
    blt .L_38
.L_50:
    add r6, r6, #0x1
    cmp r6, r2
    add r0, r0, lr
    blt .L_28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
