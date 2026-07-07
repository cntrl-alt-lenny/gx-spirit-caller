; func_ov002_022a8318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d19bc
        .extern func_ov002_022591b4
        .extern func_ov002_022ae5dc
        .global func_ov002_022a8318
        .arm
func_ov002_022a8318:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022591b4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1bc
    b .L_1bc
    b .L_1bc
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
.L_1b4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1bc:
    add r0, r4, #0x500
    ldrh r3, [r0, #0x90]
    mov r0, r3, lsl #0x1a
    mov r2, r0, lsr #0x1b
    cmp r2, #0xa
    bhi .L_1f0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x588]
    mov r0, r0, lsr r2
    and r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_1f0:
    cmp r2, #0xb
    bne .L_22c
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r4
    add r2, r4, r1, lsl #0x2
    ldr r0, [r0, #0x488]
    mov r1, r3, lsl #0x12
    rsb r0, r0, r1, lsr #0x18
    ldr r1, [r2, #0x588]
    add r0, r0, #0x10
    mov r0, r1, lsr r0
    and r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_22c:
    ldr r0, _LIT0
    mov r1, r3, lsl #0x1f
    ldr r0, [r0, #0x4]
    cmp r0, r1, lsr #0x1f
    cmpeq r2, #0xd
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    bl func_ov002_022ae5dc
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022d19bc
