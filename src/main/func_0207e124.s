; func_0207e124 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021020f4
        .extern data_021020f8
        .extern data_021a08e0
        .extern func_0207df18
        .extern func_0207df20
        .extern func_0207e0a8
        .extern func_0207e1c4
        .global func_0207e124
        .arm
func_0207e124:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    cmp r5, #0x2
    bhi .L_23c
    mov ip, #0x1
    mov r0, #0x4
    mov r1, #0x3
    mov r2, #0x2
    mov r3, #0x0
    str ip, [sp]
    bl func_0207e1c4
    b .L_258
.L_23c:
    mov ip, #0x1
    mov r0, #0x4
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x2
    str ip, [sp]
    bl func_0207e1c4
.L_258:
    ldr r0, _LIT0
    strh r5, [r0]
    bl func_0207e0a8
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    ldr r0, _LIT4
    str r3, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a08e0
_LIT1: .word func_0207df20
_LIT2: .word data_021020f4
_LIT3: .word func_0207df18
_LIT4: .word data_021020f8
