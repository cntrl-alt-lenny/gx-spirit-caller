; func_0203c918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c8b0
        .global func_0203c918
        .arm
func_0203c918:
    stmdb sp!, {r4, lr}
    mov r0, #0x1
    bl func_0203c8b0
    mov r4, r0
    ldrb r0, [r4, #0x8]
    ands r0, r0, #0x10
    beq .L_44
    mov r0, #0x10
    bl func_0203c8b0
    ldrb r3, [r4, #0x8]
    mov r1, r0
    ldr r2, _LIT0
    bic r0, r3, #0x10
    strb r0, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r0, #0x10
    blx r3
.L_44:
    ldrb r0, [r4, #0x8]
    ands r0, r0, #0x8
    beq .L_78
    mov r0, #0x8
    bl func_0203c8b0
    ldrb r2, [r4, #0x8]
    mov r1, r0
    mov r0, #0x8
    bic r2, r2, #0x8
    strb r2, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r2, #0xc
    blx r3
.L_78:
    ldrb r0, [r4, #0x8]
    ands r0, r0, #0x4
    beq .L_ac
    mov r0, #0x4
    bl func_0203c8b0
    ldrb r2, [r4, #0x8]
    mov r1, r0
    mov r0, #0x4
    bic r2, r2, #0x4
    strb r2, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r2, #0x58
    blx r3
.L_ac:
    ldrb r0, [r4, #0x8]
    ands r0, r0, #0x2
    beq .L_e0
    mov r0, #0x2
    bl func_0203c8b0
    ldrb r2, [r4, #0x8]
    mov r1, r0
    mov r0, #0x2
    bic r2, r2, #0x2
    strb r2, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r2, #0x2300
    blx r3
.L_e0:
    ldrb r0, [r4, #0x8]
    ands r1, r0, #0x1
    ldmeqia sp!, {r4, pc}
    bic r0, r0, #0x1
    strb r0, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r1, r4
    mov r0, #0x1
    mov r2, #0x18
    blx r3
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000d18
