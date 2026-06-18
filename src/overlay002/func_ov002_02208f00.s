; func_ov002_02208f00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .global func_ov002_02208f00
        .arm
func_ov002_02208f00:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    movne r0, #0x0
    bxne lr
    ldr r2, [r0, #0x4]
    ldr r1, _LIT1
    and r2, r2, #0x1
    ldr ip, [r0, #0x20]
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, ip, r0
    ldr r1, _LIT2
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, _LIT3
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
