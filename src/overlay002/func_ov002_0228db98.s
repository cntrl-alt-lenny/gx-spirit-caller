; func_ov002_0228db98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .global func_ov002_0228db98
        .arm
func_ov002_0228db98:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    mov r3, #0x14
    ldr ip, _LIT1
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r0, lr, r2, ip
    ldr r0, [r3, r0]
    mov r0, r0, lsr #0x8
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    cmp r1, #0x4
    movle r0, #0x1
    movgt r0, #0x0
    add r0, r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
