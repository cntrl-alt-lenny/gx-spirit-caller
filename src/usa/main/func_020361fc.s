; func_020361fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02036030
        .global func_020361fc
        .arm
func_020361fc:
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r0
    mov r4, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrsb r0, [r5, #0x6a]
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    movlt r4, #0x0
    strlt r4, [r5, #0x5c]
    ldr r0, [r5, #0x5c]
    cmp r0, #0x0
    beq .L_208
    mov r1, r4
    bl func_02036030
.L_208:
    mov r0, r5
    mov r1, r4
    bl func_02036030
    ldmia sp!, {r3, r4, r5, pc}
