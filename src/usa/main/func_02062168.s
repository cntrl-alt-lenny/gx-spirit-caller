; func_02062168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061be8
        .extern func_02061f30
        .extern func_02062888
        .global func_02062168
        .arm
func_02062168:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xc]
    cmp r2, #0x5
    bge .L_98
    ldr r0, [r4, #0x10]
    mov r3, #0x0
    cmp r0, #0x0
    beq .L_44
    ldr r2, [r4, #0x20]
    cmp r2, #0x0
    beq .L_60
    ldr r0, [r4, #0x1c]
    sub r0, r1, r0
    cmp r0, r2
    movhi r3, #0x1
    b .L_60
.L_44:
    cmp r2, #0x4
    bge .L_60
    ldr r2, [r4, #0x1c]
    ldr r0, _LIT0
    sub r1, r1, r2
    cmp r1, r0
    movhi r3, #0x1
.L_60:
    cmp r3, #0x0
    beq .L_98
    mov r0, r4
    bl func_02062888
    mov r0, r4
    bl func_02061f30
    mov r2, #0x0
    mov r0, r4
    mov r3, r2
    mov r1, #0x6
    bl func_02061be8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_98:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ea60
