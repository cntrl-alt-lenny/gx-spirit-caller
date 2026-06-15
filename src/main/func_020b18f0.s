; func_020b18f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3654
        .global func_020b18f0
        .arm
func_020b18f0:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
.L_a4:
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    blt .L_bc
    cmp r2, #0x80
    bge .L_bc
    ldrb r2, [r3, r2]
.L_bc:
    ldrb lr, [r1], #0x1
    and ip, r2, #0xff
    cmp lr, #0x0
    blt .L_d8
    cmp lr, #0x80
    bge .L_d8
    ldrb lr, [r3, lr]
.L_d8:
    and r2, lr, #0xff
    cmp ip, r2
    mvncc r0, #0x0
    ldmccia sp!, {r3, pc}
    movhi r0, #0x1
    ldmhiia sp!, {r3, pc}
    cmp ip, #0x0
    bne .L_a4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c3654
