; func_02014b28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019034
        .extern func_020195ec
        .extern func_0201b7e0
        .global func_02014b28
        .arm
func_02014b28:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_1110
    cmp r0, #0x2
    beq .L_1158
    cmp r0, #0x3
    beq .L_1118
    ldmia sp!, {r3, r4, r5, pc}
.L_1110:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_1118:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1158:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldrne r0, _LIT2
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000b0100
_LIT1: .word 0x000b0102
_LIT2: .word 0x000b0101
