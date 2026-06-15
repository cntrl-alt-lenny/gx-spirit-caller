; func_02062a20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_0206133c
        .extern func_020613d8
        .extern func_02061530
        .extern func_02062280
        .extern func_020a7440
        .global func_02062a20
        .arm
func_02062a20:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    mov r7, r1
    cmp r6, #0x2
    blt .L_124
    ldr r1, _LIT0
    mov r0, r7
    mov r2, #0x2
    bl func_020a7440
    cmp r0, #0x0
    beq .L_144
.L_124:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_02062280
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_144:
    add r5, r6, #0x2
    add r0, r8, #0x50
    bl func_02061530
    cmp r0, r5
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, [r8, #0x50]
    ldr r3, [r8, #0x58]
    ldr r1, _LIT0
    add r0, r8, #0x50
    mov r2, #0x2
    add r4, ip, r3
    bl func_020613d8
    mov r1, r7
    mov r2, r6
    add r0, r8, #0x50
    bl func_020613d8
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_02062280
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r2, r5
    add r0, r8, #0x50
    mvn r1, #0x0
    bl func_0206133c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101530
