; func_0205ce40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100cb8
        .extern func_02053e58
        .extern func_020540d0
        .extern func_02054140
        .extern func_02057980
        .global func_0205ce40
        .arm
func_0205ce40:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r1
    ldr r1, [r8, #0x30]
    mov r9, r0
    cmp r1, #0x0
    addne sp, sp, #0xc
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0x38]
    bl func_02054140
    cmp r0, #0x0
    beq .L_70c
    ldr r5, _LIT0
    add r4, sp, #0x8
    mov r7, #0x0
.L_68c:
    ldr r0, [r8, #0x38]
    mov r1, r7
    bl func_020540d0
    mov r6, r0
    str r7, [sp]
    str r5, [sp, #0x4]
    ldr r1, [r8, #0x8]
    mov r0, r9
    mov r2, r6
    mov r3, r4
    bl func_02057980
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    bne .L_6cc
    cmp r0, #0x0
    beq .L_6e0
.L_6cc:
    mov r0, #0x6a
    str r0, [r8]
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_6e0:
    ldr r1, [r6, #0xc]
    ldr r0, [r6, #0x8]
    cmp r1, r0
    bne .L_70c
    ldr r0, [r8, #0x38]
    mov r1, r7
    bl func_02053e58
    ldr r0, [r8, #0x38]
    bl func_02054140
    cmp r0, #0x0
    bne .L_68c
.L_70c:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100cb8
