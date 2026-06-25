; func_ov002_02202afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .global func_ov002_02202afc
        .arm
func_ov002_02202afc:
    cmp r1, #0x0
    beq .L_1c
    ldrh r2, [r1]
    ldrh r1, [r0]
    cmp r2, r1
    moveq r0, #0x0
    bxeq lr
.L_1c:
    ldrh r1, [r0, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    bne .L_8c
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r2, [r0]
    rsb r1, r3, #0x1
    cmp r2, r1
    ldr r2, [r0, #0x4]
    ldr ip, [r0, #0x20]
    cmpeq r2, r3
    bne .L_8c
    cmp ip, #0x4
    bgt .L_8c
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r2, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, ip, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    bxne lr
.L_8c:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
