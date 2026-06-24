; func_02074a50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee2c
        .global func_02074a50
        .arm
func_02074a50:
    stmdb sp!, {r4, lr}
    ldr r4, [r1, #0xc]
    ldr r2, [r4, #0x828]
    ldr r1, [r4, #0x82c]
    sub r2, r2, r1
    cmp r0, r2
    bcc .L_420
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    beq .L_410
    ldr r1, _LIT0
    ldr r1, [r1]
    blx r1
.L_410:
    mov r0, #0x0
    str r0, [r4, #0x824]
    ldmia sp!, {r4, lr}
    bx lr
.L_420:
    add r0, r1, r0
    str r0, [r4, #0x82c]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ee2c
