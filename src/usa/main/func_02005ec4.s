; func_02005ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c94
        .extern func_02093b08
        .extern func_02094410
        .extern func_0209a1bc
        .extern func_0209a304
        .extern func_0209a3b0
        .global func_02005ec4
        .arm
func_02005ec4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x2c
    bl func_02094410
    bl func_0209a3b0
    add r0, sp, #0x0
    bl func_0209a304
    cmp r0, #0x0
    beq .L_1c8
    add r0, sp, #0x0
    bl func_0209a1bc
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_1c8:
    bl func_02093b08
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103c94
