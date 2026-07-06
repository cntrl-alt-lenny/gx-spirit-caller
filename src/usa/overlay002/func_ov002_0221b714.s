; func_ov002_0221b714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0226ac6c
        .global func_ov002_0221b714
        .arm
func_ov002_0221b714:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_c8
    b .L_bc
    b .L_78
    b .L_38
    b .L_2c
.L_2c:
    bl func_ov002_021e2a4c
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_38:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_70
    mov r2, #0x0
    mov r3, r2
    mov r1, #0x1
    bl func_ov002_0226ac6c
.L_70:
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_78:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_b4
    mov r1, #0x1
    mov r3, r1
    mov r2, #0x0
    bl func_ov002_0226ac6c
.L_b4:
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_bc:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
