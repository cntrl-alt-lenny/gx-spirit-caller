; func_020338b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033864
        .extern func_02046ae0
        .global func_020338b8
        .arm
func_020338b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02046ae0
    cmp r0, #0x1
    ble .L_1c
    mov r0, r4
    bl func_02033864
.L_1c:
    ldr r1, [r4, #0xeb4]
    mov r0, #0x0
    bic r3, r1, #0x2000
    bic r1, r3, #0x1000
    bic r2, r1, #0x4000
    bic r1, r2, #0x10000
    bic r1, r1, #0x40000
    str r1, [r4, #0xeb4]
    ldmia sp!, {r4, pc}
