; func_0206c380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206c9d8
        .extern func_02070dc0
        .extern func_02070e24
        .extern func_02070e5c
        .extern func_02070f00
        .extern func_02070f40
        .global func_0206c380
        .arm
func_0206c380:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x4]
    mov r0, r4
    bl func_02070f40
    ldrsb r0, [r4, #0x73]
    ldr r1, [r4, #0x68]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_60
    b .L_38
    b .L_48
    b .L_5c
    b .L_60
    b .L_38
.L_38:
    add r0, r1, #0x20
    bl func_02070e24
    bl func_02070e5c
    b .L_60
.L_48:
    bl func_02070e5c
    bl func_02070f00
    ldr r0, _LIT0
    bl func_02070dc0
    b .L_60
.L_5c:
    bl func_02070f00
.L_60:
    mov r0, #0x1
    strh r0, [r4, #0x70]
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206c9d8
