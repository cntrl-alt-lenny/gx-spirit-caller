; func_02019018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .global func_02019018
        .arm
func_02019018:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r2, [r0, #0x8d4]
    ldr r1, _LIT0
    mov r3, r2, lsl #0x10
    add r3, r4, r3, lsr #0x10
    and r2, r2, r1, lsl #0x10
    cmp r3, r1
    orrhi r1, r2, r1
    movls r1, r3, lsl #0x10
    orrls r1, r2, r1, lsr #0x10
    str r1, [r0, #0x8d4]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ffff
