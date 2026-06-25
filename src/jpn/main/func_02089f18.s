; func_02089f18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088f3c
        .extern func_02089178
        .extern func_02089bf0
        .extern func_02089d10
        .global func_02089f18
        .arm
func_02089f18:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02089178
    cmp r0, #0x0
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, pc}
    ands r1, r6, #0x4
    beq .L_118
    ldrb r1, [r0, #0x3]
    ands r1, r1, #0x1
    beq .L_f0
    ldr r0, [r0]
    mov r1, r5
    mov r0, r0, lsl #0x8
    mov r2, r4
    mov r0, r0, lsr #0x8
    bl func_02089bf0
    b .L_108
.L_f0:
    ldr r0, [r0]
    mov r1, r5
    mov r0, r0, lsl #0x8
    mov r2, r4
    mov r0, r0, lsr #0x8
    bl func_02089d10
.L_108:
    cmp r0, #0x0
    bne .L_128
    mov r0, #0x9
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldr r0, [r0]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x8
    bl func_02088f3c
.L_128:
    ldr r1, [sp, #0x10]
    cmp r1, #0x0
    strne r0, [r1]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
