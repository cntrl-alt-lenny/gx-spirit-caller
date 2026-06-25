; func_0200a9ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .global func_0200a9ec
        .arm
func_0200a9ec:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r0, _LIT1
    ldr lr, [r3, #0x4]
    mov r2, #0x6
    mov r1, lr, lsl #0x1d
    mov r1, r1, lsr #0x1d
    add ip, r1, #0x1
    umull r0, r1, ip, r0
    mov r1, r1, lsr #0x2
    umull r0, r1, r2, r1
    sub r1, ip, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, lr, #0x7
    and r0, r0, #0x7
    orr r0, r1, r0
    str r0, [r3, #0x4]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0xaaaaaaab
