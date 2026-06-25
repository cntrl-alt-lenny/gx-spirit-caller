; func_ov002_02203840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf0c2
        .global func_ov002_02203840
        .arm
func_ov002_02203840:
    ldrh r3, [r0, #0x2]
    mov r0, r3, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x14
    bne .L_60
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    beq .L_60
    mov r0, r3, lsl #0x1f
    mov r2, r0, lsr #0x1f
    mov r1, r3, lsl #0x1a
    and ip, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    ldr r0, _LIT1
    ldr r3, _LIT2
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    bxne lr
.L_60:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c2
