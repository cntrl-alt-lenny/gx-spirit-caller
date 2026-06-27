; func_ov002_022041a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022d008c
        .extern func_ov002_02207f4c
        .global func_ov002_022041a0
        .arm
func_ov002_022041a0:
    stmdb sp!, {r3, lr}
    ldrh lr, [r0, #0x2]
    mov r2, lr, lsl #0x14
    mov r2, r2, lsr #0x1a
    add r2, r2, #0xee
    add r2, r2, #0xff00
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    cmp r2, #0x1
    bhi .L_90
    ldr r2, _LIT0
    mov ip, lr, lsl #0x1f
    ldr r2, [r2, #0xcec]
    cmp r2, ip, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, _LIT1
    ldr r3, [r2]
    cmp r3, ip, lsr #0x1f
    ldreq r3, [r2, #0x1c]
    moveq r2, lr, lsl #0x1a
    cmpeq r3, r2, lsr #0x1b
    beq .L_88
    ldr r2, _LIT1
    ldr r3, [r2, #0x4]
    cmp r3, ip, lsr #0x1f
    bne .L_80
    ldrh r3, [r0, #0x2]
    ldr ip, [r2, #0x20]
    mov r2, r3, lsl #0x1a
    cmp ip, r2, lsr #0x1b
    beq .L_88
.L_80:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_88:
    bl func_ov002_02207f4c
    ldmia sp!, {r3, pc}
.L_90:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314
