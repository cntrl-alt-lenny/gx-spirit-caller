; func_020629ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101450
        .extern func_020612c8
        .extern func_02061364
        .extern func_020614bc
        .extern func_0206220c
        .extern func_020a734c
        .global func_020629ac
        .arm
func_020629ac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    mov r7, r1
    cmp r6, #0x2
    blt .L_30
    ldr r1, _LIT0
    mov r0, r7
    mov r2, #0x2
    bl func_020a734c
    cmp r0, #0x0
    beq .L_50
.L_30:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_0206220c
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_50:
    add r5, r6, #0x2
    add r0, r8, #0x50
    bl func_020614bc
    cmp r0, r5
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, [r8, #0x50]
    ldr r3, [r8, #0x58]
    ldr r1, _LIT0
    add r0, r8, #0x50
    mov r2, #0x2
    add r4, ip, r3
    bl func_02061364
    mov r1, r7
    mov r2, r6
    add r0, r8, #0x50
    bl func_02061364
    mov r0, r8
    mov r1, r4
    mov r2, r5
    bl func_0206220c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r2, r5
    add r0, r8, #0x50
    mvn r1, #0x0
    bl func_020612c8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101450
