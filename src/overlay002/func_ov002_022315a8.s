; func_ov002_022315a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021e276c
        .global func_ov002_022315a8
        .arm
func_ov002_022315a8:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0xc]
    cmp r1, #0x1
    beq .L_1c
    cmp r1, #0x2
    beq .L_68
    b .L_88
.L_1c:
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    mov r2, r2, lsl #0x1f
    ldr r1, [r1, #0xcec]
    mov r3, r2, lsr #0x1f
    cmp r3, r1
    movne r1, #0x1
    moveq r1, #0x0
    add r1, r1, #0x1
    and r1, r1, #0xff
    mov r1, r1, lsl #0x4
    orr r1, r1, #0x1
    mov r2, r1, lsl #0x10
    ldrh r1, [r0]
    rsb r0, r3, #0x1
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021e276c
    b .L_88
.L_68:
    ldrh r3, [r0, #0x2]
    mov r2, #0x1
    ldrh r1, [r0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2
    rsb r0, r0, #0x1
    bl func_ov002_021e276c
.L_88:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
