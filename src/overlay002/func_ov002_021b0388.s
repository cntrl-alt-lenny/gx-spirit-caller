; func_ov002_021b0388 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf18c
        .extern data_ov002_022cf194
        .extern data_ov002_022d016c
        .extern func_ov002_021b025c
        .extern func_ov002_021b02f0
        .extern func_ov002_021b4054
        .extern func_ov002_021bbf50
        .global func_ov002_021b0388
        .arm
func_ov002_021b0388:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    rsb r2, r6, #0x1
    ldr r1, _LIT0
    and r2, r2, #0x1
    mul r5, r2, r1
    ldr r3, _LIT1
    ldr r2, [r3, r5]
    cmp r2, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, pc}
    and r2, r6, #0x1
    mul r4, r2, r1
    ldr r1, [r3, r4]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_ov002_021b025c
    cmp r0, #0x0
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_ov002_021b02f0
    cmp r0, #0x0
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r2, _LIT3
    ldr r0, [r0, #0xcec]
    mov r1, #0xb
    mov r3, #0x5
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_ac
    ldr r1, _LIT2
    mov r2, #0x1
    mov r0, r6
    str r2, [r1, #0xe0]
    bl func_ov002_021bbf50
    cmp r0, #0x0
    movgt r0, #0x6
    movle r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_ac:
    ldr r2, _LIT4
    mov r0, r6
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x7
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT5
    ldr r0, [r0, r4]
    cmp r0, #0x0
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r6, _LIT6
    ldr r3, [r6, r5]
    cmp r3, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r1, [r0, #0xcf4]
    ldr r2, [r0, #0xcf0]
    add r0, r1, #0x4
    cmp r2, r0
    bcc .L_11c
    ldr r0, [r6, r4]
    cmp r0, r3
    movgt r0, #0x9
    ldmgtia sp!, {r4, r5, r6, pc}
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf18c
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000151e
_LIT4: .word 0x0000169c
_LIT5: .word data_ov002_022cf194
_LIT6: .word data_ov002_022cf16c
