; func_ov011_021d2008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .global func_ov011_021d2008
        .arm
func_ov011_021d2008:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r0, [r6]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    beq .L_28
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6]
.L_28:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_40
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6]
.L_40:
    mul r7, r5, r4
    mov r0, r7, lsl #0x2
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r6]
    str r7, [r6, #0x8]
    mov r0, #0x0
    str r0, [r6, #0x4]
    ldr r1, [r6]
    cmp r1, #0x0
    beq .L_84
    ldr r2, [r6, #0x8]
    mov r2, r2, lsl #0x2
    bl Fill32
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_84:
    ldr r1, [r6]
    cmp r1, #0x0
    beq .L_a8
    ldr r2, [r6, #0x8]
    mov r0, #0x0
    mov r2, r2, lsl #0x2
    bl Fill32
    mov r0, #0x0
    str r0, [r6, #0x4]
.L_a8:
    mov r1, #0x10000
    ldr r0, [r6, #0xc]
    rsb r1, r1, #0x0
    and r3, r0, r1
    mov r0, r3, lsl #0x10
    mov r2, r5, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r6, #0xc]
    ldr r2, [r6, #0x10]
    mov r0, r4, lsl #0x10
    and r1, r2, r1
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x10]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
