; func_02015190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019034
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02015190
        .arm
func_02015190:
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
    beq .L_1764
    cmp r0, #0x2
    beq .L_183c
    ldmia sp!, {r3, r4, r5, pc}
.L_1764:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1788
    b .L_182c
    b .L_1800
    b .L_17a4
.L_1788:
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    bcc .L_17a4
    mov r0, #0x2
    bl func_0201abb0
.L_17a4:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x2
    bl func_0201abd4
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_17ec
    mov r0, #0x1
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_17ec:
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1800:
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
.L_182c:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_183c:
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT4
    mov r0, #0x1
    str r1, [r5, #0x8]
    bl func_0201abb0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000f0100
_LIT1: .word 0x000f0101
_LIT2: .word 0x000f0102
_LIT3: .word 0x000f0103
_LIT4: .word 0x000f0200
