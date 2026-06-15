; func_020a1bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_020a099c
        .extern func_020a1bbc
        .global func_020a1bf8
        .arm
func_020a1bf8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020a099c
    cmp r0, #0x0
    beq .L_1264
    ldr r0, _LIT0
    sub r1, r6, #0x1
    ldr r0, [r0]
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x1000
    str r5, [r0, #0x4e8]
.L_1264:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020a1bbc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a98fc
