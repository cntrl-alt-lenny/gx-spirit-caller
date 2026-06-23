; func_ov006_021c30c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdd0c
        .extern func_0202160c
        .extern func_0202165c
        .extern func_020221e0
        .global func_ov006_021c30c4
        .arm
func_ov006_021c30c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_1558
    mov r1, #0x4
    mov r2, #0x0
    bl func_0202160c
    mov r1, #0x0
    mov r2, #0x1
    bl func_0202165c
    ldr r0, [r4, #0x8]
    mov r1, #0x4
    mov r2, #0x1
    bl func_0202160c
    mov r1, #0x0
    mov r2, #0x1
    bl func_0202165c
.L_1558:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_157c
    mov r1, #0x4
    mov r2, #0x0
    bl func_0202160c
    mov r1, #0x0
    mov r2, #0x1
    bl func_0202165c
.L_157c:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_15dc
    mov r1, #0x4
    mov r2, #0x0
    bl func_0202160c
    ldr r2, [r4, #0x58]
    ldr r1, _LIT0
    mov r2, r2, lsl #0x2
    ldrsh r1, [r1, r2]
    cmp r1, #0x2
    bne .L_15c0
    ldr r1, [r4, #0x64]
    cmp r1, #0x0
    moveq r4, #0x0
    movne r4, #0x1
    b .L_15c4
.L_15c0:
    mov r4, #0x2
.L_15c4:
    ldr r2, _LIT1
    mov r1, #0x0
    bl func_0202165c
    mov r1, r4
    mov r0, #0x3
    bl func_020221e0
.L_15dc:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_021cdd0c
_LIT1: .word 0x00000801
