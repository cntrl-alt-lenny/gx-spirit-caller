; func_02095c48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092904
        .global func_02095c48
        .arm
func_02095c48:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
    str r4, [r0, #0x4]
    strh r4, [r0, #0x8]
    strh r4, [r0, #0xa]
    mov ip, r0
    str r4, [r0]
    mov r3, r4
    mvn r2, #0x0
.L_54:
    mov lr, r3
    str r3, [ip, #0x40]
.L_5c:
    add r1, ip, lr, lsl #0x1
    add lr, lr, #0x1
    strh r2, [r1, #0x20]
    cmp lr, #0x10
    blt .L_5c
    add r4, r4, #0x1
    cmp r4, #0x10
    add ip, ip, #0x24
    blt .L_54
    mov r3, #0x0
    mvn r2, #0x0
.L_88:
    add r1, r0, r3, lsl #0x1
    add r1, r1, #0x200
    add r3, r3, #0x1
    strh r2, [r1, #0x60]
    cmp r3, #0x10
    blt .L_88
    mov r1, #0x280
    bl func_02092904
    ldmia sp!, {r4, lr}
    bx lr
