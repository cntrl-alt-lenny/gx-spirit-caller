; func_ov002_021b86f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223def4
        .global func_ov002_021b86f4
        .arm
func_ov002_021b86f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6]
    ldr r2, _LIT0
    mov r5, r1
    cmp r0, r2
    bgt .L_64
    bge .L_ac
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_40
    bge .L_ac
    sub r1, r2, #0x150
    cmp r0, r1
    beq .L_a4
    b .L_f0
.L_40:
    add r1, r2, #0xb
    cmp r0, r1
    bgt .L_54
    beq .L_ac
    b .L_f0
.L_54:
    add r1, r2, #0x36
    cmp r0, r1
    beq .L_a4
    b .L_f0
.L_64:
    add r1, r2, #0xa9
    cmp r0, r1
    bgt .L_84
    bge .L_a4
    add r1, r2, #0x7c
    cmp r0, r1
    beq .L_ac
    b .L_f0
.L_84:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_98
    beq .L_a4
    b .L_f0
.L_98:
    add r1, r1, #0xc0
    cmp r0, r1
    b .L_f0
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_ac:
    ldrh r0, [r6, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_f0
.L_c4:
    mov r0, r6
    mov r1, r4
    bl func_ov002_0223def4
    cmp r5, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_c4
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000016ab
_LIT1: .word 0x0000147e
_LIT2: .word 0x00001a30
