; func_02046888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern data_0219daf4
        .extern func_02062498
        .global func_02046888
        .arm
func_02046888:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, _LIT1
    mov r5, #0x0
.L_24:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_48
    bl func_02062498
    ldrb r0, [r0, #0x1]
    cmp r6, r0
    ldreq r0, _LIT1
    ldreq r0, [r0, r5, lsl #0x2]
    ldmeqia sp!, {r4, r5, r6, pc}
.L_48:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_24
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219daec
_LIT1: .word data_0219daf4
