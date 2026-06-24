; func_02084cd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102200
        .global func_02084cd8
        .arm
func_02084cd8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r6, _LIT0
    add r4, r5, #0x8
.L_2e4:
    ldr r1, [r4]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r4]
    ldr r1, [r5]
    ldrb r3, [r1]
    and r1, r3, #0x1f
    ldr r2, [r6, r1, lsl #0x2]
    and r1, r3, #0xe0
    blx r2
    ldr r0, [r5, #0x8]
    ands r0, r0, #0x20
    beq .L_2e4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02102200
