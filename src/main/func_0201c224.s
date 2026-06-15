; func_0201c224 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a84
        .extern func_02018cdc
        .extern func_02018f80
        .extern func_02018f90
        .extern func_02019a58
        .global func_0201c224
        .arm
func_0201c224:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r5, r0
    bl GetSystemWork
    mov r0, r4
    bl func_02019a58
    mov r1, #0x10000
    ldr r2, [r5, #0x18]
    rsb r1, r1, #0x0
    and r1, r2, r1
    mov r0, r0, lsl #0x10
    orr r2, r1, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    str r2, [r5, #0x18]
    bl func_02018a84
    cmp r4, #0x2f
    movne r7, #0x0
    bne .L_c4
    mov r0, r4
    bl func_02018cdc
    mov r7, r0
.L_c4:
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r1, r0
    mov r0, r6
    mov r2, r4
    add r3, r7, #0xa
    .word 0xeb065ba3
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
