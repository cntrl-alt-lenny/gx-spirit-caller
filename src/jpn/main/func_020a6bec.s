; func_020a6bec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102624
        .extern func_020a7008
        .global func_020a6bec
        .arm
func_020a6bec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, _LIT0
    mov r4, #0x0
    mov r5, #0x1
    mov r8, r0
    mvn r9, #0x0
    mov r7, r4
    mov r6, #0x4c
.L_20:
    ldr r1, [r0, #0x4]
    mov r1, r1, lsl #0x16
    movs r1, r1, lsr #0x1d
    beq .L_3c
    bl func_020a7008
    cmp r0, #0x0
    movne r4, r9
.L_3c:
    cmp r5, #0x3
    movge r0, r7
    bge .L_54
    mul r0, r5, r6
    add r5, r5, #0x1
    add r0, r8, r0
.L_54:
    cmp r0, #0x0
    bne .L_20
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02102624+0x14
