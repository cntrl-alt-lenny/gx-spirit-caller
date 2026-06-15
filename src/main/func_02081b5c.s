; func_02081b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081bd8
        .extern func_02081d18
        .global func_02081b5c
        .arm
func_02081b5c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrb r0, [r8, #0x9]
    mov r7, r1
    mov r5, #0x1
    cmp r0, #0x0
    mov r6, #0x0
    bls .L_70
    add r4, r8, #0x8
.L_28:
    ldrh r0, [r8, #0xe]
    mov r1, r7
    ldrh r2, [r4, r0]
    add r0, r4, r0
    mla r0, r2, r6, r0
    ldr r0, [r0, #0x4]
    add r9, r8, r0
    mov r0, r9
    bl func_02081d18
    and r5, r5, r0
    mov r0, r9
    mov r1, r7
    bl func_02081bd8
    ldrb r1, [r8, #0x9]
    add r6, r6, #0x1
    and r5, r5, r0
    cmp r6, r1
    bcc .L_28
.L_70:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
