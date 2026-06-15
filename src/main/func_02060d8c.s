; func_02060d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101358
        .global func_02060d8c
        .arm
func_02060d8c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, #0x0
    cmp r1, #0x0
    ldr lr, [r2]
    ldmleia sp!, {r4, pc}
.L_e8:
    ldrsb ip, [r0, r4]
    ldrsb r3, [lr]
    eor r3, ip, r3
    strb r3, [r0, r4]
    ldrsb r3, [lr, #0x1]!
    add r4, r4, #0x1
    cmp r3, #0x0
    ldreq lr, [r2]
    cmp r4, r1
    blt .L_e8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101358
