; func_02057d5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000d0
        .extern data_021001cc
        .extern data_021001f0
        .extern func_02054140
        .extern func_02057f3c
        .extern func_020580a0
        .extern func_020a6d54
        .global func_02057d5c
        .arm
func_02057d5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r9, r1
    ldr r1, [r9, #0x28]
    mov sl, r0
    mov r8, r2
    mov r7, r3
    cmp r1, #0x0
    bne .L_38
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xfb
    bl func_020a6d54
.L_38:
    cmp r7, #0x0
    mov r6, #0x0
    addeq sp, sp, #0x14
    moveq r0, r6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r9, #0x30]
    ldr r0, [r9, #0x34]
    subs r0, r1, r0
    bne .L_c4
    ldr r0, [r9, #0x38]
    bl func_02054140
    cmp r0, #0x0
    bne .L_c4
    ldr fp, _LIT2
    add r5, sp, #0xc
    add r4, sp, #0x10
.L_78:
    str r5, [sp]
    str r4, [sp, #0x4]
    str fp, [sp, #0x8]
    ldr r1, [r9, #0x8]
    mov r0, sl
    mov r3, r7
    add r2, r8, r6
    bl func_02057f3c
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    addne r6, r6, r0
    subne r7, r7, r0
    cmp r0, #0x0
    beq .L_c4
    cmp r7, #0x0
    bne .L_78
.L_c4:
    cmp r7, #0x0
    beq .L_ec
    mov r0, sl
    mov r3, r7
    add r1, r9, #0x28
    add r2, r8, r6
    bl func_020580a0
    cmp r0, #0x0
    addne sp, sp, #0x14
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ec:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021001cc
_LIT1: .word data_021000d0
_LIT2: .word data_021001f0
