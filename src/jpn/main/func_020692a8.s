; func_020692a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebec
        .extern func_02054ca0
        .extern func_02054dfc
        .extern func_02054f8c
        .extern func_020552bc
        .extern func_0206840c
        .extern func_0206844c
        .extern func_02068454
        .extern func_0206b688
        .extern func_0206b764
        .global func_020692a8
        .arm
func_020692a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r1, #0x8
    mov sl, r0
    str r1, [sp, #0x10]
    ldr r0, [sl, #0x4b0]
    bl func_02054f8c
    cmp r0, #0x0
    beq .L_d4
    add r9, sp, #0x8
    add r8, sp, #0x10
    add fp, sp, #0x14
    mov r5, #0x11
    mov r7, #0x0
    mvn r4, #0x0
.L_40:
    str r9, [sp]
    str r8, [sp, #0x4]
    ldr r0, [sl, #0x4b0]
    ldr r2, _LIT1
    mov r1, fp
    mov r3, r7
    bl func_02054ca0
    mvn r1, #0x0
    cmp r0, r1
    beq .L_c4
    ldrh r2, [sp, #0xa]
    ldr r1, [sp, #0xc]
    mov r0, sl
    bl func_0206b688
    cmp r0, r4
    bne .L_c4
    ldrh r2, [sp, #0xa]
    ldr r1, [sp, #0xc]
    mov r0, sl
    bl func_02068454
    mov r6, r0
    bl func_0206840c
    cmp r0, #0x0
    ldrne ip, _LIT0
    movne r0, #0x5
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r6
    mov r1, r5
    bl func_0206844c
    mov r0, sl
    mov r1, r6
    bl func_0206b764
.L_c4:
    ldr r0, [sl, #0x4b0]
    bl func_02054f8c
    cmp r0, #0x0
    bne .L_40
.L_d4:
    bl func_020552bc
    ldr r1, [sl, #0x4b4]
    sub r0, r0, r1
    cmp r0, #0x7d0
    bls .L_11c
    ldr r0, [sl, #0x4b0]
    bl func_02054dfc
    mvn r0, #0x0
    str r0, [sl, #0x4b0]
    mov r0, #0x1
    str r0, [sl]
    ldr r0, _LIT2
    ldr r3, [sl, #0x494]
    ldr r2, [r0]
    ldr r4, [sl, #0x488]
    mov r0, sl
    mov r1, #0x3
    blx r4
.L_11c:
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000005f4
_LIT1: .word 0x000005db
_LIT2: .word data_0219ebec
