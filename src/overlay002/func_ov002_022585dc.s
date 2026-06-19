; func_ov002_022585dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021d479c
        .global func_ov002_022585dc
        .arm
func_ov002_022585dc:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd68]
    cmp r1, #0x0
    beq .L_fc
    cmp r1, #0x1
    beq .L_144
    ldmia sp!, {r3, pc}
.L_fc:
    ldr r1, [r0, #0xcf0]
    add r1, r1, #0x1
    cmp r1, #0xa
    bcs .L_128
    ldr r0, [r0, #0xd6c]
    mov r1, #0x52
    bl func_ov002_021ae400
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, pc}
.L_128:
    mov r0, #0x6
    bl func_ov002_021ae484
    ldr r0, _LIT0
    ldr r1, [r0, #0xd68]
    add r1, r1, #0x1
    str r1, [r0, #0xd68]
    ldmia sp!, {r3, pc}
.L_144:
    ldr r1, [r0, #0xd44]
    cmp r1, #0x0
    beq .L_17c
    ldr r0, [r0, #0xd70]
    mov r2, #0x0
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x23
    mov r0, r0, lsl #0x10
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0xa
    bl func_ov002_021d479c
.L_17c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
