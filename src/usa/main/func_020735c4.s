; func_020735c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee3c
        .extern func_02073650
        .extern func_02073750
        .extern func_02091680
        .global func_020735c4
        .arm
func_020735c4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, #0x0
    ldr r4, _LIT0
    mov r6, r8
    mov r5, #0x64
.L_ebc:
    mov r0, r9
    bl func_02073650
    mov r7, r6
.L_ec8:
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r0, r5
    bl func_02091680
    mov r0, r9
    bl func_02073750
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    add r7, r7, #0x1
    cmp r7, #0x14
    bcc .L_ec8
    add r8, r8, #0x1
    cmp r8, #0x8
    bcc .L_ebc
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_0219ee3c
