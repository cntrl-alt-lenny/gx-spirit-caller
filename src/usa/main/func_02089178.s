; func_02089178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5720
        .global func_02089178
        .arm
func_02089178:
    ldr r1, _LIT0
    ldr r3, [r1]
    ldr r2, [r3, #0x8c]
    ldr r1, [r2, #0x14]
    cmp r1, #0x0
    moveq r2, #0x0
    addne r2, r2, r1
    cmp r2, #0x0
    moveq r0, #0x0
    bxeq lr
    cmp r0, #0x0
    movlt r0, #0x0
    bxlt lr
    ldr r1, [r2]
    cmp r0, r1
    movcs r0, #0x0
    bxcs lr
    add r0, r2, r0, lsl #0x2
    ldr r1, [r0, #0x4]
    ldr r0, [r3, #0x8c]
    cmp r1, #0x0
    moveq r0, #0x0
    addne r0, r0, r1
    bx lr
_LIT0: .word data_021a5720
