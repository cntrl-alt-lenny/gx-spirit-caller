; func_02092e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6638
        .extern func_02092f04
        .global func_02092e90
        .arm
func_02092e90:
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    movne lr, pc
    bxne ip
    ldr ip, _LIT1
    stmdb ip!, {r0, r1, r2, r3, sp, lr}
    and r0, sp, #0x1
    mov sp, ip
    mrs r1, CPSR
    and r1, r1, #0x1f
    teq r1, #0x17
    bne .L_3c
    bl func_02092f04
    b .L_48
.L_3c:
    teq r1, #0x1b
    bne .L_48
    bl func_02092f04
.L_48:
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
.L_54:
    beq .L_54
.L_58:
    nop
    b .L_58
    ldmia sp!, {r0, r1, r2, r3, ip, lr}
    mov sp, ip
    bx lr
_LIT0: .word data_021a6638
_LIT1: .word 0x02000000
