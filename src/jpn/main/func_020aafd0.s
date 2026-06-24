; func_020aafd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aafd0
        .arm
func_020aafd0:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    ldrneb r2, [r1]
    cmpne r2, #0x0
    ldmeqia sp!, {r4, pc}
    ldrb r3, [r0]
    add r4, r0, #0x1
    cmp r3, #0x0
    beq .L_64
.L_24:
    cmp r3, r2
    bne .L_58
    mov lr, r4
    add ip, r1, #0x1
.L_34:
    ldrb r3, [ip], #0x1
    ldrb r0, [lr], #0x1
    cmp r0, r3
    bne .L_4c
    cmp r0, #0x0
    bne .L_34
.L_4c:
    cmp r3, #0x0
    subeq r0, r4, #0x1
    ldmeqia sp!, {r4, pc}
.L_58:
    ldrb r3, [r4], #0x1
    cmp r3, #0x0
    bne .L_24
.L_64:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
