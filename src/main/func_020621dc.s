; func_020621dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061c5c
        .extern func_02061fa4
        .extern func_020628fc
        .global func_020621dc
        .arm
func_020621dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xc]
    cmp r2, #0x5
    bge .L_d34
    ldr r0, [r4, #0x10]
    mov r3, #0x0
    cmp r0, #0x0
    beq .L_ce0
    ldr r2, [r4, #0x20]
    cmp r2, #0x0
    beq .L_cfc
    ldr r0, [r4, #0x1c]
    sub r0, r1, r0
    cmp r0, r2
    movhi r3, #0x1
    b .L_cfc
.L_ce0:
    cmp r2, #0x4
    bge .L_cfc
    ldr r2, [r4, #0x1c]
    ldr r0, _LIT0
    sub r1, r1, r2
    cmp r1, r0
    movhi r3, #0x1
.L_cfc:
    cmp r3, #0x0
    beq .L_d34
    mov r0, r4
    bl func_020628fc
    mov r0, r4
    bl func_02061fa4
    mov r2, #0x0
    mov r0, r4
    mov r3, r2
    mov r1, #0x6
    bl func_02061c5c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_d34:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ea60
