; func_0201b504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019210
        .extern func_0201afdc
        .global func_0201b504
        .arm
func_0201b504:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x44
    mov r4, r0
    bl GetSystemWork
    mov r1, #0x0
    mov r5, r0
    str r1, [sp]
    add r2, sp, #0x4
    add r3, sp, #0x0
    mov r0, r4
    mov r1, #0x1
    bl func_0201afdc
    ldr r2, [sp]
    mov r6, #0x0
    cmp r2, #0x0
    ble .L_7f8
    ldr r9, _LIT0
    add r7, sp, #0x4
    and r4, r4, #0xff
    mov r8, #0x18
.L_7a4:
    ldr r0, [r7]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_02019210
    sub r1, r0, #0x1
    mla r0, r1, r8, r5
    ldr r1, [r0, #0x8]
    add r6, r6, #0x1
    bic r1, r1, #0xff
    orr r2, r1, r4
    str r2, [r0, #0x8]
    ldr r1, [r7], #0x4
    and r2, r2, r9
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0xf
    str r1, [r0, #0x8]
    ldr r2, [sp]
    cmp r6, r2
    blt .L_7a4
.L_7f8:
    ldr r1, [r5, #0x8f8]
    mov r0, r1, lsl #0x18
    add r0, r2, r0, lsr #0x18
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r5, #0x8f8]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0xfffe01ff
