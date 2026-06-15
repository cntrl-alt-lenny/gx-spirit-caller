; func_020529e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02051f1c
        .extern func_0205230c
        .extern func_0205236c
        .extern func_02052768
        .extern func_02052b34
        .global func_020529e8
        .arm
func_020529e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    mov r5, r3
    bl func_0205236c
    mov r4, r0
    mov r0, r7
    mov r1, r8
    bl func_02052b34
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x1
    strb r0, [r4, #0x1c]
    str r6, [r4]
    mov r0, #0x0
    str r0, [r4, #0xc]
    add r0, sp, #0x0
    mov r1, r8
    mov r2, r5
    str r5, [r4, #0x14]
    bl func_02052768
    add r1, sp, #0x0
    mov r0, r7
    mov r2, #0x8
    mov r3, #0x1
    bl func_0205230c
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x600
    ldrh r9, [r0, #0x10]
    mov r0, r7
    cmp r5, r9
    movle r9, r5
    bl func_02051f1c
    cmp r9, r0
    addgt sp, sp, #0xc
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r9
    mov r3, #0x1
    bl func_0205230c
    ldr r0, [r4, #0xc]
    add r0, r0, r9
    str r0, [r4, #0xc]
    ldr r0, [r4, #0x14]
    ldr r1, [r4, #0xc]
    cmp r1, r0
    bne .L_2e4
    mov r2, #0x0
    strb r2, [r4, #0x1c]
    str r2, [r4]
    str r2, [r4, #0xc]
    ldr r1, _LIT0
    str r2, [r4, #0x14]
    ldr r1, [r1]
    ldr r2, [r1, #0x600]
    cmp r2, #0x0
    beq .L_2e4
    cmp r8, #0x1
    bne .L_2e4
    mov r1, r7
    blx r2
.L_2e4:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219e3ec
