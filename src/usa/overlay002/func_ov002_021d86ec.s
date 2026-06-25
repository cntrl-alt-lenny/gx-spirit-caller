; func_ov002_021d86ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021d46ac
        .global func_ov002_021d86ec
        .arm
func_ov002_021d86ec:
    ldr r2, _LIT0
    cmp r0, #0x0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    ldr r1, [r1, #0x260]
    movne r3, #0x8000
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    moveq r3, #0x0
    orr r2, r3, #0x29
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r1, r0, r1, lsr #0x1f
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr ip, _LIT2
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, #0x0
    bx ip
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word func_ov002_021d46ac
