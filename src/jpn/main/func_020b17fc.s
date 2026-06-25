; func_020b17fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3560
        .global func_020b17fc
        .arm
func_020b17fc:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
.L_8:
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    blt .L_20
    cmp r2, #0x80
    bge .L_20
    ldrb r2, [r3, r2]
.L_20:
    ldrb lr, [r1], #0x1
    and ip, r2, #0xff
    cmp lr, #0x0
    blt .L_3c
    cmp lr, #0x80
    bge .L_3c
    ldrb lr, [r3, lr]
.L_3c:
    and r2, lr, #0xff
    cmp ip, r2
    mvncc r0, #0x0
    ldmccia sp!, {r3, pc}
    movhi r0, #0x1
    ldmhiia sp!, {r3, pc}
    cmp ip, #0x0
    bne .L_8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_020c3560
