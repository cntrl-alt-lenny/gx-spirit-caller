; func_02062e78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101450
        .extern func_02061364
        .extern func_020613f0
        .extern func_02061464
        .extern func_020614bc
        .extern func_02062f4c
        .extern func_02064338
        .global func_02062e78
        .arm
func_02062e78:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r5, r2
    add r0, r7, #0x50
    mov r6, r1
    mov r4, r3
    bl func_020614bc
    cmp r0, r5
    bge .L_48
    mov r0, r7
    bl func_02064338
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    strne r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_48:
    ldrh r1, [r7, #0x64]
    mov r0, r7
    mov r2, r5
    bl func_02062f4c
    cmp r0, #0x0
    bne .L_80
    mov r0, r7
    bl func_02064338
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    strne r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_80:
    ldr r1, _LIT0
    add r0, r7, #0x50
    mov r2, #0x2
    bl func_02061364
    add r0, r7, #0x50
    and r1, r6, #0xff
    bl func_02061464
    ldrh r1, [r7, #0x64]
    add r0, r7, #0x50
    add r2, r1, #0x1
    strh r2, [r7, #0x64]
    bl func_020613f0
    ldrh r1, [r7, #0x66]
    add r0, r7, #0x50
    bl func_020613f0
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101450
