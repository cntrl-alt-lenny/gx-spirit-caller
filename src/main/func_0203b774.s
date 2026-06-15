; func_0203b774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203af44
        .extern func_0203af58
        .extern func_0203b158
        .extern func_0203b3b8
        .extern func_0203b6b4
        .global func_0203b774
        .arm
func_0203b774:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrb r0, [r7, #0xbf]
    ldr r3, [r7, #0x78]
    mov r5, r2
    mov r6, r1
    cmp r0, #0x0
    add r4, r3, r5, lsl #0x5
    beq .L_894
.L_840:
    mov r0, r7
    mov r1, r5
    bl func_0203b158
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0203b3b8
    cmp r0, #0x0
    beq .L_884
    mov r0, r7
    mov r1, r4
    bl func_0203b6b4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_884:
    cmp r5, #0x0
    bne .L_840
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_894:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_0203af58
    cmp r0, #0x0
    bne .L_8bc
    cmp r5, #0x0
    bne .L_894
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_8bc:
    mov r0, r4
    bl func_0203af44
    mov r0, r7
    mov r1, r4
    bl func_0203b6b4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
