; func_ov002_021ee44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ee44c
        .global func_ov002_021ee44c
        .arm
func_ov002_021ee44c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r1
    bmi .L_19c
    ldr r6, _LIT0
.L_148:
    ldr r0, [r6, #0x494]
    add r0, r0, r5
    mov r0, r0, lsl #0x19
    add r0, r6, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r1, [r0, #0x98]
    cmp r1, r4
    bge .L_18c
    cmp r5, #0x0
    beq .L_194
    sub r0, r5, #0x1
    sub r1, r4, r1
    bl func_ov002_021ee44c
    cmp r0, #0x0
    beq .L_194
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_18c:
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_194:
    subs r5, r5, #0x1
    bpl .L_148
.L_19c:
    cmp r4, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
