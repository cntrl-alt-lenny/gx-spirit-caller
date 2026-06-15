; func_020196d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5b80
        .extern func_02018b94
        .extern func_02018f80
        .global func_020196d8
        .arm
func_020196d8:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    bl func_02018b94
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r0, r0, #0x36
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_90
    b .L_54
    b .L_68
    b .L_40
    b .L_90
    b .L_90
    b .L_7c
.L_40:
    bl func_02018f80
    cmp r0, #0x2d
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, pc}
.L_54:
    bl func_02018f80
    cmp r0, #0x1b
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
.L_68:
    bl func_02018f80
    cmp r0, #0x1c
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
.L_7c:
    bl func_02018f80
    cmp r0, #0x21
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
.L_90:
    mov r4, #0x1
    bl func_02018b94
    ldr r1, [r0, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    rsb r1, r1, r1, lsl #0x3
    ldrsb r0, [r0, r1]
    cmp r0, #0x2
    beq .L_c8
    bl func_02018b94
    ldr r0, [r0, #0x10]
    tst r0, #0x200
    moveq r4, #0x0
.L_c8:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_020b5b80
