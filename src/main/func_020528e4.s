; func_020528e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02045280
        .extern func_020469d0
        .extern func_0205230c
        .global func_020528e4
        .arm
func_020528e4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r6, r1
    mov r4, r2
    bl func_02045280
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_020469d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x600
    ldrh r0, [r0, #0x10]
    cmp r4, r0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    mov r2, r4
    mov r3, #0x0
    bl func_0205230c
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r2, [r0, #0x600]
    cmp r2, #0x0
    beq .L_150
    mov r0, r4
    mov r1, r5
    blx r2
.L_150:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e3ec
